import 'package:flutter/material.dart';
import 'package:project_cardmap/Declarations/Constants/constants.dart';

AppBar buildAppBar({
  required String appBarTitle,
  bool? centerTitle,
  List<Widget>? actionWidgets,
}) =>
    AppBar(
      title: Text(appBarTitle),
      centerTitle: centerTitle ?? true,
      elevation: 0,
      backgroundColor: primaryColor,
      actions: actionWidgets ?? [],
    );
