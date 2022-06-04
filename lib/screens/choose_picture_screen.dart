import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pixellate/functionality/file_getter.dart';
import 'package:pixellate/components/image_display_card.dart';
import 'package:pixellate/functionality/permissions.dart';
import 'package:pixellate/constants.dart';
import 'package:provider/provider.dart';
import 'package:pixellate/components/image_card_list.dart';
import 'package:pixellate/components/selected_card.dart';

class ChooseScreen extends StatefulWidget {
  static const screen_id = 'choose_screen';

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  // The List of image cards
  final List<Image> baseImageList = [];
  // List of image card states
  final List<bool> baseStatesList = [];

  // initialize it to contain all the images from listOfInitialImages
  initializeBaseDisplayList() {
    for (int i = 0; i < listOfInitialImages.length; i++) {
      addPicture(listOfInitialImages[i]);
    }
  }

  // var to keep track of the number of imagCards in baseDisplayList
  int displayListCounter = 0;

  // adds a new picture
  void addPicture(Image newPicture) {
    baseImageList.add(newPicture);
    baseStatesList.add(false);
  }

  @override
  void initState() {
    super.initState();
    checkForStoragePermission();

    initializeBaseDisplayList();
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
                  Image newPicture = Image.file(imageFile);
                  setState(() {
                    addPicture(newPicture);
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
      body: OrientationBuilder(builder: (context, orientation) {
        return Consumer<SelectedImage>(builder: (context, card, child) {
          // The currently selected card
          SelectedImage currentSelectedCard = card;

          setToSelectedImage(int index) {
            baseStatesList.setAll(0,
                [for (int i = 0; i < baseStatesList.length; i++) false]);
            baseStatesList[index] = true;
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            ),
            itemCount: baseImageList.length,
            itemBuilder: (BuildContext context, int index) {
              return DisplayCard(
                picture: baseImageList[index],
                isSelected: baseStatesList[index],
                onCardTapped: () {
                  setToSelectedImage(index);
                },
              );
            },
          );
        });
      }),
    );
  }
}
