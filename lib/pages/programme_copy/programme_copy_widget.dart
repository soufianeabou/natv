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
import 'package:webviewx_plus/webviewx_plus.dart';
import 'programme_copy_model.dart';
export 'programme_copy_model.dart';

/// Transform the "ProgrammeCopy" page into a beautiful, modern TV schedule
/// interface like Netflix or Apple TV.
///
/// Keep all navigation exactly the same.
///
/// ## CRITICAL - DO NOT CHANGE:
/// - Keep blue AppBar with hamburger menu exactly as is
/// - Keep complete Drawer navigation with all menu items
/// - Keep bottom navigation with all 4 icons
/// - Keep ALL existing program categories and their functionality
/// - Keep ALL existing routing between pages
///
/// ## REPLACE BODY CONTENT WITH MODERN DESIGN:
///
/// ### STEP 1: PAGE BACKGROUND
/// - Set page background to elegant gradient
/// - Color 1: #0f172a (dark navy)
/// - Color 2: #1e293b (slate)
/// - Color 3: #162F6A (brand blue)
///
/// ### STEP 2: ADD SCROLLING
/// - Wrap all content in SingleChildScrollView
/// - Set physics to BouncingScrollPhysics
///
/// ### STEP 3: HERO SECTION
/// - Container: full width, height 280px
/// - Background: Gradient from #162F6A to #0f172a with overlay pattern
/// - Add floating decoration circles (semi-transparent)
///
/// Hero content (centered Column):
/// - Add premium TV icon Container: 100x100px, glassmorphism effect
/// - Place movie/TV icon inside: size 50px, gold #C8AB6B
/// - Title: "البرامج" - size 32px, white, bold, with glow shadow
/// - Subtitle: "برامج قناة شمال أفريقيا" - size 18px, gold
/// - Description: "تقدم محتوى سياسي وثقافي متنوع لجمهور شمال أفريقيا والعالم
/// العربي"
///
/// ### STEP 4: FEATURED PROGRAMS SECTION
/// - Add section title: "البرامج المميزة" - white, size 24px, bold, centered
/// - Create horizontal scroll Row with 3 featured cards
///
/// Each featured card:
/// - Container: 280x160px, gradient background, rounded 16px
/// - Shadow: colored glow effect
/// - Content: program image placeholder, title, time, "مشاهدة الآن" button
///
/// ### STEP 5: TRANSFORM EXISTING BUTTONS TO MODERN CARDS
///
/// Replace each plain button with styled program card:
///
/// **الموجز نح (News Card):**
/// - Container: full width, height 120px, margin 12px
/// - Background: Gradient red #dc2626 to dark red #991b1b
/// - Border radius: 16px, shadow with red glow
/// - Row content:
///   - Left: News icon Container (60x60px, white background 20% opacity)
///   - Center: Column with program title and description
///   - Right: "مباشر" live badge with pulsing animation
///
/// **آفاق (Horizons Card):**
/// - Container: full width, height 120px, margin 12px
/// - Background: Gradient blue #2563eb to navy #1e3a8a
/// - Same structure with different icon and "قريباً" badge
///
/// **الاسبوع (Weekly Card):**
/// - Container: full width, height 120px, margin 12px
/// - Background: Gradient green #059669 to dark green #064e3b
/// - Calendar icon, program details, time badge
///
/// **Sans Frontières Card:**
/// - Container: full width, height 120px, margin 12px
/// - Background: Gradient purple #7c3aed to dark purple #581c87
/// - Globe icon, international program badge
///
/// Continue this pattern for ALL existing programs:
/// - بودكاست جسور
/// - بودكاست تيارات
/// - شؤون مغاربية
/// - مفاتيح
/// - في الواجهة
/// - طبيعي
/// - العدور
/// - صدى القارة
/// - صدى الشتات
/// - المحادثة أبدية
///
/// ### STEP 6: PROGRAM CATEGORIES
/// - Add section: "تصفح حسب الفئة" - white, bold, centered
/// - Create 4 category cards in 2x2 grid:
///
/// Category 1 - الأخبار:
/// - Background: gradient red, news icon, "12 برنامج"
///
/// Category 2 - السياسة:
/// - Background: gradient blue, politics icon, "8 برامج"
///
/// Category 3 - الثقافة:
/// - Background: gradient green, culture icon, "6 برامج"
///
/// Category 4 - الرياضة:
/// - Background: gradient orange, sports icon, "4 برامج"
///
/// ### STEP 7: SCHEDULE TIMELINE
/// - Add title: "جدول اليوم" - white, bold
/// - Create timeline Container with time slots:
/// - Vertical timeline with time markers (6:00, 8:00, 10:00, etc.)
/// - Program blocks showing current and upcoming shows
/// - "الآن" indicator for current program
///
/// ### STEP 8: CALL-TO-ACTION SECTION
/// - Container: full width, padding 24px
/// - Background: Gradient gold #C8AB6B to orange #f59e0b
/// - Border radius: 20px, shadow
///
/// Content:
/// - TV guide icon: size 48px, white
/// - Title: "لا تفوت برنامجك المفضل!" - white, bold
/// - Description: "اشترك للحصول على تنبيهات البرامج"
/// - Button: "اشترك الآن" - white background, blue text
///
/// ### STEP 9: MODERN STYLING FOR ALL CARDS
/// Each program card should have:
/// - Glassmorphism effect (semi-transparent background)
/// - Appropriate gradient colors
/// - Program icon (60x60px container with themed icon)
/// - Program title (white, bold, 18px)
/// - Program description (light gray, 14px)
/// - Time/status badge (colored, rounded)
/// - Subtle hover/tap animation
/// - Soft shadow with colored glow
///
/// ### STEP 10: ANIMATION ENHANCEMENTS
/// - Staggered fade-in for all cards
/// - Pulsing animation for "live" indicators
/// - Smooth scale animation on card tap
/// - Parallax effect on hero section
/// - Smooth transitions between sections
///
/// ### STEP 11: RESPONSIVE LAYOUT
/// - Cards adapt to screen width
/// - Proper spacing: 16px between cards, 24px between sections
/// - Maintain visual hierarchy on all screen sizes
/// - Touch-friendly sizes (minimum 44px touch targets)
///
/// ## QUALITY REQUIREMENTS:
/// - Each card must have unique gradient colors
/// - All icons should be themed and appropriate
/// - Consistent typography using Changa for Arabic
/// - Professional shadows and lighting effects
/// - Smooth animations throughout
/// - Netflix/Apple TV quality design
/// - Perfect color contrast for accessibility
///
/// The result should be a stunning TV program guide that feels premium and
/// modern while keeping all existing functionality intact.
class ProgrammeCopyWidget extends StatefulWidget {
  const ProgrammeCopyWidget({super.key});

  static String routeName = 'ProgrammeCopy';
  static String routePath = '/programmeCopy';

  @override
  State<ProgrammeCopyWidget> createState() => _ProgrammeCopyWidgetState();
}

class _ProgrammeCopyWidgetState extends State<ProgrammeCopyWidget> {
  late ProgrammeCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgrammeCopyModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: SidebarWidget(
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.dehaze_rounded,
              color: Color(0xFFC8AB6B),
              size: 30.0,
            ),
            onPressed: () async {
              scaffoldKey.currentState!.openDrawer();
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
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
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
                                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                                    children: [
                  // Hero Section
                  Container(
                    width: double.infinity,
                    height: 280,
                    margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF162F6A),
                          Color(0xFF0F172A),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.4),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Stack(
                                    children: [
                        // Background decoration circles
                        Positioned(
                          top: -50,
                          right: -50,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color(0xFFC8AB6B).withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          left: -30,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        
                        // Hero content
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Premium TV icon
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withOpacity(0.2),
                                      Colors.white.withOpacity(0.1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                    width: 2,
                                  ),
                                ),
                                        child: Icon(
                                  Icons.movie_outlined,
                                  size: 50,
                                  color: Color(0xFFC8AB6B),
                                ),
                              ),
                              SizedBox(height: 20),
                              
                              // Title with glow effect
                              Text(
                                'برامجنا',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.changa(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Color(0xFFC8AB6B).withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Featured Programs Section
                        Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                        Text(
                          'البرامج المميزة',
                          style: GoogleFonts.changa(
                            color: Colors.white,
                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        
                        // Featured cards horizontal scroll
                        Container(
                          height: 160,
                          child: ListView(
                                      scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                                        children: [
                              _buildFeaturedCard(
                                'المحور', 
                                'أخبار ومناقشات سياسية',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/qss220oyotr4/EL_MIHWER.jpg',
                                [Color(0xFFDC2626), Color(0xFF991B1B)],
                                () {
                                  context.pushNamed(
                                    PlaylistpageWidget.routeName,
                                    pathParameters: {
                                      'playlistID': serializeParam(
                                        'PLPQ9PFp4GfzzGNre4Km2OfpT-Ae1qZuCb',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                              _buildFeaturedCard(
                                'الحدث', 
                                'تغطية فورية للأحداث العاجلة',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/d9007chl1np5/ALHADAT.jpg',
                                [Color(0xFFEF4444), Color(0xFFDC2626)],
                                () {
                                  context.pushNamed(
                                    PlaylistpageWidget.routeName,
                                    pathParameters: {
                                      'playlistID': serializeParam(
                                        'PLPQ9PFp4GfzyRiQS3tUCyLP0SY--Mm1Nf',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                              _buildFeaturedCard(
                                'صدى الشارع', 
                                'آراء المواطنين حول القضايا المهمة',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/ofkjy9avxcux/SADA_CHARI3.jpg',
                                [Color(0xFF7C3AED), Color(0xFF581C87)],
                                () {
                                  context.pushNamed(
                                    PlaylistpageWidget.routeName,
                                    pathParameters: {
                                      'playlistID': serializeParam(
                                        'PLPQ9PFp4GfzxnrxmrhyW7nk5YYDQwRx2J',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // All Programs Section
                  Container(
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
                                'جميع البرامج',
                                style: GoogleFonts.changa(
                                  color: Colors.white,
                                  fontSize: 22,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Programs Grid
                    Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                              _buildProgramCard(
                                'المحور',
                                'التغطية الإخبارية والتحليل السياسي',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/qss220oyotr4/EL_MIHWER.jpg',
                                [Color(0xFFDC2626), Color(0xFF991B1B)],
                                () {
                              context.pushNamed(
                                PlaylistpageWidget.routeName,
                                pathParameters: {
                                  'playlistID': serializeParam(
                                    'PLPQ9PFp4GfzzGNre4Km2OfpT-Ae1qZuCb',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                              ),
                              _buildProgramCard(
                                'الحدث',
                                'تغطية فورية للأحداث العاجلة',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/d9007chl1np5/ALHADAT.jpg',
                                [Color(0xFFEF4444), Color(0xFFDC2626)],
                                () {
                              context.pushNamed(
                                PlaylistpageWidget.routeName,
                                pathParameters: {
                                  'playlistID': serializeParam(
                                    'PLPQ9PFp4GfzyRiQS3tUCyLP0SY--Mm1Nf',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                              ),
                              _buildProgramCard(
                                'صدى الشارع',
                                'آراء المواطنين حول القضايا المهمة',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/ofkjy9avxcux/SADA_CHARI3.jpg',
                                [Color(0xFF7C3AED), Color(0xFF581C87)],
                                () {
                              context.pushNamed(
                                PlaylistpageWidget.routeName,
                                pathParameters: {
                                  'playlistID': serializeParam(
                                    'PLPQ9PFp4GfzxnrxmrhyW7nk5YYDQwRx2J',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                              ),
                              _buildProgramCard(
                                'تواصل',
                                'حوارات مع الشخصيات المؤثرة',
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/eofqjx6k2x3z/TWASOL.jpg',
                                [Color(0xFF0891B2), Color(0xFF0E7490)],
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ComingSoonWidget(
                                        programName: 'تواصل',
                                      ),
                                    ),
                                  );
                                },
                              ),
                              _buildProgramCard(
                                'آفاق',
                                'استكشاف الآفاق المستقبلية',
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/9rtsz6rksom7/AFA9.jpg',
                                [Color(0xFF2563EB), Color(0xFF1E3A8A)],
                                () {
                              context.pushNamed(
                                PlaylistpageWidget.routeName,
                                pathParameters: {
                                  'playlistID': serializeParam(
                                        'PLPQ9PFp4Gfzwe34gXaT-GxvIW8HIuiYyx',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                              ),
                              _buildProgramCard(
                                'الأسبوع',
                                'مراجعة أسبوعية شاملة للأحداث',
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/xeeo1yjpszjo/ELOSBOU3.jpg',
                                [Color(0xFF059669), Color(0xFF064E3B)],
                                () {
                              context.pushNamed(
                                PlaylistpageWidget.routeName,
                                pathParameters: {
                                  'playlistID': serializeParam(
                                    'PLPQ9PFp4GfzyN73e3clDHHZV84_bZufqO',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                              ),
                              _buildProgramCard(
                                'Sans Frontières',
                                'برامج دولية بلا حدود',
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/cde9x0s3km43/SANS_FRONYIER.jpg',
                                [Color(0xFF7C3AED), Color(0xFF581C87)],
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ComingSoonWidget(
                                        programName: 'Sans Frontières',
                                      ),
                                    ),
                                  );
                                },
                              ),
                              _buildProgramCard(
                                'أضواء',
                                'بودكاست جسور للحوار والنقاش',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/oiiwjqc61oxo/ADWAE.jpg',
                                [Color(0xFFEF4444), Color(0xFFDC2626)],
                                () {
                              context.pushNamed(
                                PlaylistpageWidget.routeName,
                                pathParameters: {
                                  'playlistID': serializeParam(
                                    'PLPQ9PFp4GfzwOKnLJkmXR2-Ld3TZAlDzI',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                              ),
                              _buildProgramCard(
                                'صدى القارة',
                                'أخبار وأحداث القارة الأفريقية',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/wz5ve9rdzodx/SADA_LKARA.jpg',
                                [Color(0xFFF59E0B), Color(0xFFD97706)],
                                () {
                              context.pushNamed(
                                PlaylistpageWidget.routeName,
                                pathParameters: {
                                  'playlistID': serializeParam(
                                    'PLPQ9PFp4GfzxGsC7Ygll1u05FVVYAzGwr',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                              ),
                              _buildProgramCard(
                                'شؤون مغاربية',
                                'تغطية شؤون المنطقة المغاربية',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/jcw8zpk86zdq/CHEOUN_MGHARIBIA.jpg',
                                [Color(0xFF059669), Color(0xFF047857)],
                                () {
                              context.pushNamed(
                                PlaylistpageWidget.routeName,
                                pathParameters: {
                                  'playlistID': serializeParam(
                                    'PLPQ9PFp4Gfzzqe7vZXjOZZGY-6DsEz8wS',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                              ),
                              _buildProgramCard(
                                'في الواجهة',
                                'لقاءات مع الشخصيات البارزة',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/4cwiuyc7tifz/FILWAJIHA.jpg',
                                [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
                                () {
                              context.pushNamed(
                                PlaylistpageWidget.routeName,
                                pathParameters: {
                                  'playlistID': serializeParam(
                                    'PLPQ9PFp4GfzwYDnMIZ7qTOFVYizOUSlIr',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                              ),
                              _buildProgramCard(
                                'طبيعي',
                                'برامج بيئية وطبيعية',
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/natv-qji7gm/assets/5zam4zmjiuol/TABI3I.jpg',
                                [Color(0xFF10B981), Color(0xFF059669)],
                                () {
                              context.pushNamed(
                                PlaylistpageWidget.routeName,
                                pathParameters: {
                                  'playlistID': serializeParam(
                                    'PLPQ9PFp4Gfzx1jtJEnllUF_hXMDNJjImK',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  
                  // Call-to-Action Section
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFC8AB6B),
                          Color(0xFFF59E0B),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFC8AB6B).withOpacity(0.3),
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.tv_outlined,
                          size: 48,
                          color: Colors.white,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'لا تفوت برنامجك المفضل!',
                          style: GoogleFonts.changa(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'اشترك للحصول على تنبيهات البرامج',
                          style: GoogleFonts.lato(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () async {
                            await launchURL('https://www.youtube.com/@northafricatv');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: FlutterFlowTheme.of(context).primary,
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'اشترك الآن',
                            style: GoogleFonts.changa(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
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

  // Helper method for building featured cards
  Widget _buildFeaturedCard(String title, String description, String imageUrl, List<Color> gradientColors, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
                              child: Container(
        width: 280,
        height: 160,
        margin: EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
            colors: gradientColors,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradientColors[0].withOpacity(0.3),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
                                ),
                                child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                                  child: Image.network(
                  imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
              // Gradient overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                              ),
                            ),
                          ),
              ),
              // Content
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.changa(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: GoogleFonts.lato(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                        color: Color(0xFFC8AB6B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'مشاهدة الآن',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
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
    );
  }

  // Helper method for building program cards
  Widget _buildProgramCard(String title, String description, String imageUrl, List<Color> gradientColors, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: gradientColors[0].withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Background logo image
                Positioned.fill(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.white.withOpacity(0.5),
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
                
                // Minimal overlay for text readability only at the bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                              child: Container(
                    height: 80,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                                    colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Content overlay - positioned at bottom
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.changa(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.8),
                                blurRadius: 6,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          description,
                          style: GoogleFonts.lato(
                            color: Colors.white.withOpacity(0.95),
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.6),
                                blurRadius: 4,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
