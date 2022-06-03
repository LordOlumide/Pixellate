import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pixellate/functionality/file_getter.dart';
import 'package:pixellate/components/image_display_card.dart';
import 'package:pixellate/functionality/permissions.dart';
import 'package:pixellate/constants.dart';
import 'package:provider/provider.dart';
import 'package:pixellate/components/selected_card.dart';

class ChooseScreen extends StatefulWidget {
  static const screen_id = 'choose_screen';

  // passed down because of the ChangeNotifierProvider
  SelectedCard currentSelectedCard;
  ChooseScreen(this.currentSelectedCard);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState(currentSelectedCard);
}

class _ChooseScreenState extends State<ChooseScreen> {
  // passed down value
  SelectedCard currentSelectedCard;
  _ChooseScreenState(this.currentSelectedCard);

  // The List of image cards
  final List<DisplayCard> baseDisplayList = [];

  // adds a new picture
  void addPicture(DisplayCard newPicture) {
    baseDisplayList.add(newPicture);
  }

  // initialize it to contain all the images from listOfInitialImages
  initializeBaseDisplayList() {
    for (int i = 0; i < listOfInitialImages.length; i++) {
      addPicture(DisplayCard(
        picture: listOfInitialImages[i],
        onCardSelected: () {
          setCardToSelected(i);
        },
      ));
    }
  }

  /// unselect the previous selected card and
  /// set currentSelectedCard to the new selected card.
  setCardToSelected(int index) {
    if (currentSelectedCard.current != null) {
      currentSelectedCard.changeCardToFalse();
    }
    print('triggered');
    // set the new selected card.
    currentSelectedCard.current = baseDisplayList[index];
    currentSelectedCard.changeCardToTrue();
    print('triggered again');
  }

  // // refresh the baseDisplayList
  // refreshBaseDisplayList() {
  //   for (DisplayCard card in baseDisplayList) {
  //
  //   }
  // }

  /// Returns the given image file in a DisplayCard
  DisplayCard fileToDisplayCard(imageFile) {
    return DisplayCard(
      picture: Image.file(imageFile),
      onCardSelected: () {
        // setCardToSelected();
      },
    );
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
                  DisplayCard newPicture = fileToDisplayCard(imageFile);
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
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          ),
          itemCount: baseDisplayList.length,
          itemBuilder: (BuildContext context, int index) {
            return baseDisplayList[index];
          },
        );
      }),
    );
  }
}
