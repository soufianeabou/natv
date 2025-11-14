import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/internationalization.dart';
import '/flutter_flow/nav/nav.dart';
import '/flutter_flow/flutter_flow_app_state.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FFLocalizations.initialize();

  final appState = FFAppState.instance;
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = FFLocalizations.getStoredLocale();
  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  Timer? _splashTimer;

  @override
  void initState() {
    super.initState();
    
    // Lock orientation to portrait only by default
    // Individual pages can unlock for fullscreen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    
    // Set to respect user's system rotation lock setting
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    
    // Start splash timer
    _splashTimer = Timer(Duration(seconds: 3), () {
      _appStateNotifier.stopShowingSplashImage();
    });
  }

  @override
  void dispose() {
    _splashTimer?.cancel();
    super.dispose();
  }

  void setLocale(String language) {
    setState(() {
      _locale = FFLocalizations.getStoredLocale();
    });
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  // Navigation methods
  String getRoute() {
    return _router.routerDelegate.currentConfiguration.uri.toString();
  }

  List<String> getRouteStack() {
    return _router.routerDelegate.currentConfiguration.matches.map((match) => match.matchedLocation).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'NA TV',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('ar'),
        Locale('fr'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

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
      'ContactCopy': ContactCopyWidget(),
      'FrequenciesCopy': FrequenciesCopyWidget(),
      'ProgrammeCopy': ProgrammeCopyWidget(),
      'InformationCopy': InformationCopyWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      resizeToAvoidBottomInset: !widget.disableResizeToAvoidBottomInset,
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPageName = tabs.keys.toList()[i];
          _currentPage = null;
        }),
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
