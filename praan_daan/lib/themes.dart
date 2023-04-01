import 'dart:ui';
import 'package:flutter/material.dart';

final double physicalHeight = window.physicalSize.height;
final double physicalWidth = window.physicalSize.width;

Color backgroundColor=Color(0xffFFCEE6);

TextStyle elevatedButtonTextStyle = TextStyle(fontSize: 22,color: Colors.black);
TextStyle appBarTitleStyle=TextStyle(fontSize:22,color: Colors.black);

ButtonStyle elevatedButtonStyle=ButtonStyle(
  //maximumSize: MaterialStateProperty.all<Size>(Size(physicalWidth, physicalHeight*.06)),
  backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff7b6a7)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),))
);