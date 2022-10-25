import 'package:animal_bio_app/screens/home_screen.dart';
import 'package:animal_bio_app/screens/splace_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash_screen',
    routes: {
      '/': (context) => HomePage(),
      'splash_screen': (context) => SplashScreen(),
    },
  ));
}
