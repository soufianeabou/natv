import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coming_soon_model.dart';
export 'coming_soon_model.dart';

class ComingSoonWidget extends StatefulWidget {
  static String routeName = 'ComingSoon';
  static String routePath = '/comingSoon';
  const ComingSoonWidget({
    super.key,
    String? programName,
  }) : this.programName = programName ?? 'البرنامج';

  final String programName;

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget>
    with TickerProviderStateMixin {
  late ComingSoonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComingSoonModel());

    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _model.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0F172A),
        appBar: AppBar(
          backgroundColor: Color(0xFF0F172A),
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          title: Text(
            widget.programName,
            style: GoogleFonts.changa(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0F172A),
                  Color(0xFF1E293B),
                  Color(0xFF334155),
                ],
                stops: [0.0, 0.5, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo Icon
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFC8AB6B),
                            Color(0xFFE4D7A0),
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(-1.0, -1.0),
                          end: AlignmentDirectional(1.0, 1.0),
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 30,
                            color: Color(0xFFC8AB6B).withOpacity(0.3),
                            offset: Offset(0, 15),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.tv_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    
                    SizedBox(height: 40),
                    
                    // Main Title
                    Text(
                      'قريبا',
                      style: GoogleFonts.changa(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    
                    SizedBox(height: 16),
                    
                    // Program Name
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFC8AB6B).withOpacity(0.2),
                            Color(0xFFE4D7A0).withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xFFC8AB6B).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        widget.programName,
                        style: GoogleFonts.changa(
                          color: Color(0xFFC8AB6B),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 24),
                    
                    // Description
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'نعمل بجد لإعداد هذا البرنامج المميز\nترقبوا إطلاقه قريباً مع محتوى حصري ومثير',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.white70,
                          fontSize: 16,
                          height: 1.5,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 40),
                    
                    // Coming Soon Badge
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFC8AB6B),
                            Color(0xFFE4D7A0),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Color(0xFFC8AB6B).withOpacity(0.4),
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.schedule_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'قريباً جداً',
                            style: GoogleFonts.changa(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 60),
                    
                    // Back Button
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      text: 'العودة للبرامج',
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 200,
                        height: 50,
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        color: Colors.transparent,
                        textStyle: GoogleFonts.lato(
                          color: Color(0xFFC8AB6B),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Color(0xFFC8AB6B).withOpacity(0.5),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                        hoverColor: Color(0xFFC8AB6B).withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
} 