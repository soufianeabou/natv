import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import '/flutter_flow/nav/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'information_copy_model.dart';
export 'information_copy_model.dart';

class InformationCopyWidget extends StatefulWidget {
  const InformationCopyWidget({super.key});

  static String routeName = 'InformationCopy';
  static String routePath = '/informationCopy';

  @override
  State<InformationCopyWidget> createState() => _InformationCopyWidgetState();
}

class _InformationCopyWidgetState extends State<InformationCopyWidget> {
  late InformationCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformationCopyModel());

    // Initialize switch value from global state
    _model.switchValue = FlutterFlowModel.globalSwitchValue;
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
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        drawer: SidebarWidget(
        ),
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
              width: 200,
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
                  Color(0xFF0F1419), // Dark slate
                  FlutterFlowTheme.of(context).primary, // Brand blue
                  Color(0xFF1E293B), // Deeper slate
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
                // Hero Section - Style like Live page but with Information content
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: FlutterFlowTheme.of(context).primary.withOpacity(0.4),
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
                            FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                            Colors.transparent,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Header
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                  'من نحن', // Hardcoded text instead of FFLocalizations
                                  style: GoogleFonts.changa(
                                            color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Content Area - Information content in Live page style
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // About section styled like Live page
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20),
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
                                  child: Text(
                                    'قناة شمال أفريقيا هي منصة إعلامية تهدف إلى تقديم محتوى متميز وموثوق يخدم الجمهور العربي',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.changa(
                                          color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                
                // Information Cards Section - styled like Live page videos list
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
                                'رؤيتنا', // Hardcoded
                                style: GoogleFonts.changa(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.lightbulb,
                                color: Color(0xFFC8AB6B),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        
                        // Cards List
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
                            children: [
                              // Vision Card
                              Padding(
                                padding: EdgeInsets.only(bottom: 16),
                              child: Container(
                                width: double.infinity,
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
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                    children: [
                                        // Icon
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFC8AB6B).withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                              color: Color(0xFFC8AB6B),
                                              width: 2,
                                            ),
                                          ),
                                          child: Icon(
                                        Icons.lightbulb,
                                            color: Color(0xFFC8AB6B),
                                            size: 28,
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        
                                        // Content
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'رؤيتنا', // Hardcoded
                                                style: GoogleFonts.changa(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                      Text(
                                                'أن نكون الصوت الإعلامي الرائد في منطقة شمال أفريقيا، نقدم محتوى يلهم ويثقف ويربط بين الثقافات', // Hardcoded
                                                style: GoogleFonts.changa(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              
                              // Contact Card
                          Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: InkWell(
                                  onTap: () async {
                                    context.pushNamed(ContactCopyWidget.routeName);
                                  },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFC8AB6B),
                                      Color(0xFFD4B776)
                                    ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFC8AB6B).withOpacity(0.3),
                                          blurRadius: 8,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Row(
                                        children: [
                                          // Icon
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.phone,
                                              color: Colors.white,
                                              size: 28,
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          
                                          // Content
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'تواصل معنا', // Hardcoded
                                                  style: GoogleFonts.changa(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Text(
                                                    'اتصل بنا', // Hardcoded
                                                    style: GoogleFonts.changa(
                                                      color: FlutterFlowTheme.of(context).primary,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                                              ],
                                            ),
                                          ),
                                          // Arrow icon
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
