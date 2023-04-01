import 'package:flutter/material.dart';
import 'package:flutter_4_world_time/packages/loading.dart';
import 'package:flutter_4_world_time/packages/home.dart';
import 'package:flutter_4_world_time/packages/chooselocation.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/choose_location':(context) => ChooseLocation()
    },
  ),
  );
}