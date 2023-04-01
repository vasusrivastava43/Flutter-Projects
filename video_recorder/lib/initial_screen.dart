import 'package:flutter/material.dart';
import 'package:video_recorder/login_screen.dart';

class InitialScreen extends StatelessWidget {


  Widget build(BuildContext context) {
    Size _size = MediaQuery
        .of(context)
        .size;
    double h = _size.height;
    double w = _size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: h * 0.8,
              margin: EdgeInsets.only(top: h * 0.3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 500,
                      child:
                      LoginPage()
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


