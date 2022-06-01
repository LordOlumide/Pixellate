import 'package:flutter/material.dart';

class EditingScreen extends StatelessWidget {
  static const screen_id = 'editing_screen';

  const EditingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8e8e8e),
      appBar: AppBar(
        title: Text(
          'Pixellate'
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
      ),
    );
  }
}
