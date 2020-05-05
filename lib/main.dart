import 'package:covid19_tracker/HomePage.dart';
import 'package:covid19_tracker/datasource.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      fontFamily: 'Circular',
      primaryColor: primaryBlack,
    ),
  ));
}