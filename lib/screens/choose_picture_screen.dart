import 'package:flutter/material.dart';
import 'package:pixellate/screens/editing_screen.dart';
import 'package:pixellate/components/image_display_card.dart';

class ChooseScreen extends StatelessWidget {
  static const screen_id = 'choose_screen';

  const ChooseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Choose base picture'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, EditingScreen.screen_id);
            },
            icon: Icon(Icons.forward),
          ),
        ],
      ),
      body: ListView(
        children: [
          Row(
            children: <Widget>[
              DisplayCard(image: AssetImage(
                  'images/testing_stock/stickFigureMale.png'),
              ),
              DisplayCard(image: AssetImage(
                  'images/testing_stock/stickFigureFemale.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
