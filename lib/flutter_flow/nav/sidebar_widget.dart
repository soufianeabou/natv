import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/videopage/video_controller_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      elevation: 16,
      child: SafeArea(
        child: Container(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0F1419),
                  FlutterFlowTheme.of(context).primary,
                  Color(0xFF1E293B),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Header with Logo
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        'assets/images/LOGOOO1.png',
                        width: 60,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                
                // Menu Items
                _buildMenuItem(
                  context: context,
                  icon: Icons.live_tv,
                  title: 'البث المباشر',
                  onTap: () {
                    VideoControllerManager().stopAllVideos();
                    context.pushNamed(LiveCopyCopyWidget.routeName);
                  },
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.satellite_alt_rounded,
                  title: 'الترددات',
                  onTap: () {
                    VideoControllerManager().stopAllVideos();
                    context.pushNamed(FrequenciesCopyWidget.routeName);
                  },
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.wifi_calling_3_outlined,
                  title: 'تواصل معنا',
                  onTap: () {
                    VideoControllerManager().stopAllVideos();
                    context.pushNamed(ContactCopyWidget.routeName);
                  },
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.movie_outlined,
                  title: 'برامجنا',
                  onTap: () {
                    VideoControllerManager().stopAllVideos();
                    context.pushNamed(ProgrammeCopyWidget.routeName);
                  },
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.info,
                  title: 'من نحن',
                  onTap: () {
                    VideoControllerManager().stopAllVideos();
                    context.pushNamed(InformationCopyWidget.routeName);
                  },
                ),
                
                SizedBox(height: 8),
                
                // Social Media Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'تابعونا ايضا',
                        style: GoogleFonts.changa(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton(
                            context: context,
                            icon: FontAwesomeIcons.youtube,
                            onTap: () => launchURL('https://www.youtube.com/@northafricatv'),
                          ),
                          _buildSocialButton(
                            context: context,
                            icon: FontAwesomeIcons.xTwitter,
                            onTap: () => launchURL('https://x.com/NORTHAFRICATV'),
                          ),
                          _buildSocialButton(
                            context: context,
                            icon: FontAwesomeIcons.instagram,
                            onTap: () => launchURL('https://www.instagram.com/natv.001/'),
                          ),
                          _buildSocialButton(
                            context: context,
                            icon: Icons.facebook,
                            onTap: () => launchURL('https://web.facebook.com/people/NATV/61571163042014/'),
                          ),
                          _buildSocialButton(
                            context: context,
                            icon: Icons.tiktok_sharp,
                            onTap: () => launchURL('https://www.tiktok.com/@nafricatv'),
                          ),
                        ].divide(SizedBox(width: 8)),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 8),
                
                // Privacy Policy Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 6,
                        buttonSize: 32,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.privacy_tip_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                        onPressed: () => context.pushNamed('PrivacyPolicy'),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'سياسة الخصوصية',
                        style: GoogleFonts.changa(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 16), // Bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              FlutterFlowTheme.of(context).primary.withOpacity(0.3),
              FlutterFlowTheme.of(context).primary.withOpacity(0.1),
              FlutterFlowTheme.of(context).primary.withOpacity(0.2),
            ],
            stops: [0.0, 0.5, 1.0],
          ),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary.withOpacity(0.4),
            width: 1,
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Align(
          alignment: AlignmentDirectional(-0.8, 0),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  icon,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  title,
                  style: GoogleFonts.changa(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return FlutterFlowIconButton(
      borderRadius: 6,
      buttonSize: 28,
      fillColor: FlutterFlowTheme.of(context).primary.withOpacity(0.8),
      icon: Icon(icon, color: FlutterFlowTheme.of(context).info, size: 14),
      onPressed: onTap,
    );
  }
}
