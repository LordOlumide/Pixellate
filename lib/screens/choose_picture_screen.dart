import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pixellate/components/file_getter.dart';
import 'package:pixellate/components/image_display_card.dart';
import 'package:pixellate/components/permissions.dart';
import 'package:pixellate/components/display_card_list.dart';
import 'package:pixellate/constants.dart';

class ChooseScreen extends StatefulWidget {
  static const screen_id = 'choose_screen';

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  // The List of image cards is in the DisplayCardsList()._displayList. There is
  //  a getter to return a copy and a function (addPicture) to add new pictures.
  DisplayCardsList imageCardListObject = DisplayCardsList();

  // initialize it to contain all the images from listOfInitialImages
  initializeImageCardListObject() {
    for (int i = 0; i < listOfInitialImages.length; i++) {
      imageCardListObject.addPicture(DisplayCard(
        picture: listOfInitialImages[i],
        onCardSelected: () {} //TODO,
      ));
    }
  }

  /// Returns the given image file in a DisplayCard
  DisplayCard fileToDisplayCard(imageFile) {
    return DisplayCard(
        picture: Image.file(imageFile),
        onCardSelected: () {} //TODO:,
    );
  }

  @override
  void initState() {
    super.initState();
    checkForStoragePermission();

    initializeImageCardListObject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Choose picture'),
        actions: [
          IconButton(
            onPressed: () async {
              List<File>? imageFiles = await getNewImageFiles();
              if (imageFiles != null) {
                for (File imageFile in imageFiles) {
                  DisplayCard newPicture = fileToDisplayCard(imageFile);
                  setState(() {
                    imageCardListObject.addPicture(newPicture);
                  });
                }
              }
            },
            icon: Icon(Icons.add_a_photo),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.forward),
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          ),
          itemCount: imageCardListObject.baseDisplayList.length,
          itemBuilder: (BuildContext context, int index) {
            return imageCardListObject.baseDisplayList[index];
          },
        ),
      ),
    );
  }
}
