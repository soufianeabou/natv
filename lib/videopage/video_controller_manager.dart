import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Global manager to track and stop all active video players
/// Ensures only one video plays at a time and handles proper cleanup
class VideoControllerManager {
  static final VideoControllerManager _instance = VideoControllerManager._internal();
  factory VideoControllerManager() => _instance;
  VideoControllerManager._internal();

  final Set<YoutubePlayerController> _activeControllers = {};
  WebViewController? _liveStreamController;
  bool _isLiveStreamActive = false;
  bool _isYouTubeFullscreen = false; // NEW: Track YouTube fullscreen state

  /// Register a YouTube player controller
  void registerController(YoutubePlayerController controller) {
    _activeControllers.add(controller);
    print('VideoControllerManager: Registered YouTube controller (total: ${_activeControllers.length})');
  }

  /// Unregister a YouTube player controller
  void unregisterController(YoutubePlayerController controller) {
    _activeControllers.remove(controller);
    print('VideoControllerManager: Unregistered YouTube controller (remaining: ${_activeControllers.length})');
  }

  /// Register a live stream WebView controller
  void registerLiveStream(WebViewController controller) {
    _liveStreamController = controller;
    _isLiveStreamActive = true;
    print('VideoControllerManager: Registered live stream controller');
  }

  /// Unregister the live stream controller
  void unregisterLiveStream() {
    _liveStreamController = null;
    _isLiveStreamActive = false;
    print('VideoControllerManager: Unregistered live stream controller');
  }

  /// Set YouTube fullscreen state
  void setYouTubeFullscreen(bool isFullscreen) {
    _isYouTubeFullscreen = isFullscreen;
    print('VideoControllerManager: YouTube fullscreen = $isFullscreen');
  }

  /// Get YouTube fullscreen state
  bool get isYouTubeFullscreen => _isYouTubeFullscreen;

  /// Check if live stream is currently active
  bool get isLiveStreamActive => _isLiveStreamActive;

  /// Check if any YouTube players are active
  bool get hasActiveYouTubePlayers => _activeControllers.isNotEmpty;

  /// Stop all active video players (both YouTube and live stream)
  void stopAllVideos() {
    print('VideoControllerManager: Stopping all videos...');
    
    // Stop all YouTube videos
    int stoppedCount = 0;
    for (var controller in _activeControllers) {
      try {
        if (controller.value.isReady && controller.value.isPlaying) {
          controller.pause();
          stoppedCount++;
        }
      } catch (e) {
        print('VideoControllerManager: Error stopping YouTube controller: $e');
      }
    }
    
    if (stoppedCount > 0) {
      print('VideoControllerManager: Stopped $stoppedCount YouTube players');
    }
    
    // Stop live stream by loading blank page
    if (_liveStreamController != null && _isLiveStreamActive) {
      try {
        _liveStreamController?.loadRequest(Uri.parse('about:blank'));
        print('VideoControllerManager: Stopped live stream');
      } catch (e) {
        print('VideoControllerManager: Error stopping live stream: $e');
      }
    }
  }

  /// Stop only YouTube players
  void stopYouTubePlayers() {
    print('VideoControllerManager: Stopping YouTube players...');
    
    int stoppedCount = 0;
    for (var controller in _activeControllers) {
      try {
        if (controller.value.isReady && controller.value.isPlaying) {
          controller.pause();
          stoppedCount++;
        }
      } catch (e) {
        print('VideoControllerManager: Error stopping YouTube controller: $e');
      }
    }
    
    if (stoppedCount > 0) {
      print('VideoControllerManager: Stopped $stoppedCount YouTube players');
    }
  }

  /// Stop only the live stream
  void stopLiveStream() {
    if (_liveStreamController != null && _isLiveStreamActive) {
      try {
        _liveStreamController?.loadRequest(Uri.parse('about:blank'));
        print('VideoControllerManager: Stopped live stream');
      } catch (e) {
        print('VideoControllerManager: Error stopping live stream: $e');
      }
    }
  }

  /// Clear all registered controllers (use when app is closing)
  void clear() {
    _activeControllers.clear();
    _liveStreamController = null;
    _isLiveStreamActive = false;
    _isYouTubeFullscreen = false;
    print('VideoControllerManager: Cleared all controllers');
  }

  /// Get the count of active YouTube controllers
  int get activeYouTubeCount => _activeControllers.length;

  /// Debug method to print current state
  void debugPrintState() {
    print('VideoControllerManager State:');
    print('  - YouTube controllers: ${_activeControllers.length}');
    print('  - Live stream active: $_isLiveStreamActive');
    print('  - YouTube fullscreen: $_isYouTubeFullscreen');
  }
}