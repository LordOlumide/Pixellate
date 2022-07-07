import 'package:flutter/material.dart';
import 'package:pixellate/screens/editing_screen/editing_screen.dart';

class LoadingScreen extends StatelessWidget {
  static const screen_id = 'intro_screen';

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pixxelate.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 44,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, EditingScreen.screen_id);
                },
                style: ButtonStyle(
                  backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF47006b)),
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
