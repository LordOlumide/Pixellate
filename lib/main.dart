import 'package:flutter/material.dart';
import 'package:pixellate/screens/intro_screen.dart';
import 'package:pixellate/screens/editing_screen.dart';
import 'package:pixellate/screens/choose_picture_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixellate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: IntroScreen.screen_id,
      routes: {
        IntroScreen.screen_id: (context) => IntroScreen(),
        EditingScreen.screen_id: (context) => EditingScreen(),
        ChooseScreen.screen_id: (context) => ChooseScreen(),
      },
    );
  }
}
