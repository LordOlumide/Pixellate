import 'package:flutter/material.dart';
import 'package:pixellate/screens/intro_screen.dart';
import 'package:pixellate/screens/editing_screen.dart';
import 'package:pixellate/screens/choose_picture_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp({});

  // Note: Everything here is configured only for android.
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
