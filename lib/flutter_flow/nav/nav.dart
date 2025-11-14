import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';
import '/pages/privacy_policy/privacy_policy_widget.dart';
import '/videopage/video_controller_manager.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/s0MwUBa24kOo_1242_2688.png',
                  fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.25, 0.5, 0.75, 1.0],
                          colors: [
                            Color(0xFF162F6A).withOpacity(0.95),
                            Color(0xFF162F6A).withOpacity(0.70),
                            Colors.transparent,
                            Color(0xFF162F6A).withOpacity(0.70),
                            Color(0xFF0D244F).withOpacity(0.90),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'جميع الحقوق محفوظة ©',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.0,
                          decoration: TextDecoration.none,
                        ).copyWith(
                          fontFamily: GoogleFonts.changa(
                            fontWeight: FontWeight.bold,
                          ).fontFamily,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : NavBarPage(),
      routes: [
        GoRoute(
          path: '/',
          name: '_initialize',
          builder: (context, state) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                    color: Colors.transparent,
                    child: Image.asset(
                      'assets/images/s0MwUBa24kOo_1242_2688.png',
                      fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 0.25, 0.5, 0.75, 1.0],
                              colors: [
                                Color(0xFF162F6A).withOpacity(0.95),
                                Color(0xFF162F6A).withOpacity(0.70),
                                Colors.transparent,
                                Color(0xFF162F6A).withOpacity(0.70),
                                Color(0xFF0D244F).withOpacity(0.90),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 60,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              'جميع الحقوق محفوظة ©',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.0,
                                decoration: TextDecoration.none,
                              ).copyWith(
                                fontFamily: GoogleFonts.changa(
                                  fontWeight: FontWeight.bold,
                                ).fontFamily,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              : NavBarPage(),
        ),
        GoRoute(
            path: '/contact',
            name: ContactCopyWidget.routeName,
            builder: (context, state) => NavBarPage(initialPage: 'ContactCopy')),
        GoRoute(
            path: '/frequencies',
            name: FrequenciesCopyWidget.routeName,
            builder: (context, state) => NavBarPage(initialPage: 'FrequenciesCopy')),
        GoRoute(
            path: '/information',
            name: InformationCopyWidget.routeName,
            builder: (context, state) => NavBarPage(initialPage: 'InformationCopy')),
        GoRoute(
          path: '/programme',
          name: ProgrammeCopyWidget.routeName,
          builder: (context, state) => NavBarPage(initialPage: 'ProgrammeCopy')),
        GoRoute(
            path: '/live',
            name: LiveCopyCopyWidget.routeName,
            builder: (context, state) => NavBarPage(initialPage: 'liveCopyCopy')),
        GoRoute(
            path: '/playlist/:playlistID',
            name: PlaylistpageWidget.routeName,
            builder: (context, state) => PlaylistpageWidget(
              playlistID: state.pathParameters['playlistID'] ?? '',
                  )),
        GoRoute(
            path: '/video/:videoID',
          name: VideopageWidget.routeName,
            builder: (context, state) => VideopageWidget(
              videoID: state.pathParameters['videoID'] ?? '',
            )),
        GoRoute(
            path: '/coming-soon/:programName',
            name: ComingSoonWidget.routeName,
            builder: (context, state) => ComingSoonWidget(
              programName: state.pathParameters['programName'] ?? 'البرنامج',
            )),
        GoRoute(
            path: '/privacyPolicy',
            name: 'PrivacyPolicy',
            builder: (context, state) => PrivacyPolicyWidget()),
      ],
    );

class NavBarPage extends StatefulWidget {
  NavBarPage({
    Key? key,
    this.initialPage,
    this.page,
    this.disableResizeToAvoidBottomInset = false,
  }) : super(key: key);

  final String? initialPage;
  final Widget? page;
  final bool disableResizeToAvoidBottomInset;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'liveCopyCopy';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'liveCopyCopy': LiveCopyCopyWidget(),
      'FrequenciesCopy': FrequenciesCopyWidget(),
      'ContactCopy': ContactCopyWidget(),
      'ProgrammeCopy': ProgrammeCopyWidget(),
      'InformationCopy': InformationCopyWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      resizeToAvoidBottomInset: !widget.disableResizeToAvoidBottomInset,
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) {
          // Stop all videos when switching pages
          try {
            final manager = VideoControllerManager();
            manager.stopAllVideos();
          } catch (e) {
            // Ignore if manager not available
          }
          setState(() {
            _currentPageName = tabs.keys.toList()[i];
            _currentPage = null;
          });
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        selectedItemColor: FlutterFlowTheme.of(context).primary,
        unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.play,
              size: 24.0,
            ),
            label: FFLocalizations.of(context).getText(
              'acmf0zbi' /* البث المباشر */,
                  ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.satellite_alt_rounded,
              size: 24.0,
            ),
            label: FFLocalizations.of(context).getText(
              'lxexlop7' /* الترددات */,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wifi_calling_3_outlined,
              size: 24.0,
            ),
            label: FFLocalizations.of(context).getText(
              'dxgzu70r' /* تواصل معنا */,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie_outlined,
              size: 24.0,
            ),
            label: FFLocalizations.of(context).getText(
              'haz5zfn3' /* برامجنا */,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              size: 24.0,
            ),
            label: FFLocalizations.of(context).getText(
              'w9zg61me' /* من نحن */,
            ),
          ),
        ],
      ),
    );
  }
}
