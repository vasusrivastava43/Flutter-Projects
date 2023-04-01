import 'package:firebase_ml_vision_raw_bytes/firebase_ml_vision_raw_bytes.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
// import 'package:exif/exif.dart';
// import 'package:image/image.dart' as img;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result="";
  File? image;
  ImagePicker? imagePicker;

  // Future<File> fixExifRotation(String imagePath) async {
  //   final originalFile = File(imagePath);
  //   List<int> imageBytes = await originalFile.readAsBytes();
  //
  //   final originalImage = img.decodeImage(imageBytes);
  //
  //   final height = originalImage.height;
  //   final width = originalImage.width;
  //
  //   // Let's check for the image size
  //   if (height >= width) {
  //     // I'm interested in portrait photos so
  //     // I'll just return here
  //     return originalFile;
  //   }
  //
  //   // We'll use the exif package to read exif data
  //   // This is map of several exif properties
  //   // Let's check 'Image Orientation'
  //   final exifData = await readExifFromBytes(imageBytes);
  //
  //   img.Image fixedImage;
  //
  //   if (height < width) {
  //     logger.logInfo('Rotating image necessary');
  //     // rotate
  //     if (exifData['Image Orientation'].printable.contains('Horizontal')) {
  //       fixedImage = img.copyRotate(originalImage, 90);
  //     } else if (exifData['Image Orientation'].printable.contains('180')) {
  //       fixedImage = img.copyRotate(originalImage, -90);
  //     } else {
  //       fixedImage = img.copyRotate(originalImage, 0);
  //     }
  //   }
  //
  //   // Here you can select whether you'd like to save it as png
  //   // or jpg with some compression
  //   // I choose jpg with 100% quality
  //   final fixedFile =
  //   await originalFile.writeAsBytes(img.encodeJpg(fixedImage));
  //
  //   return fixedFile;
  // }

  void initState(){
    super.initState();
    imagePicker=ImagePicker();
  }

  pickImageFromGallery()async{
    PickedFile? pickedFile=await imagePicker!.getImage(source:ImageSource.gallery);
    File rotatedImage=await FlutterExifRotation.rotateImage(path:pickedFile!.path);
    setState((){
      image=rotatedImage;
      performImageLabeling();
    });
  }

  pickImageFromCamera()async{
    PickedFile? pickedFile=await imagePicker!.getImage(source:ImageSource.camera);
    File rotatedImage=await FlutterExifRotation.rotateImage(path:pickedFile!.path);
    setState((){
      image=rotatedImage;
      performImageLabeling();
    });
  }

  performImageLabeling()async{
    final FirebaseVisionImage firebaseVisionImage=FirebaseVisionImage.fromFile(image);
    final TextRecognizer recognizer=FirebaseVision.instance.textRecognizer();
    VisionText visionText=await recognizer.processImage(firebaseVisionImage);
    result='';
    setState((){
      for(TextBlock block in visionText.blocks){
        final String txt=block.text;
        for(TextLine line in block.lines){
          for(TextElement element in line.elements){
            result+=element.text+" ";
          }
        }
        result+="\n\n";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            SizedBox(width:100),
            Container(
              height: 280,
              width: 250,
              margin: EdgeInsets.only(top: 70),
              padding:EdgeInsets.only(left: 28,bottom: 5,right: 18),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 16
                    ),
                    textAlign: TextAlign.justify
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/note.jpg"),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20 ,right: 140),
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Image.asset("assets/pin.png",
                          height:240,
                          width: 240,),
                      ),
                    ],
                  ),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        pickImageFromGallery();
                      },
                      onLongPress: (){
                        pickImageFromCamera();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 25),
                        child: image != null ? Image.file(image!,width: 140,height: 190,fit: BoxFit.fill,)
                        :Container(
                          width: 240,
                          height: 200,
                          child: Icon(Icons.camera_enhance_sharp,size: 100,color: Colors.grey,),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
