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
import 'contact_copy_model.dart';
export 'contact_copy_model.dart';

/// North Africa TV contact
class ContactCopyWidget extends StatefulWidget {
  const ContactCopyWidget({super.key});

  static String routeName = 'ContactCopy';
  static String routePath = '/contactCopy';

  @override
  State<ContactCopyWidget> createState() => _ContactCopyWidgetState();
}

class _ContactCopyWidgetState extends State<ContactCopyWidget> {
  late ContactCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactCopyModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
                // Hero Section - Contact title
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
                                  'تواصل معنا', // Hardcoded
                                  style: GoogleFonts.changa(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Content - title
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Text(
                                'تواصل معنا', // Hardcoded
                                style: GoogleFonts.changa(
                                  color: Color(0xFFC8AB6B),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Contact Form Section - styled like Live page
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
                                'أرسل لنا رسالة', // Hardcoded
                                style: GoogleFonts.changa(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.message,
                                color: Color(0xFFC8AB6B),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        
                        // Form Content
                        Expanded(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
                            child: Column(
                              children: [
                                // Name Field
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(bottom: 16),
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
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'الاسم الكامل', // Hardcoded
                                          style: GoogleFonts.changa(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        TextFormField(
                                          controller: _model.textController1,
                                          focusNode: _model.textFieldFocusNode1,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'ادخل اسمك الكامل', // Hardcoded
                                            hintStyle: GoogleFonts.changa(
                                              color: Colors.white54,
                                              fontSize: 14,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white.withOpacity(0.2),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC8AB6B),
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white.withOpacity(0.05),
                                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                          ),
                                          style: GoogleFonts.changa(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                          validator: _model.textController1Validator.asValidator(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                
                                // Email Field
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(bottom: 16),
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
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'البريد الإلكتروني', // Hardcoded
                                          style: GoogleFonts.changa(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        TextFormField(
                                          controller: _model.textController2,
                                          focusNode: _model.textFieldFocusNode2,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'ادخل بريدك الإلكتروني', // Hardcoded
                                            hintStyle: GoogleFonts.changa(
                                              color: Colors.white54,
                                              fontSize: 14,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white.withOpacity(0.2),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC8AB6B),
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white.withOpacity(0.05),
                                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                          ),
                                          style: GoogleFonts.changa(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                          validator: _model.textController2Validator.asValidator(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                
                                // Message Field
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(bottom: 20),
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
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'نص الرسالة', // Hardcoded
                                          style: GoogleFonts.changa(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        TextFormField(
                                          controller: _model.textController3,
                                          focusNode: _model.textFieldFocusNode3,
                                          autofocus: false,
                                          obscureText: false,
                                          maxLines: 5,
                                          decoration: InputDecoration(
                                            hintText: 'اكتب رسالتك هنا...', // Hardcoded
                                            hintStyle: GoogleFonts.changa(
                                              color: Colors.white54,
                                              fontSize: 14,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white.withOpacity(0.2),
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC8AB6B),
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white.withOpacity(0.05),
                                            contentPadding: EdgeInsets.all(16),
                                          ),
                                          style: GoogleFonts.changa(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                          validator: _model.textController3Validator.asValidator(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                
                                // Send Button
                                Container(
                                  width: double.infinity,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFC8AB6B),
                                        Color(0xFFD4B776)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC8AB6B).withOpacity(0.3),
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () async {
                                        await launchURL('mailto:support@nafrica.tv');
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'إرسال الرسالة', // Hardcoded
                                          style: GoogleFonts.changa(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
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
