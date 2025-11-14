import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  }) : super(key: key);

  final String content;
  final double? height;
  final double? width;
  final bool bypass;
  final bool horizontalScroll;
  final bool verticalScroll;
  final bool html;
  final Function(WebViewController)? onControllerCreated;

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
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print('FlutterFlowWebView: Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('FlutterFlowWebView: Page finished loading: $url');
            // Hide fullscreen button via CSS injection
            _controller.runJavaScript('''
              (function() {
                var style = document.createElement('style');
                style.innerHTML = `
                  video::-webkit-media-controls-fullscreen-button { display: none !important; }
                  video::-moz-media-controls-fullscreen-button { display: none !important; }
                  .vjs-fullscreen-control { display: none !important; }
                  button[aria-label*="fullscreen" i] { display: none !important; }
                  button[aria-label*="full screen" i] { display: none !important; }
                `;
                document.head.appendChild(style);
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