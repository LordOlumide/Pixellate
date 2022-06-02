import 'package:flutter/material.dart';
import 'package:pixellate/screens/choose_picture_screen.dart';
import 'package:provider/provider.dart';

class EditingScreen extends StatelessWidget {
  static const screen_id = 'editing_screen';

  const EditingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8e8e8e),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Pixellate'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
          TextButton(
            child: Text(
              'Choose pictures'
            ),
            onPressed: () {
              Navigator.pushNamed(context, ChooseScreen.screen_id);
            },
          ),
        ],
      ),
    );
  }
}
