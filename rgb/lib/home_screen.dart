import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as im;
import 'package:image_picker/image_picker.dart';
import 'package:rgb/theme.dart';

class FutureHomeScreen extends StatefulWidget {
  const FutureHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FutureHomeScreen> createState() => _FutureHomeScreenState();
}

class _FutureHomeScreenState extends State<FutureHomeScreen> {
  Future<List<double>> getImage(ImageSource imageSource) async {
    XFile? xFile = await ImagePicker().pickImage(source: imageSource);
    final takenImage = File(xFile!.path);
    im.Image? image = im.decodeImage(takenImage.readAsBytesSync());
    final data = image?.getBytes(order: im.ChannelOrder.rgb);
    print('Height: ${image!.height}, Width: ${image.width}');
    var totalRed = 0, totalGreen = 0, totalBlue = 0;
    for (var x = 0; x < data!.length; x += 3) {
      totalRed += data[x];
      totalGreen += data[x + 1];
      totalBlue += data[x + 2];
    }
    print('\n${totalRed}, ${totalGreen}, ${totalBlue}');
    var avgRed = totalRed * 3 / data.length;
    var avgGreen = totalGreen * 3 / data.length;
    var avgBlue = totalBlue * 3 / data.length;
    var G = avgGreen / (avgBlue + avgGreen + avgRed);
    return [
      avgRed.floor().toDouble(),
      avgGreen.floor().toDouble(),
      avgBlue.floor().toDouble(),
      G.toDouble(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getImage(ImageSource.camera),
      builder: (context, AsyncSnapshot<List<double>> snapshot) {
        if (snapshot.hasData) {
          return HomeScreen(data: snapshot.data!);
        } else {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
          );
        }
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.data}) : super(key: key);
  final List<double> data;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String pH = "";
  bool showph = false;
  bool ph2 = false;
  bool ph7 = false;
  bool ph14 = false;
  bool showKnownConc = false;
  bool showcolumn = false;
  List<String> pHs = ['2', '7', '12'];
  TextEditingController slope = TextEditingController();
  TextEditingController intercept = TextEditingController();
  double M = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * .03,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        setState(() {
                          // showph ? showph = false : showph = true;
                          showph = true;
                        });
                      });
                    },
                    child: Container(
                      width: size.width * .85,
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: containerDeco,
                      child: const Center(
                        child: Text(
                          'Add pH',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(visible: showph, child: buildRow()),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: showcolumn,
                    child: ph2
                        ? buildColumn(
                            size, "-0.02518", "0.36731", widget.data[3])
                        : ph7
                            ? buildColumn(
                                size, "-0.00644", "0.3967", widget.data[3])
                            : buildColumn(
                                size, "-0.01952", "0.33193", widget.data[3]),
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Container(
                    width: size.width * .85,
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                    ),
                    child: Center(
                      child: Text(
                        'RGB = r(${widget.data[0]})   g(${widget.data[1]})    b(${widget.data[2]})',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * .05,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Visibility(
                    visible: showKnownConc,
                    child: Text(
                      'Final Concentration = ${pow(10, M)} (mole)',
                      style: TextStyle(color: Colors.black, fontSize: size.width*.06,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildColumn(
      Size size, String slopeadd, String interceptadd, double G) {
    slope = TextEditingController(text: slopeadd);
    intercept = TextEditingController(text: interceptadd);
    return Column(
      children: [
        TextField(
          controller: slope,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Add Slope',
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[100],
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        TextField(
          controller: intercept,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Add Intercept',
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[100],
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        InkWell(
          onTap: () {
            setState(() {
              M = (G - double.parse(intercept.text)) / double.parse(slope.text);
              showKnownConc = true;
            });
          },
          child: Container(
            width: size.width * .85,
            padding: const EdgeInsets.only(
                // left: size.width * .25,
                // right: size.width * .25,
                top: 20,
                bottom: 20),
            decoration: containerDeco,
            child: const Center(
              child: Text(
                'Add Intercept, Slope',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRow() {
    return Row(
      children: [
        Radio(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: Colors.black,
          value: '2',
          groupValue: pH,
          onChanged: (value) {
            setState(() {
              pH = value as String;
              ph2 ? ph2 = false : ph2 = true;
              ph7 = false;
              ph14 = false;
              // showcolumn ? showcolumn = false : showcolumn = true;
              showcolumn = true;
            });
          },
        ),
        const Text('2'),
        const SizedBox(width: 30),
        Radio(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: Colors.black,
          value: '7',
          groupValue: pH,
          onChanged: (value) {
            setState(() {
              pH = value as String;
              ph7 ? ph7 = false : ph7 = true;
              ph14 = false;
              ph2 = false;
              // showcolumn ? showcolumn = false : showcolumn = true;
              showcolumn = true;
            });
          },
        ),
        const Text('7'),
        const SizedBox(width: 30),
        Radio(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: Colors.black,
          value: '12',
          groupValue: pH,
          onChanged: (value) {
            setState(() {
              pH = value as String;
              ph14 ? ph14 = false : ph14 = true;
              ph7 = false;
              ph2 = false;
              // showcolumn ? showcolumn = false : showcolumn = true;
              showcolumn = true;
            });
          },
        ),
        const Text('12'),
      ],
    );
  }
}
