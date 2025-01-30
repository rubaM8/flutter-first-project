import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectapp/widgets/yourName.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 58, 70, 70),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 103,
          ),
          const Text('TOURWMINDER',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 39,
                fontFamily: 'Nunito',
              )),
          const SizedBox(
            height: 12,
          ),
          Stack(
            children: [
              // Outline layer
              Text(
                "Plan your tour and forget, we will remind you in advance!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Nunito',
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2 // Outline thickness
                    ..color =
                        const Color.fromARGB(255, 0, 0, 0), // Outline color
                ),
              ),
              // Fill and Shadow layer
              const Text(
                "Plan your tour and forget, we will remind you in advance!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Nunito',
                  color: Color.fromARGB(255, 216, 216, 216), // Fill color
                  shadows: [
                    Shadow(
                      blurRadius: 2.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                      offset: Offset(4.0, 4.0), // Shadow offset
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          SvgPicture.asset(
            'assets/images/rafiki.svg',
            height: 227.36,
            width: 320,
          ),
          const SizedBox(
            height: 130,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color.fromARGB(255, 193, 203, 156)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const yourName()));
                },
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Color.fromARGB(255, 58, 70, 70),
                      fontSize: 20,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
