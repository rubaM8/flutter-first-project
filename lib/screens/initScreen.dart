import 'package:flutter/material.dart';
import 'package:projectapp/widgets/initScreenBody.dart';

class initScreen extends StatelessWidget {
  final String name;

  const initScreen(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InitScreenBody(name),
    );
  }
}
