import 'package:flutter/material.dart';
import 'package:m7laty/module/home/drawer/drawer.dart';
import 'package:m7laty/routes/routes.dart';
import 'package:m7laty/styles/default_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "HomeScreen";
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultTheme.lightColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: DefaultTheme.lightColor,
        title: Text(
          "H.Market",
          style: TextStyle(color: DefaultTheme.rejectColor, fontSize: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              child: Image.asset("assets/images/h.png"),
            ),
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: Routes.budyNavRoutes[currentIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: DefaultTheme.lightColor,
        elevation: 0,
        currentIndex: currentIndex,
        selectedItemColor: DefaultTheme.backGround,
        onTap: (x) {
          setState(() {
            currentIndex = x;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Question&Answer',
          )
        ],
      ),
    );
  }
}
