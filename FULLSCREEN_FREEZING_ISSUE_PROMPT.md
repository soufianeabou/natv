# Flutter YouTube & Live Stream Fullscreen Freezing Issue

## Problem Description

I have a Flutter app with two video players that both freeze when entering/exiting fullscreen:

### Issue 1: YouTube Player Fullscreen Freeze
- **Symptom**: When clicking fullscreen button on YouTube videos, the video image freezes on the thumbnail/miniature while audio continues playing normally
- **When it happens**: Only when entering fullscreen - video works fine in normal view and after exiting fullscreen
- **Current behavior**: 
  - Audio plays normally ✅
  - Video image is frozen/stuck on thumbnail ❌
  - After exiting fullscreen, video works normally again ✅

### Issue 2: Live Stream Fullscreen Freeze  
- **Symptom**: When entering fullscreen on live stream (m3u8), the app completely freezes - can't interact, can't exit, but audio continues playing
- **When it happens**: Both entering and exiting fullscreen
- **Current behavior**:
  - App becomes completely unresponsive ❌
  - Audio continues playing ❌
  - Cannot exit fullscreen ❌
  - Have to force close the app

## Technical Context

### YouTube Player Implementation
- Uses `youtube_player_flutter` package
- Uses overlay approach for fullscreen (not native YouTube fullscreen)
- Has transition management with `_isTransitioning` flag
- Hides normal player when in fullscreen to avoid conflicts

### Live Stream Implementation
- Uses `FlutterFlowWebView` (wraps `WebViewX`) for m3u8 playback
- Uses native WebView fullscreen (via `webAllowFullscreenContent: true`)
- Has orientation management in `initState` and `dispose`

## Current Code

### YouTube Player Widget (`lib/videopage/youtube_player_widget.dart`)

```dart
class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  bool _isFullscreen = false;
  bool _isTransitioning = false;
  final _manager = VideoControllerManager();
  OverlayEntry? _overlayEntry;
  Widget? _cachedPlayer;
  Widget? _cachedFullscreenPlayer;

  void _showFullscreenOverlay() async {
    if (_isFullscreen || _isTransitioning) return;
    
    _isTransitioning = true;
    
    try {
      // Ensure controller is ready and playing
      if (_controller.value.isReady && !_controller.value.isPlaying) {
        // Don't auto-play, just ensure it's ready
      }
      
      // Update state FIRST to prevent UI blocking
      if (mounted) {
        setState(() {
          _isFullscreen = true;
        });
      }
      
      // Small delay to let state update
      await Future.delayed(const Duration(milliseconds: 50));
      
      // Create overlay BEFORE system changes
      if (!mounted) {
        _isTransitioning = false;
        return;
      }
      
      _overlayEntry = OverlayEntry(
        builder: (context) => _buildFullscreenOverlay(),
        maintainState: false, // Don't maintain state - force rebuild
        opaque: true,
      );

      Overlay.of(context).insert(_overlayEntry!);
      
      // Now change system UI (non-blocking)
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      
      // Mark transition complete
      if (mounted) {
        setState(() {
          _isTransitioning = false;
        });
      }
    } catch (e) {
      print('Error entering fullscreen: $e');
      _isTransitioning = false;
      _isFullscreen = false;
      if (mounted) {
        setState(() {});
      }
    }
  }

  Widget _buildFullscreenOverlay() {
    return WillPopScope(
      onWillPop: () async {
        _removeFullscreenOverlay();
        return false;
      },
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Material(
            color: Colors.black,
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  // Only exit if tapping outside the player
                },
                child: Stack(
                  children: [
                    Center(
                      child: _buildFullscreenPlayer(),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: _buildCloseButton(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFullscreenPlayer() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: YoutubePlayer(
        key: const ValueKey('fullscreen_player'),
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: const Color(0xFFC8AB6B),
        bottomActions: [
          const CurrentPosition(),
          const ProgressBar(isExpanded: true),
          const RemainingDuration(),
          _buildExitFullscreenButton(),
        ],
        aspectRatio: 16 / 9,
        onReady: () {
          print('Fullscreen player ready - Video ID: ${widget.videoId}');
        },
      ),
    );
  }

  void _removeFullscreenOverlay() async {
    if (!_isFullscreen || _isTransitioning) return;
    
    _isTransitioning = true;
    
    // Update state IMMEDIATELY to unblock UI
    if (mounted) {
      setState(() {
        _isFullscreen = false;
      });
    }
    
    try {
      // Remove overlay
      _overlayEntry?.remove();
      _overlayEntry = null;
      
      // Restore system UI immediately (non-blocking)
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      
      // Small delay then clear cache
      await Future.delayed(const Duration(milliseconds: 200));
      
      // Clear cache and mark transition complete
      if (mounted) {
        setState(() {
          _isTransitioning = false;
          _cachedFullscreenPlayer = null;
          _cachedPlayer = null;
        });
      }
    } catch (e) {
      print('Error exiting fullscreen: $e');
      _isTransitioning = false;
      if (mounted) {
        setState(() {
          _isFullscreen = false;
        });
      }
    }
  }

  Widget _buildNormalPlayer() {
    // Hide normal player when in fullscreen to avoid conflicts
    if (_isFullscreen) {
      return Container(
        height: widget.height,
        color: Colors.black,
      );
    }
    
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: const Color(0xFFC8AB6B),
      onReady: () {
        if (mounted) {
          setState(() {
            _isPlayerReady = true;
          });
        }
        print('YouTube Player Ready - Video ID: ${widget.videoId}');
      },
      onEnded: (data) {
        print('Video ended');
      },
      bottomActions: [
        const CurrentPosition(),
        const ProgressBar(isExpanded: true),
        const RemainingDuration(),
        _buildFullscreenButton(),
      ],
      aspectRatio: 16 / 9,
    );
  }
}
```

### Live Stream Widget (`lib/pages/live_copy_copy/live_copy_copy_widget.dart`)

```dart
class _LiveCopyCopyWidgetState extends State<LiveCopyCopyWidget> {
  late LiveCopyCopyModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveCopyCopyModel());
    _model.switchValue = FlutterFlowModel.globalSwitchValue;
    
    // Allow rotation for live stream fullscreen - let WebView handle it natively
    // Don't force orientation changes here as it conflicts with WebView's native fullscreen
  }

  @override
  void dispose() {
    VideoControllerManager().unregisterLiveStream();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... app bar and other widgets ...
      body: SafeArea(
        child: Column(
          children: [
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
                  VideoControllerManager().registerLiveStream(controller);
                },
              ),
            ),
            // ... rest of content ...
          ],
        ),
      ),
    );
  }
}
```

### FlutterFlowWebView (`lib/flutter_flow/flutter_flow_web_view.dart`)

```dart
class _FlutterFlowWebViewState extends State<FlutterFlowWebView> {
  @override
  Widget build(BuildContext context) => WebViewX(
        key: webviewKey,
        width: widget.width ?? MediaQuery.sizeOf(context).width,
        height: widget.height ?? MediaQuery.sizeOf(context).height,
        ignoreAllGestures: false,
        initialContent: widget.content,
        initialMediaPlaybackPolicy:
            AutoMediaPlaybackPolicy.requireUserActionForAllMediaTypes,
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
        webSpecificParams: const WebSpecificParams(
          webAllowFullscreenContent: true,
        ),
        mobileSpecificParams: MobileSpecificParams(
          debuggingEnabled: false,
          gestureNavigationEnabled: true,
          androidEnableHybridComposition: true,
        ),
      );
}
```

## Requirements

1. **YouTube Player**: Fix the thumbnail freeze when entering fullscreen - video should play smoothly in fullscreen overlay
2. **Live Stream**: Fix the complete app freeze when entering/exiting fullscreen - app should remain responsive
3. **Keep existing approach**: 
   - YouTube: Keep overlay approach (don't use native YouTube fullscreen)
   - Live Stream: Keep WebView native fullscreen approach
4. **Minimal changes**: Don't break what's already working (normal playback, navigation, etc.)

## What I've Tried

1. ✅ Hiding normal player when in fullscreen
2. ✅ Using stable keys for fullscreen player
3. ✅ Adding transition flags to prevent multiple calls
4. ✅ Removing orientation changes from live stream initState
5. ✅ Setting `maintainState: false` on overlay
6. ❌ Still freezing

## Expected Behavior

- **YouTube**: Click fullscreen → Video continues playing smoothly in overlay → Click exit → Video continues playing normally
- **Live Stream**: Click fullscreen → Video goes fullscreen natively → Can interact and exit → App remains responsive

## Environment

- Flutter SDK: Latest
- Package: `youtube_player_flutter: ^9.1.3`
- Package: `webviewx_plus: ^0.5.1`
- Platform: Android (emulator and real device)
- Issue occurs on both platforms

Please provide a complete solution that fixes both issues while maintaining the existing architecture.

