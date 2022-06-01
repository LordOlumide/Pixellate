import 'package:flutter/material.dart';
import 'package:pixellate/screens/choose_picture_screen.dart';

class IntroScreen extends StatelessWidget {
  static const screen_id = 'intro_screen';

  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1e80ff),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pixxelate.png'),
            fit: BoxFit.contain,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ChooseScreen.screen_id);
                },
                style: ButtonStyle(
                  backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF47006b)),
                ),
                child: const Text(
                    'Edit a new picture'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
