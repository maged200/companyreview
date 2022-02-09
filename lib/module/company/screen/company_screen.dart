import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:m7laty/module/company/screen/search_page.dart';
import 'package:m7laty/module/company/widget/search_bar.dart';
import 'package:m7laty/module/company/widget/company_item.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  String searchString;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .1,
          padding: const EdgeInsets.all(15.0),
          child: OpenContainer<String>(
            openBuilder: (_, closeContainer) => SearchPage(closeContainer),
            onClosed: (res) => setState(() {
              searchString = res;
            }),
            tappable: false,
            transitionDuration: Duration(seconds: 1),
            closedBuilder: (_, openContainer) => SearchBar(
              searchString: searchString,
              openContainer: openContainer,
            ),
          ),
        ),
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(5),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              CompanyItem(),
              CompanyItem(),
              CompanyItem(),
              CompanyItem(),
              CompanyItem()
            ],
          ),
        ),
      ],
    );
  }
}
