import 'package:flutter/material.dart';
import 'package:praan_daan/Screens/blood_type_screen_donor.dart';
import 'package:praan_daan/Screens/blood_type_screen_receiver.dart';
import 'package:praan_daan/themes.dart';

import '../widget/button.dart';

class RequestOrganScreen extends StatelessWidget {
  const RequestOrganScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.black,
        title: Text(
          'Request Organ',
          style: appBarTitleStyle,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(
                    (context),
                    MaterialPageRoute(
                      builder: (context) => BloodCategoryReceiver(),
                    ),
                  );
                },
                child: Button(heading: 'Blood')),
            InkWell(child: Button(heading: 'Kidney')),
            InkWell(child: Button(heading: 'Bonemarrow')),
            InkWell(child: Button(heading: 'Heart')),
            InkWell(child: Button(heading: 'Liver')),
          ],
        ),
      ),
    );
  }
}
