import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import '/flutter_flow/nav/sidebar_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'live_copy_copy_model.dart';
import '/videopage/video_controller_manager.dart';
export 'live_copy_copy_model.dart';

class LiveCopyCopyWidget extends StatefulWidget {
  const LiveCopyCopyWidget({super.key});

  static String routeName = 'liveCopyCopy';
  static String routePath = '/liveCopyCopy';

  @override
  State<LiveCopyCopyWidget> createState() => _LiveCopyCopyWidgetState();
}

class _LiveCopyCopyWidgetState extends State<LiveCopyCopyWidget> {
  late LiveCopyCopyModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isFullscreen = false;
  static const platform = MethodChannel('com.northafricatv.app/fullscreen');

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveCopyCopyModel());
    _model.switchValue = FlutterFlowModel.globalSwitchValue;
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
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

  void _enterFullscreen() async {
  setState(() {
    _isFullscreen = true;
  });
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  
  try {
    await platform.invokeMethod('enterFullscreen');
  } catch (e) {
    print('Error entering fullscreen: $e');
  }
}

void _exitFullscreen() async {
  setState(() {
    _isFullscreen = false;
  });
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  try {
    await platform.invokeMethod('exitFullscreen');
  } catch (e) {
    print('Error exiting fullscreen: $e');
  }
  
  WidgetsBinding.instance.addPostFrameCallback((_) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: SystemUiOverlay.values,
    );
  });
}

  @override
  Widget build(BuildContext context) {
    // Fullscreen landscape mode
    // Fullscreen landscape mode
// Fullscreen landscape mode
// Fullscreen landscape mode
if (_isFullscreen) {
  return WillPopScope(
    onWillPop: () async {
      _exitFullscreen();
      return false;
    },
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: FlutterFlowWebView(
                    content: 'https://mn-nl.mncdn.com/nafrica_tv/live/index.m3u8',
                    bypass: false,
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    verticalScroll: false,
                    horizontalScroll: false,
                    onControllerCreated: (controller) {
                      VideoControllerManager().registerLiveStream(controller);
                    },
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: SafeArea(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _exitFullscreen,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.fullscreen_exit,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

    // Normal portrait mode
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        drawer: SidebarWidget(),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.dehaze_rounded,
              color: Color(0xFFC8AB6B),
              size: 30,
            ),
            onPressed: () async {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/LOGOOO1.png',
              width: 233.9,
              height: 60,
              fit: BoxFit.contain,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0F1419),
                  Color(0xFF162F6A),
                  Color(0xFF1E293B),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF162F6A).withOpacity(0.4),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF162F6A).withOpacity(0.1),
                            Colors.transparent,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF162F6A),
                                  Color(0xFF0F172A),
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC8AB6B),
                                        shape: BoxShape.circle,
                                      ),
                                      margin: EdgeInsets.only(right: 6),
                                    ),
                                    Text(
                                      'البث المباشر',
                                      style: GoogleFonts.changa(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(Icons.fullscreen, color: Color(0xFFC8AB6B), size: 24),
                                  onPressed: _enterFullscreen,
                                  tooltip: 'ملء الشاشة',
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: FlutterFlowWebView(
                              content: 'https://mn-nl.mncdn.com/nafrica_tv/live/index.m3u8',
                              bypass: false,
                              width: MediaQuery.sizeOf(context).width,
                              height: 180.0,
                              verticalScroll: false,
                              horizontalScroll: false,
                              onControllerCreated: (controller) {
                                VideoControllerManager().registerLiveStream(controller);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(12, 4, 12, 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC8AB6B),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'أحدث المقاطع',
                                style: GoogleFonts.changa(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.video_library_outlined,
                                color: Color(0xFFC8AB6B),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<ApiCallResponse>(
                            future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()..complete(TestApiYoutubeCall.call())).future,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF162F6A).withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC8AB6B)),
                                      strokeWidth: 3,
                                    ),
                                  ),
                                );
                              }
                              final listViewTestApiYoutubeResponse = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final items = TestApiYoutubeCall.items(listViewTestApiYoutubeResponse.jsonBody)?.toList() ?? [];
                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      safeSetState(() => _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                    },
                                    color: Color(0xFFC8AB6B),
                                    backgroundColor: Color(0xFF162F6A),
                                    child: ListView.builder(
                                      padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: items.length,
                                      itemBuilder: (context, itemsIndex) {
                                        final itemsItem = items[itemsIndex];
                                        return Padding(
                                          padding: EdgeInsets.only(bottom: 16),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              VideoControllerManager().stopAllVideos();
                                              context.pushNamed(
                                                VideopageWidget.routeName,
                                                pathParameters: {
                                                  'videoID': TestApiYoutubeCall.vIdeoID(listViewTestApiYoutubeResponse.jsonBody)?.elementAtOrNull(itemsIndex) ?? '',
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: 120,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.white.withOpacity(0.08),
                                                    Colors.white.withOpacity(0.03),
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                borderRadius: BorderRadius.circular(16),
                                                border: Border.all(
                                                  color: Colors.white.withOpacity(0.1),
                                                  width: 1,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.2),
                                                    blurRadius: 8,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 120,
                                                      height: 88,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(12),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black.withOpacity(0.3),
                                                            blurRadius: 6,
                                                            offset: Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(12),
                                                        child: Stack(
                                                          children: [
                                                            Image.network(
                                                              (TestApiYoutubeCall.image(listViewTestApiYoutubeResponse.jsonBody)!.elementAtOrNull(itemsIndex))!,
                                                              width: 120,
                                                              height: 88,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Center(
                                                              child: Container(
                                                                width: 40,
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.black.withOpacity(0.7),
                                                                  shape: BoxShape.circle,
                                                                  border: Border.all(
                                                                    color: Color(0xFFC8AB6B),
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                child: Icon(
                                                                  Icons.play_arrow,
                                                                  color: Color(0xFFC8AB6B),
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 16),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<String>(
                                                              TestApiYoutubeCall.title(listViewTestApiYoutubeResponse.jsonBody)?.elementAtOrNull(itemsIndex),
                                                              'عنوان الفيديو',
                                                            ),
                                                            style: GoogleFonts.changa(
                                                              color: Colors.white,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              height: 1.3,
                                                            ),
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(height: 8),
                                                          FutureBuilder<ApiCallResponse>(
                                                            future: GetChannelVideosCall.call(
                                                              videoid: TestApiYoutubeCall.vIdeoID(listViewTestApiYoutubeResponse.jsonBody)?.elementAtOrNull(itemsIndex),
                                                            ),
                                                            builder: (context, snapshot) {
                                                              if (!snapshot.hasData) {
                                                                return Container(
                                                                  height: 20,
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        width: 40,
                                                                        height: 12,
                                                                        decoration: BoxDecoration(
                                                                          color: Colors.white.withOpacity(0.1),
                                                                          borderRadius: BorderRadius.circular(6),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              }
                                                              final containerGetChannelVideosResponse = snapshot.data!;
                                                              return Row(
                                                                children: [
                                                                  Icon(Icons.visibility_outlined, color: Color(0xFFC8AB6B), size: 16),
                                                                  SizedBox(width: 4),
                                                                  Text(
                                                                    valueOrDefault<String>(
                                                                      GetChannelVideosCall.views(containerGetChannelVideosResponse.jsonBody),
                                                                      '0',
                                                                    ),
                                                                    style: GoogleFonts.lato(
                                                                      color: Colors.white70,
                                                                      fontSize: 12,
                                                                      fontWeight: FontWeight.w500,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 16),
                                                                  Icon(Icons.thumb_up_outlined, color: Color(0xFFC8AB6B), size: 16),
                                                                  SizedBox(width: 4),
                                                                  Text(
                                                                    valueOrDefault<String>(
                                                                      GetChannelVideosCall.like(containerGetChannelVideosResponse.jsonBody),
                                                                      '0',
                                                                    ),
                                                                    style: GoogleFonts.lato(
                                                                      color: Colors.white70,
                                                                      fontSize: 12,
                                                                      fontWeight: FontWeight.w500,
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}