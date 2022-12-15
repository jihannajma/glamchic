import 'package:flutter/material.dart';
import 'package:uts_mobile/homepage2.dart';
import 'package:uts_mobile/loginpage.dart';
import 'package:uts_mobile/view/about.dart';
import 'package:uts_mobile/view/bebas.dart';
import 'package:uts_mobile/view/register.dart';
import 'package:uts_mobile/view/splashscreen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
