import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login':(context)=>MyLogin(),
      'register':(context)=>myRegister()},
  ));
}


