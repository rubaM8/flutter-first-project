import 'package:flutter/material.dart';
import 'package:projectapp/widgets/yourName.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: yourName());
  }
}
