import 'package:flutter/material.dart';
import 'package:pixellate/screens/loading_screen.dart';
import 'package:pixellate/screens/editing_screen/editing_screen.dart';
import 'package:pixellate/screens/choose_screen/choose_picture_screen.dart';
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
        primarySwatch: Colors.purple,
      ),
      initialRoute: LoadingScreen.screen_id,
      routes: {
        LoadingScreen.screen_id: (context) => LoadingScreen(),
        EditingScreen.screen_id: (context) => EditingScreen(),
        ChooseScreen.screen_id: (context) => ChooseScreen(),
      },
    );
  }
}
