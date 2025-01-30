import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectapp/screens/initScreen.dart';

class yourName extends StatefulWidget {
  const yourName({super.key});

  @override
  _yourNameState createState() => _yourNameState();
}

class _yourNameState extends State<yourName> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
            height: 200,
          ),
          SvgPicture.asset(
            'assets/images/rafiki.svg',
            height: 227.36,
            width: 320,
          ),
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 120, 200, 100),
                        width: 2.0,
                      ),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 212, 51, 51),
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 212, 51, 51),
                        width: 2.0,
                      ),
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
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
                  final name = _nameController.text.trim();
                  if (name.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please enter your name',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => initScreen(name),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    'Submit',
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
