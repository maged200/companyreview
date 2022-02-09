import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:m7laty/module/Auth/screen/auth_check.dart';
import 'package:m7laty/module/Auth/service/auth_provider.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  // bypass bad cirtificate [should be fixed in back-end later ]
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await translator.init(
    localeType: LocalizationDefaultType.asDefined,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
    language: 'ar',
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocalizedApp(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
          lazy: true,
        ),
      ],
      child: AuthCheck(),
    );
  }
}
