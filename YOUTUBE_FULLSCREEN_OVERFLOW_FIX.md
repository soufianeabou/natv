# YouTube Player Fullscreen Overflow Fix

## Problem Description

I have a Flutter app with two video players that handle fullscreen differently:

1. **Live Stream (M3U8) - WORKS CORRECTLY**: Uses `FlutterFlowWebView` with WebView native fullscreen. No overflow issues.
2. **YouTube Player - HAS OVERFLOW**: Uses `youtube_player_flutter` package. When entering fullscreen, there are overflow errors and UI misorganization.

**Current Behavior:**
- YouTube player fullscreen causes overflow errors
- UI elements are misaligned in fullscreen mode
- The live stream fullscreen works perfectly without any issues

**Desired Behavior:**
- YouTube player should use the same native fullscreen mechanism as the live stream
- No overflow errors in fullscreen mode
- Proper UI organization in fullscreen
- Orientation should unlock in fullscreen and lock to portrait when exiting

## Code in Question

### 1. Live Stream Player (WORKS - No Overflow)

**File:** `lib/pages/live_copy_copy/live_copy_copy_widget.dart`

```dart
// Video Player - Reduced height
Container(
  width: double.infinity,
  child: FlutterFlowWebView(
    content: 'https://mn-nl.mncdn.com/nafrica_tv/live/index.m3u8',
    bypass: false,
    width: MediaQuery.sizeOf(context).width * 1.729,
    height: 180.0,
    verticalScroll: false,
    horizontalScroll: false,
    onControllerCreated: (controller) {
      // Register live stream controller
      VideoControllerManager().registerLiveStream(controller);
    },
  ),
),
```

**FlutterFlowWebView Implementation:** `lib/flutter_flow/flutter_flow_web_view.dart`

```dart
Widget build(BuildContext context) => WebViewX(
  key: webviewKey,
  width: widget.width ?? MediaQuery.sizeOf(context).width,
  height: widget.height ?? MediaQuery.sizeOf(context).height,
  ignoreAllGestures: false,
  initialContent: widget.content,
  initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.requireUserActionForAllMediaTypes,
  initialSourceType: widget.html
      ? SourceType.html
      : widget.bypass
          ? SourceType.urlBypass
          : SourceType.url,
  javascriptMode: JavascriptMode.unrestricted,
  onWebViewCreated: (controller) async {
    if (controller.connector is WebViewController && isAndroid) {
      final androidController =
          controller.connector.platform as AndroidWebViewController;
      await androidController.setOnShowFileSelector(_androidFilePicker);
    }
    widget.onControllerCreated?.call(controller);
  },
  navigationDelegate: (request) async {
    if (isAndroid) {
      if (request.content.source.startsWith('https://api.whatsapp.com/send?phone')) {
        String url = request.content.source;
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        return NavigationDecision.prevent;
      }
    }
    return NavigationDecision.navigate;
  },
  webSpecificParams: const WebSpecificParams(
    webAllowFullscreenContent: true,  // This enables native WebView fullscreen
  ),
  mobileSpecificParams: MobileSpecificParams(
    debuggingEnabled: false,
    gestureNavigationEnabled: true,
    mobileGestureRecognizers: {
      if (widget.verticalScroll)
        Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer()),
      if (widget.horizontalScroll)
        Factory<HorizontalDragGestureRecognizer>(() => HorizontalDragGestureRecognizer()),
    },
    androidEnableHybridComposition: true,
  ),
);
```

### 2. YouTube Player (HAS OVERFLOW ISSUES)

**File:** `lib/videopage/youtube_player_widget.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'video_controller_manager.dart';

class YouTubePlayerWidget extends StatefulWidget {
  final String videoId;
  final double? height;

  const YouTubePlayerWidget({
    Key? key,
    required this.videoId,
    this.height = 240,
  }) : super(key: key);

  @override
  State<YouTubePlayerWidget> createState() => _YouTubePlayerWidgetState();
}

class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  final _manager = VideoControllerManager();

  @override
  void initState() {
    super.initState();
    _manager.stopAllVideos();
    
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        controlsVisibleAtStart: true,
        hideControls: false,
        useHybridComposition: true,
      ),
    )..addListener(listener);
    
    _manager.registerController(_controller);
  }

  void listener() {
    if (_isPlayerReady && mounted) {
      if (_controller.value.isFullScreen) {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
      setState(() {});
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _manager.unregisterController(_controller);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use WebView native fullscreen (same as live stream) instead of Flutter overlay
    // This prevents overflow issues
    final isFullScreen = _controller.value.isFullScreen;
    
    final player = YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Color(0xFFC8AB6B),
      onReady: () {
        _isPlayerReady = true;
        print('YouTube Player Ready - Video ID: ${widget.videoId}');
      },
      onEnded: (data) {
        print('Video ended');
      },
    );
    
    // When in fullscreen, let WebView handle it natively (no Flutter overlay)
    if (isFullScreen) {
      return player;
    }
    
    // Not in fullscreen - apply styling
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: player,
      ),
    );
  }
}
```

### 3. Video Page Widget (Where YouTube Player is Used)

**File:** `lib/videopage/videopage_widget.dart`

```dart
// Video Player
(widget.videoID != null && widget.videoID!.isNotEmpty)
    ? YouTubePlayerWidget(
        videoId: widget.videoID!,
        height: isLandscape ? 200.0 : 240.0,
      )
    : Container(
        height: isLandscape ? 200.0 : 240.0,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.white70, size: 48),
            SizedBox(height: 16),
            Text(
              'Erreur: Video ID manquant',
              style: GoogleFonts.changa(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
```

## Requirements

1. **Fix the overflow issue** in YouTube player fullscreen mode
2. **Use WebView native fullscreen** (same mechanism as live stream) instead of Flutter overlay
3. **Maintain orientation control**: Unlock orientations in fullscreen, lock to portrait when exiting
4. **Keep all existing functionality**: Video playback, controls, styling when not in fullscreen
5. **Minimal changes**: Don't break what's already working

## What I've Tried

1. Removed `YoutubePlayerBuilder` wrapper - still has overflow
2. Direct `YoutubePlayer` usage - still has overflow
3. Conditional styling based on fullscreen state - still has overflow

## Expected Solution

The YouTube player should use the same native WebView fullscreen API that the live stream uses. The `youtube_player_flutter` package uses WebView internally, so there should be a way to enable native fullscreen similar to how `FlutterFlowWebView` does it with `webAllowFullscreenContent: true`.

Please provide a fix that:
- Eliminates overflow errors in fullscreen
- Uses WebView native fullscreen (not Flutter overlay)
- Maintains orientation control
- Keeps all existing functionality intact

