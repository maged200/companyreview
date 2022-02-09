import 'package:flutter/material.dart';
import 'package:m7laty/module/posts/screen/post_screen.dart';
import 'package:m7laty/module/profile/screen/person_info.dart';
import 'package:m7laty/styles/default_theme.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .05,
          margin: EdgeInsets.only(left: 60),
          child: TabBar(
            tabs: [
              Container(
                child: new Text(
                  'Profile',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                child: new Text(
                  'My Posts',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
            unselectedLabelColor: DefaultTheme.lightSecondaryColor,
            indicatorColor: DefaultTheme.backGround,
            labelColor: DefaultTheme.lightColor,
            enableFeedback: false,
            indicator: BoxDecoration(
                gradient: LinearGradient(colors: [
                  DefaultTheme.darkerSecondaryBrandColor,
                  DefaultTheme.rejectColor
                ]),
                borderRadius: BorderRadius.circular(15)),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1.0,
            isScrollable: false,
            controller: _tabController,
          ),
        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: <Widget>[PersonInfo(), PostScreen()]),
        ),
      ],
    );
  }
}
