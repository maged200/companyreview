import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:m7laty/module/Auth/service/auth_provider.dart';
import 'package:m7laty/routes/routes.dart';
import 'package:m7laty/styles/default_theme.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _controller;
  AuthProvider model;
  bool _isLogged = false;
  bool logged = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //
    super.initState();
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(reverse: true);
    animation = new CurvedAnimation(parent: _controller, curve: Curves.linear);
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        _isLogged = true;
      });
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    model = Provider.of<AuthProvider>(context);
    logged = await model.checkAuthTokenInStorage(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return !_isLogged
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: translator.delegates,
            // ignore: deprecated_member_use
            locale: translator.locale,
            supportedLocales: translator.locals(),
            title: 'Splash screen',
            theme: DefaultTheme.theme,
            home: Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                // child: Center(
                //   child: FadeTransition(
                //     opacity: _controller,
                //     child: Container(
                //       margin: EdgeInsets.only(top: 10),
                //       child: Image.asset("assets/images/h.png"),
                //     ),
                //   ),
                // ),
                color: DefaultTheme.lightColor,
              ),
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            localizationsDelegates: translator.delegates,
            // ignore: deprecated_member_use
            locale: translator.locale,
            supportedLocales: translator.locals(),
            title: 'companyreview',
            theme: DefaultTheme.theme,
            routes: Routes.appRoutes(context),
            home: logged ? Routes.initialPage : Routes.initialAuthPage,
          );
  }
}
