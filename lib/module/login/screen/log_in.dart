import 'package:flutter/material.dart';
import 'package:m7laty/module/home/screen/home_screeen.dart';
import 'package:m7laty/styles/default_theme.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .55,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routName);
              },
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "I Don't Have Account",
                style: TextStyle(
                  fontSize: 16,
                  color: DefaultTheme.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
