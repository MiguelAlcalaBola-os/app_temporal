import 'package:reservatu_pista/web/web.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/app/ui/pages/not_found_page/not_found_b.dart';
import 'package:reservatu_pista/app/ui/pages/not_found_page/not_found_p.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import 'app/routes/app_pages.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';

void main() async {
  print('------------------ Version 12 ------------------');
  WidgetsFlutterBinding.ensureInitialized();
  await FFLocalizations.initialize();
  // final appState = FFAppState(); // Initialize FFAppState
  // await appState.initializePersistedState();
  quitarAlmohadilla();
  // runApp(ChangeNotifierProvider(
  //   create: (context) => appState,
  //   child: const MyApp(),
  // ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = FFLocalizations.getStoredLocale();
  ThemeMode _themeMode = ThemeMode.light;

  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
    FFLocalizations.storeLocale(language);
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation) {
      return GetMaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: WidgetStateProperty.all(LightModeTheme().primary)),
        ),
        themeMode: _themeMode,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [
          Locale('es'),
          Locale('en'),
        ],
        // initialBinding: DBService(),
        // home: Routes.LOGIN_USUARIO,
        initialBinding: DBBinding(),
        initialRoute: Routes.LOGIN_USUARIO,
        // Manejo de rutas no encontradas
        unknownRoute: GetPage(
          name: '/not_found',
          binding: NotFoundBinding(),
          page: () => const NotFoundPage(),
        ),
        getPages: AppPages.routes,
      );
    });
  }
}
