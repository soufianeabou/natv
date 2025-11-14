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

class _YouTubePlayerWidgetState extends State<YouTubePlayerWidget>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  bool _wasFullscreen = false; // Track previous fullscreen state
  final _manager = VideoControllerManager();
  
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _manager.stopAllVideos();
    
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        controlsVisibleAtStart: true,
        hideControls: false,
        useHybridComposition: true,
        hideThumbnail: false,
      ),
    );
    
    _controller.addListener(_onPlayerStateChanged);
    _manager.registerController(_controller);
    
    print('YouTube Player initializing with video ID: ${widget.videoId}');
  }

  void _onPlayerStateChanged() {
    if (!mounted) return;
    
    final isReady = _controller.value.isReady;
    final isFullscreen = _controller.value.isFullScreen;
    
    // Only handle fullscreen changes when state ACTUALLY changes
    if (isFullscreen != _wasFullscreen) {
      _wasFullscreen = isFullscreen;
      
      if (isFullscreen) {
        print('Entering fullscreen');
        _manager.setYouTubeFullscreen(true);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        print('Exiting fullscreen');
        _manager.setYouTubeFullscreen(false);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.edgeToEdge,
          overlays: SystemUiOverlay.values,
        );
      }
    }
    
    if (_isPlayerReady != isReady) {
      if (mounted) {
        setState(() {
          _isPlayerReady = isReady;
        });
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
        if (_controller.value.isPlaying) {
          _controller.pause();
        }
        break;
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
        break;
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _manager.unregisterController(_controller);
    _manager.setYouTubeFullscreen(false);
    _controller.removeListener(_onPlayerStateChanged);
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: const Color(0xFFC8AB6B),
          progressColors: const ProgressBarColors(
            playedColor: Color(0xFFC8AB6B),
            handleColor: Color(0xFFC8AB6B),
          ),
          onReady: () {
            if (mounted) {
              setState(() {
                _isPlayerReady = true;
              });
            }
            print('YouTube Player Ready - Video ID: ${widget.videoId}');
          },
          onEnded: (data) {
            print('YouTube Player: Video ended');
          },
        ),
      ),
    );
  }
}