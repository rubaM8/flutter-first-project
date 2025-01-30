import 'package:flutter/material.dart';
import 'package:projectapp/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tourminder App',
        home: SplashScreen() //SplashScreen(), //InitScreenBody(), addTour()
        );
  }
}
