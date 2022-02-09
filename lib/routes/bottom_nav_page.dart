import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavPage {
  final Widget screen;
  final String title;
  final Widget appBar;
  BottomNavPage({
    @required this.screen,
    this.title,
    this.appBar,
  });
}
