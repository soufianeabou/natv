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
  final GlobalKey _playerKey = GlobalKey(debugLabel: 'youtube_player');
  bool _isPlayerReady = false;
  bool _isFullscreen = false;
  bool _isTransitioning = false; // Prevent multiple transitions
  final _manager = VideoControllerManager();
  OverlayEntry? _overlayEntry;
  
  // Cache the player widget to avoid rebuilds
  Widget? _cachedPlayer;
  Widget? _cachedFullscreenPlayer;

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
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        controlsVisibleAtStart: true,
        hideControls: false,
        useHybridComposition: true,
        hideThumbnail: false, // Keep thumbnail for better loading
      ),
    );
    
    // Add listener for better state management
    _controller.addListener(_onPlayerStateChanged);
    _manager.registerController(_controller);
    print('YouTube Player initializing with video ID: ${widget.videoId}');
  }

  void _onPlayerStateChanged() {
    if (!mounted) return;
    
    // Only update state when necessary
    final isReady = _controller.value.isReady;
    if (_isPlayerReady != isReady) {
      setState(() {
        _isPlayerReady = isReady;
        // Clear cached players when state changes
        _cachedPlayer = null;
        _cachedFullscreenPlayer = null;
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    
    // Handle app lifecycle to prevent issues
    switch (state) {
      case AppLifecycleState.paused:
        _controller.pause();
        break;
      case AppLifecycleState.resumed:
        // Don't auto-resume, let user control
        break;
      case AppLifecycleState.detached:
        _controller.pause();
        break;
      case AppLifecycleState.inactive:
        // Handle brief interruptions
        break;
      case AppLifecycleState.hidden:
        _controller.pause();
        break;
    }
  }

  void _showFullscreenOverlay() async {
    if (_isFullscreen || _isTransitioning) return; // Prevent multiple calls
    
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
        return false; // We handle the pop manually
      },
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Material(
            color: Colors.black,
            child: SafeArea(
              child: GestureDetector(
                // Allow tapping outside to exit
                onTap: () {
                  // Only exit if tapping outside the player
                },
                child: Stack(
                  children: [
                    // Video player centered
                    Center(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: _buildYoutubePlayer(),
                      ),
                    ),
                    // Close button - position based on orientation
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

  Widget _buildYoutubePlayer() {
    return YoutubePlayer(
      key: _playerKey,
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: const Color(0xFFC8AB6B),
      bottomActions: [
        const CurrentPosition(),
        const ProgressBar(isExpanded: true),
        const RemainingDuration(),
        _isFullscreen ? _buildExitFullscreenButton() : _buildFullscreenButton(),
      ],
      aspectRatio: 16 / 9,
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
    );
  }

  Widget _buildExitFullscreenButton() {
    return GestureDetector(
      onTap: _removeFullscreenOverlay,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Icon(
          Icons.fullscreen_exit,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return GestureDetector(
      onTap: _removeFullscreenOverlay,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Icon(
          Icons.close,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  void _removeFullscreenOverlay() async {
    if (!_isFullscreen || _isTransitioning) return; // Prevent multiple calls
    
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
    
    // Always show player - let it handle its own loading state
    return _buildYoutubePlayer();
  }

  Widget _buildFullscreenButton() {
    return GestureDetector(
      onTap: _showFullscreenOverlay,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Icon(
          Icons.fullscreen,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  @override
  void deactivate() {
    if (!_isFullscreen) {
      _controller.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    
    // Clean up overlay synchronously (don't await async operations in dispose)
    _overlayEntry?.remove();
    _overlayEntry = null;
    
    _controller.removeListener(_onPlayerStateChanged);
    _manager.unregisterController(_controller);
    
    // Restore system settings synchronously
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    
    return Container(
      height: widget.height,
      child: _buildNormalPlayer(),
    );
  }

}
