import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'videopage_model.dart';
import 'youtube_player_widget.dart';
import 'video_controller_manager.dart';
export 'videopage_model.dart';

class VideopageWidget extends StatefulWidget {
  const VideopageWidget({
    super.key,
    required this.videoID,
  });

  /// VideoID
  final String? videoID;

  static String routeName = 'videopage';
  static String routePath = '/videopage';

  @override
  State<VideopageWidget> createState() => _VideopageWidgetState();
}

class _VideopageWidgetState extends State<VideopageWidget> {
  late VideopageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideopageModel());
    // Debug: Print videoID to verify it's being received
    if (widget.videoID != null && widget.videoID!.isNotEmpty) {
      print('VideoPage: Received videoID: ${widget.videoID}');
    } else {
      print('VideoPage: ERROR - videoID is null or empty!');
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.keyboard_return_sharp,
              color: Color(0xFFC8AB6B),
              size: 30.0,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          title: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/LOGOOO1.png',
              width: 200.0,
              height: 60.0,
              fit: BoxFit.contain,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
            child: Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0F172A), // Dark navy
                  Color(0xFF1E293B), // Slate
                  FlutterFlowTheme.of(context).primary, // Brand blue
                ],
                stops: [0.0, 0.6, 1.0],
              ),
            ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Video Player Section - Simplified to avoid overflow
                  (widget.videoID != null && widget.videoID!.isNotEmpty)
                      ? YouTubePlayerWidget(
                          videoId: widget.videoID!,
                          height: 240.0,
                        )
                      : Container(
                          height: 240.0,
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Colors.white70,
                                size: 48,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Erreur: Video ID manquant',
                                style: GoogleFonts.changa(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                  
                  // Related Videos Section
                  Expanded(
                            child: Container(
                              width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                              child: Column(
                      children: [
                        // Section Header
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
                                'فيديوهات ذات صلة',
                                style: GoogleFonts.changa(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.video_collection_outlined,
                                color: Color(0xFFC8AB6B),
                                size: 24,
                                  ),
                                ],
                              ),
                            ),
                        
                        // Related Videos List
                          Expanded(
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(TestApiYoutubeCall.call()))
                                    .future,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).primary.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                        child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFFC8AB6B),
                                          ),
                                      strokeWidth: 3,
                                        ),
                                      ),
                                    );
                                  }
                              final listViewTestApiYoutubeResponse = snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final items = TestApiYoutubeCall.items(
                                        listViewTestApiYoutubeResponse.jsonBody,
                                          )?.toList() ??
                                          [];

                                      return RefreshIndicator(
                                        onRefresh: () async {
                                      safeSetState(
                                          () => _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                        },
                                    color: Color(0xFFC8AB6B),
                                    backgroundColor: FlutterFlowTheme.of(context).primary,
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
                                                            // Stop all videos before navigating
                                                            VideoControllerManager().stopAllVideos();
                                                            
                                                            final videoIdValue = TestApiYoutubeCall.vIdeoID(
                                                              listViewTestApiYoutubeResponse.jsonBody,
                                                            )?.elementAtOrNull(itemsIndex);
                                                            
                                                            if (videoIdValue != null && videoIdValue.isNotEmpty) {
                                                            context.pushNamed(
                                                                VideopageWidget.routeName,
                                                                pathParameters: {
                                                                  'videoID': videoIdValue,
                                                                },
                                                              );
                                                            }
                                                          },
                                            child: Container(
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
                                                    // Thumbnail
                                                    Container(
                                                      width: 120,
                                                      height: 90,
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
                                                              (TestApiYoutubeCall.image(
                                                                listViewTestApiYoutubeResponse.jsonBody,
                                                              )!.elementAtOrNull(itemsIndex))!,
                                                              width: 120,
                                                              height: 90,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            // Play overlay
                                                            Center(
                                                            child: Container(
                                                                width: 40,
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.black.withOpacity(0.7),
                                                                  shape: BoxShape.circle,
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
                                                    
                                                    // Content
                                                                          Expanded(
                                                      child: Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    TestApiYoutubeCall.title(
                                                                                      listViewTestApiYoutubeResponse.jsonBody,
                                                                                    )?.elementAtOrNull(itemsIndex),
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
                                                          
                                                          // Video stats
                                                          FutureBuilder<ApiCallResponse>(
                                                            future: GetChannelVideosCall.call(
                                                              videoid: TestApiYoutubeCall.vIdeoID(
                                                                              listViewTestApiYoutubeResponse.jsonBody,
                                                                            )?.elementAtOrNull(itemsIndex),
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
                                                                  Icon(
                                                                    Icons.visibility_outlined,
                                                                    color: Color(0xFFC8AB6B),
                                                                    size: 16,
                                                                  ),
                                                                  SizedBox(width: 4),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      GetChannelVideosCall.views(
                                                                                        containerGetChannelVideosResponse.jsonBody,
                                                                                      ),
                                                                      '0',
                                                                                    ),
                                                                    style: GoogleFonts.lato(
                                                                      color: Colors.white70,
                                                                      fontSize: 12,
                                                                      fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                  SizedBox(width: 16),
                                                                  Icon(
                                                                    Icons.thumb_up_outlined,
                                                                    color: Color(0xFFC8AB6B),
                                                                    size: 16,
                                                                                    ),
                                                                  SizedBox(width: 4),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      GetChannelVideosCall.like(
                                                                                        containerGetChannelVideosResponse.jsonBody,
                                                                                      ),
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
