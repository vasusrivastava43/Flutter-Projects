import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_recorder/initial_screen.dart';
import 'package:video_recorder/provider/login_manager.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => LoginManager())],
      child: MaterialApp(
        home: InitialScreen(),
      ),
    ),
  );
}
