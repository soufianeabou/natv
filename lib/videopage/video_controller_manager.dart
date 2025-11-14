import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

/// Global manager to track and stop all active video players
class VideoControllerManager {
  static final VideoControllerManager _instance = VideoControllerManager._internal();
  factory VideoControllerManager() => _instance;
  VideoControllerManager._internal();

  final Set<YoutubePlayerController> _activeControllers = {};
  WebViewXController? _liveStreamController;

  void registerController(YoutubePlayerController controller) {
    _activeControllers.add(controller);
  }

  void unregisterController(YoutubePlayerController controller) {
    _activeControllers.remove(controller);
  }

  void registerLiveStream(WebViewXController controller) {
    _liveStreamController = controller;
  }

  void unregisterLiveStream() {
    _liveStreamController = null;
  }

  void stopAllVideos() {
    // Stop YouTube videos
    for (var controller in _activeControllers) {
      try {
        if (controller.value.isReady) {
          controller.pause();
        }
      } catch (e) {
        // Controller might be disposed, ignore
      }
    }
    
    // Stop live stream by loading blank page
    if (_liveStreamController != null) {
      try {
        _liveStreamController?.loadContent(
          'about:blank',
          sourceType: SourceType.url,
        );
      } catch (e) {
        // Controller might be disposed, ignore
      }
    }
  }

  void clear() {
    _activeControllers.clear();
    _liveStreamController = null;
  }
}

