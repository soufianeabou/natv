import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart' hide NavigationDecision;
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'package:file_picker/file_picker.dart';

import 'flutter_flow_util.dart';

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
  final Function(WebViewXController)? onControllerCreated;

  @override
  State<FlutterFlowWebView> createState() => _FlutterFlowWebViewState();
}

class _FlutterFlowWebViewState extends State<FlutterFlowWebView> 
    with WidgetsBindingObserver {
  final webviewKey = GlobalKey();
  bool _isFullscreen = false;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('FlutterFlowWebView: Initializing with content: ${widget.content}');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    
    // Handle app lifecycle to prevent freezing
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        print('FlutterFlowWebView: App paused/hidden');
        break;
      case AppLifecycleState.resumed:
        print('FlutterFlowWebView: App resumed');
        // Restore system UI if needed
        if (!_isFullscreen && mounted) {
          _restoreSystemUI();
        }
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        break;
    }
  }

  void _restoreSystemUI() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: SystemUiOverlay.values,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Future<List<String>> _androidFilePicker(FileSelectorParams params) async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      return [file.uri.toString()];
    }
    return [];
  }

  @override
  void dispose() {
    _isDisposed = true;
    WidgetsBinding.instance.removeObserver(this);
    
    // Restore system UI on dispose
    if (mounted) {
      _restoreSystemUI();
    }
    
    print('FlutterFlowWebView: Disposed');
    super.dispose();
  }

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  @override
  Widget build(BuildContext context) {
    return WebViewX(
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
        if (_isDisposed) return;
        
        try {
          if (controller.connector is WebViewController && isAndroid) {
            final androidController =
                controller.connector.platform as AndroidWebViewController;
            await androidController.setOnShowFileSelector(_androidFilePicker);
          }
          
          // Call the callback if provided
          if (widget.onControllerCreated != null) {
            widget.onControllerCreated!(controller);
          }
          
          print('FlutterFlowWebView: WebView created successfully');
        } catch (e) {
          print('FlutterFlowWebView: Error in onWebViewCreated: $e');
        }
      },
      navigationDelegate: (request) async {
        if (_isDisposed) return NavigationDecision.prevent;
        
        try {
          if (isAndroid) {
            if (request.content.source.startsWith('https://api.whatsapp.com/send?phone')) {
              String url = request.content.source;
              await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
              return NavigationDecision.prevent;
            }
          }
          return NavigationDecision.navigate;
        } catch (e) {
          print('FlutterFlowWebView: Navigation error: $e');
          return NavigationDecision.navigate;
        }
      },
      webSpecificParams: const WebSpecificParams(
        webAllowFullscreenContent: true,
      ),
      mobileSpecificParams: MobileSpecificParams(
        debuggingEnabled: false,
        gestureNavigationEnabled: true,
        mobileGestureRecognizers: {
          if (widget.verticalScroll)
            Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ),
          if (widget.horizontalScroll)
            Factory<HorizontalDragGestureRecognizer>(
              () => HorizontalDragGestureRecognizer(),
            ),
        },
        androidEnableHybridComposition: true,
      ),
      onPageStarted: (url) {
        print('FlutterFlowWebView: Page started loading: $url');
      },
      onPageFinished: (url) {
        print('FlutterFlowWebView: Page finished loading: $url');
      },
      onWebResourceError: (error) {
        print('FlutterFlowWebView: Web resource error: ${error.description}');
      },
    );
  }
}
