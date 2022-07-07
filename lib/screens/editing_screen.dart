import 'package:flutter/material.dart';
import 'package:pixellate/screens/choose_picture_screen.dart';
import 'package:image/image.dart';

class EditingScreen extends StatefulWidget {
  static const screen_id = 'editing_screen';

  EditingScreen({Key? key}) : super(key: key);

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  Image? onlyImage;

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
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                image: onlyImage != null
                    ? DecorationImage(image: onlyImage!.image)
                    : DecorationImage(
                        image: AssetImage('images/pixxelate.png')),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextButton(
              child: Text(
                'Choose picture',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              ),
              onPressed: () async {
                dynamic stuff =
                    await Navigator.pushNamed(context, ChooseScreen.screen_id);
                if (stuff != null) {
                  setState(() {
                    onlyImage = stuff;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
