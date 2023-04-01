import 'package:flutter/material.dart';

const BoxShadow primaryShadow =
BoxShadow(blurRadius: 2, color: Color(0x2F000000), spreadRadius: 0,
    offset: Offset(0,5)
);

const BoxShadow containerShadow = BoxShadow(
  offset: Offset(0, 2),
  blurRadius: 6,
  color: Color(0x2F000000),
);

final BoxDecoration containerDeco=BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [containerShadow],
    color: Colors.blue);