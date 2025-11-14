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
    with WidgetsBindingObserver {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  bool _isFullscreen = false;
  final _manager = VideoControllerManager();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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
    
    // Handle fullscreen state changes
    if (isFullscreen != _isFullscreen) {
      if (isFullscreen) {
        _enterFullscreen();
      } else {
        _exitFullscreen();
      }
    }
    
    // Update ready state
    if (_isPlayerReady != isReady) {
      setState(() {
        _isPlayerReady = isReady;
      });
    }
  }

  void _enterFullscreen() {
    if (_isFullscreen) return;
    
    setState(() {
      _isFullscreen = true;
    });
    
    // Set system UI for fullscreen
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [],
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
    
    print('YouTube Player: Entered fullscreen mode');
  }

  void _exitFullscreen() {
    if (!_isFullscreen) return;
    
    setState(() {
      _isFullscreen = false;
    });
    
    // Restore system UI
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: SystemUiOverlay.values,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    
    print('YouTube Player: Exited fullscreen mode');
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
        // Do nothing, let user control playback
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
    _controller.removeListener(_onPlayerStateChanged);
    
    // Restore orientation on dispose
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: const Color(0xFFC8AB6B),
        progressColors: const ProgressBarColors(
          playedColor: Color(0xFFC8AB6B),
          handleColor: Color(0xFFC8AB6B),
        ),
        onReady: () {
          setState(() {
            _isPlayerReady = true;
          });
          print('YouTube Player Ready - Video ID: ${widget.videoId}');
        },
        onEnded: (data) {
          print('YouTube Player: Video ended');
        },
      ),
      builder: (context, player) {
        return Container(
          height: _isFullscreen ? null : widget.height,
          decoration: _isFullscreen ? null : BoxDecoration(
            color: Colors.black,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: _isFullscreen 
            ? player 
            : ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: player,
              ),
        );
      },
    );
  }
}
