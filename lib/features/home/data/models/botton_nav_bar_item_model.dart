import 'package:flutter/material.dart';

class BottonNavBarItemModel {
  Widget? leading;
  String? title;
  String? subTitle;
  Widget? trailing;
  Widget? icon; // <-- Change from IconData? to Widget?
  Widget? alternateIcon; // <-- Change from IconData? to Widget?
  Function? onTap;
  Color? colors;
  Widget? launchWidget;

  BottonNavBarItemModel({
    this.leading,
    this.title,
    this.subTitle,
    this.colors,
    this.icon,
    this.alternateIcon,
    this.trailing,
    this.onTap,
    this.launchWidget,
  });
}
