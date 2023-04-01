import 'package:flutter/material.dart';

class ContactDetailScreen extends StatelessWidget {
   ContactDetailScreen({Key? key}) : super(key: key);

TextEditingController hospitalAddress=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextField(
            controller: hospitalAddress,
            decoration: InputDecoration(
              hintText: 'Hospital Address',
            ),
          ),
        ),
      ),
    );
  }
}
