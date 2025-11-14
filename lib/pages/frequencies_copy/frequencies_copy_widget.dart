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
import 'frequencies_copy_model.dart';
export 'frequencies_copy_model.dart';

/// ترددات البث الفضائي – North Africa TV
class FrequenciesCopyWidget extends StatefulWidget {
  const FrequenciesCopyWidget({super.key});

  static String routeName = 'FrequenciesCopy';
  static String routePath = '/frequenciesCopy';

  @override
  State<FrequenciesCopyWidget> createState() => _FrequenciesCopyWidgetState();
}

class _FrequenciesCopyWidgetState extends State<FrequenciesCopyWidget> {
  late FrequenciesCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FrequenciesCopyModel());

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
            child: SingleChildScrollView(
                child: Column(
                mainAxisSize: MainAxisSize.max,
                  children: [
                  // Hero Section - Frequencies title
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
                                    'الترددات', // Hardcoded
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
                                  'ترددات البث الفضائي', // Hardcoded
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
                  
                  // Eutelsat Card
                  Container(
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
                                'يوتلسات', // Hardcoded
                                style: GoogleFonts.changa(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.satellite_rounded,
                                color: Color(0xFFC8AB6B),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        
                        // Satellite Details
                                        Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
                                                    child: Column(
                                                      children: [
                              // Status Badge
                              Container(
                                            width: double.infinity,
                                margin: EdgeInsets.only(bottom: 16),
                                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF249689),
                                                  Color(0xFF39D2C0)
                                                ],
                                              ),
                                        borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                              children: [
                                          Text(
                                            'متاح', // Hardcoded
                                            style: GoogleFonts.changa(
                                                            color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(width: 6),
                                                Icon(
                                                  Icons.check_circle,
                                                  color: Colors.white,
                                            size: 16,
                                                ),
                                        ],
                                          ),
                                        ),
                                      ],
                                    ),
                              ),
                              
                              // Technical Details
                              _buildDetailRow(
                                icon: Icons.radio,
                                label: 'الموقع المداري', // Hardcoded
                                value: '8° غربا', // Hardcoded
                              ),
                              _buildDetailRow(
                                icon: Icons.wifi,
                                label: 'التردد', // Hardcoded
                                value: '11096', // Hardcoded
                              ),
                              _buildDetailRow(
                                icon: Icons.settings,
                                label: 'الاستقطاب', // Hardcoded
                                value: 'أفقي', // Hardcoded
                              ),
                              _buildDetailRow(
                                icon: Icons.speed,
                                label: 'معدل الترميز', // Hardcoded
                                value: '27500', // Hardcoded
                              ),
                              _buildDetailRow(
                                icon: Icons.verified,
                                label: 'معامل التصحيح', // Hardcoded
                                value: '7/8', // Hardcoded
                              ),
                              _buildDetailRow(
                                icon: Icons.tv,
                                label: 'التضمين', // Hardcoded
                                value: 'DVB-S', // Hardcoded
                                isLast: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Nilesat Card
                  Container(
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
                                'نايل سات', // Hardcoded
                                style: GoogleFonts.changa(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.satellite_rounded,
                                color: Color(0xFFC8AB6B),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                        
                        // Satellite Details
                                        Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
                          child: Column(
                            children: [
                              // Status Badge
                              Container(
                                            width: double.infinity,
                                margin: EdgeInsets.only(bottom: 16),
                                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF249689),
                                            Color(0xFF39D2C0)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text(
                                            'متاح', // Hardcoded
                                            style: GoogleFonts.changa(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(width: 6),
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              // Technical Details
                              _buildDetailRow(
                                icon: Icons.radio,
                                label: 'الموقع المداري', // Hardcoded
                                value: '7° غربا', // Hardcoded
                              ),
                              _buildDetailRow(
                                icon: Icons.wifi,
                                label: 'التردد', // Hardcoded
                                value: '12034', // Hardcoded
                              ),
                              _buildDetailRow(
                                icon: Icons.settings,
                                label: 'الاستقطاب', // Hardcoded
                                value: 'أفقي', // Hardcoded
                              ),
                              _buildDetailRow(
                                icon: Icons.speed,
                                label: 'معدل الترميز', // Hardcoded
                                value: '27500', // Hardcoded
                              ),
                              _buildDetailRow(
                                icon: Icons.verified,
                                label: 'معامل التصحيح', // Hardcoded
                                value: '5/6', // Hardcoded
                              ),
                              _buildDetailRow(
                                icon: Icons.tv,
                                label: 'التضمين', // Hardcoded
                                value: 'DVB-S', // Hardcoded
                                isLast: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    bool isLast = false,
  }) {
    return Container(
                                            width: double.infinity,
      margin: EdgeInsets.only(bottom: isLast ? 0 : 12),
                                            decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.08),
            Colors.white.withOpacity(0.03),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
                                            ),
                                            child: Padding(
        padding: EdgeInsets.all(12),
                                              child: Row(
                                                children: [
                                                  Container(
              width: 40,
              height: 40,
                                                    decoration: BoxDecoration(
                color: Color(0xFFC8AB6B).withOpacity(0.2),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                icon,
                color: Color(0xFFC8AB6B),
                size: 20,
              ),
            ),
            SizedBox(width: 12),
                                                  Expanded(
                                                    child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                    label,
                    style: GoogleFonts.changa(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2),
                                                        Text(
                    value,
                    style: GoogleFonts.changa(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
}
