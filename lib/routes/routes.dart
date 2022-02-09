import 'package:flutter/material.dart';
import 'package:m7laty/module/company/screen/company_screen.dart';
import 'package:m7laty/module/home/screen/home_screeen.dart';
import 'package:m7laty/module/login/screen/log_in.dart';
import 'package:m7laty/module/posts/screen/post_screen.dart';
import 'package:m7laty/module/profile/screen/profile_screen.dart';
import 'package:m7laty/routes/bottom_nav_page.dart';

class Routes {
  // app initials
  static String initialRoute = '/';
  static Widget initialPage = HomeScreen();
  static Widget initialAuthPage = LogIn();

  // app routes
  static Map<String, WidgetBuilder> appRoutes(context) => {
        HomeScreen.routName: (context) => HomeScreen(),
      };
  static List<BottomNavPage> budyNavRoutes = [
    BottomNavPage(screen: CompanyScreen()),
    BottomNavPage(screen: ProfileScreen()),
    BottomNavPage(screen: PostScreen())
  ];
}
