import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Container(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        onTap: () {
                          translator.setNewLanguage(
                            context,
                            // ignore: deprecated_member_use
                            newLanguage: translator.currentLanguage == 'ar'
                                ? 'en'
                                : 'ar',
                            remember: true,
                          );
                        },
                        leading: Icon(Icons.language_rounded),
                        title: Text(
                          translator.activeLanguageCode == 'ar'
                              ? 'English'
                              : 'العربية',
                        ),
                      ),
                    ],
                  ))))
        ],
      ),
    );
  }
}
