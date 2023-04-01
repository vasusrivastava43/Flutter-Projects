import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:rgb/home_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late File image;

  Future<File> getImage(ImageSource imageSource) async {
    XFile? xFile = await ImagePicker().pickImage(source: imageSource);
    final takenImage = File(xFile!.path);
    return takenImage;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nano Bio Sensor App",
                  style: TextStyle(
                      fontSize: size.width * .09, fontWeight: FontWeight.bold,color: Colors.green[800]),textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Text(
                  '©Nanoscience Lab\n Deptt. of Physics\n MM(DU) Mullana Ambala',
                  style: TextStyle(
                      color: Colors.green[800], fontSize: size.width * .07,),textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * .2,
                ),
                ElevatedButton(style: ButtonStyle(),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FutureHomeScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(left: size.width*.08,right: size.width*.08,top: size.height*.015,bottom: size.height*.015),
                    child: Text('Take Picture',style: TextStyle(fontSize: size.width*.05,color: Colors.black),),
                  ),
                ),
                Spacer(),
                Image.asset('assets/MMDU logo.jpg'),
                SizedBox(
                  height: size.height * .02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
