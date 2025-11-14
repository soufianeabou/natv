import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
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
    
    // Stop any other videos that might be playing
    VideoControllerManager().stopAllVideos();
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
              // Stop any playing videos before navigating back
              VideoControllerManager().stopAllVideos();
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
                // Video Player Section
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
                                'Vidéos Similaires',
                                style: GoogleFonts.changa(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Related Videos List
                        Expanded(
                          child: FutureBuilder<ApiCallResponse>(
                            future: VideosCall.call(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFFC8AB6B),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              
                              final listViewVideosResponse = snapshot.data!;
                              
                              return Builder(
                                builder: (context) {
                                  final videos = getJsonField(
                                    listViewVideosResponse.jsonBody,
                                    r'''$.items''',
                                  ).toList();
                                  
                                  // Filter out the current video
                                  final relatedVideos = videos.where((video) {
                                    final videoId = getJsonField(video, r'''$.id.videoId''').toString();
                                    return videoId != widget.videoID;
                                  }).toList();
                                  
                                  if (relatedVideos.isEmpty) {
                                    return Center(
                                      child: Text(
                                        'Aucune vidéo similaire disponible',
                                        style: GoogleFonts.changa(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  }
                                  
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: relatedVideos.length,
                                    itemBuilder: (context, relatedVideosIndex) {
                                      final relatedVideosItem = relatedVideos[relatedVideosIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          // Stop current video before navigating
                                          VideoControllerManager().stopAllVideos();
                                          
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => VideopageWidget(
                                                videoID: getJsonField(
                                                  relatedVideosItem,
                                                  r'''$.id.videoId''',
                                                ).toString(),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // Thumbnail
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(12.0),
                                                  child: Image.network(
                                                    getJsonField(
                                                      relatedVideosItem,
                                                      r'''$.snippet.thumbnails.medium.url''',
                                                    ).toString(),
                                                    width: 140.0,
                                                    height: 90.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                
                                                SizedBox(width: 12),
                                                
                                                // Video Info
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        getJsonField(
                                                          relatedVideosItem,
                                                          r'''$.snippet.title''',
                                                        ).toString(),
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: GoogleFonts.changa(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                          height: 1.3,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      Text(
                                                        getJsonField(
                                                          relatedVideosItem,
                                                          r'''$.snippet.channelTitle''',
                                                        ).toString(),
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: GoogleFonts.changa(
                                                          color: Colors.white60,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
