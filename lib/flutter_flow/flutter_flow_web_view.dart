import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class FlutterFlowWebView extends StatefulWidget {
  const FlutterFlowWebView({
    Key? key,
    required this.content,
    this.width,
    this.height,
    this.bypass = false,
    this.horizontalScroll = false,
    this.verticalScroll = false,
    this.html = false,
    this.onControllerCreated,
    this.onFullscreenChanged,
  }) : super(key: key);

  final String content;
  final double? height;
  final double? width;
  final bool bypass;
  final bool horizontalScroll;
  final bool verticalScroll;
  final bool html;
  final Function(WebViewController)? onControllerCreated;
  final Function(bool)? onFullscreenChanged;

  @override
  State<FlutterFlowWebView> createState() => _FlutterFlowWebViewState();
}

class _FlutterFlowWebViewState extends State<FlutterFlowWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..addJavaScriptChannel(
        'FlutterFullscreen',
        onMessageReceived: (JavaScriptMessage message) {
          // Detect fullscreen changes
          final isFullscreen = message.message == 'true';
          widget.onFullscreenChanged?.call(isFullscreen);
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print('FlutterFlowWebView: Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('FlutterFlowWebView: Page finished loading: $url');
            
            // Inject JavaScript to detect fullscreen changes
            _controller.runJavaScript('''
              (function() {
                // Listen for fullscreen changes
                document.addEventListener('fullscreenchange', function() {
                  var isFullscreen = !!document.fullscreenElement;
                  FlutterFullscreen.postMessage(isFullscreen.toString());
                });
                
                document.addEventListener('webkitfullscreenchange', function() {
                  var isFullscreen = !!document.webkitFullscreenElement;
                  FlutterFullscreen.postMessage(isFullscreen.toString());
                });
                
                document.addEventListener('mozfullscreenchange', function() {
                  var isFullscreen = !!document.mozFullScreenElement;
                  FlutterFullscreen.postMessage(isFullscreen.toString());
                });
                
                document.addEventListener('msfullscreenchange', function() {
                  var isFullscreen = !!document.msFullscreenElement;
                  FlutterFullscreen.postMessage(isFullscreen.toString());
                });
              })();
            ''');
          },
          onWebResourceError: (WebResourceError error) {
            print('FlutterFlowWebView: Error: ${error.description}');
          },
        ),
      );

    if (widget.html) {
      _controller.loadHtmlString(widget.content);
    } else {
      _controller.loadRequest(Uri.parse(widget.content));
    }

    // Android-specific settings
    if (!kIsWeb && Platform.isAndroid) {
      final androidController = _controller.platform as AndroidWebViewController;
      androidController.setMediaPlaybackRequiresUserGesture(false);
    }

    // Callback
    if (widget.onControllerCreated != null) {
      widget.onControllerCreated!(_controller);
    }

    print('FlutterFlowWebView: Initializing with content: ${widget.content}');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: WebViewWidget(controller: _controller),
    );
  }
}