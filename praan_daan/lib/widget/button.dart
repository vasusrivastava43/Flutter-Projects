import 'package:flutter/material.dart';

import '../themes.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.heading}) : super(key: key);
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Container(
        height: physicalHeight * .02,
        width: physicalWidth * .27,
        decoration: BoxDecoration(
            color: Color(0xff00CCFF),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 10,
                color: Color(0x2F000000),
              ),
            ]),
        child: Center(
            child: Text(
          heading,
          style: elevatedButtonTextStyle,
        )),
      ),
    );
  }
}
