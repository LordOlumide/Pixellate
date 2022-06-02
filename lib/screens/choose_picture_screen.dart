import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pixellate/components/image_display_card.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pixellate/components/display_card_list.dart';

class ChooseScreen extends StatefulWidget {
  static const screen_id = 'choose_screen';

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {

  // The List of image cards is in the DisplayCardsList()._displayList. There is
  //  a getter to return a copy and a function (addPicture) to add new pictures.
  late DisplayCardsList imageCardListObject;

  // picture set to be displayed
  List<DisplayCard> currentPictureSet = [];

  // function to refresh the currentPictureSet
  void updateCurrentPictureSet() {
    setState(() {
      currentPictureSet = imageCardListObject.displayList;
    });
  }

  // This is the function that should run when a card is selected. It should
  // set the chosenCard var to the list index of the selected
  // card in imageCardListObject.displayList
  onCardSelected() {

  }

  // I suspect permission checking is not necessary.
  checkStoragePermission() async {
    PermissionStatus permissionStatus = await Permission.storage.status;
    if (permissionStatus != PermissionStatus.granted) {
      await Permission.storage.request().isGranted;
    }
  }

  @override
  void initState() {
    super.initState();
    checkStoragePermission();

    imageCardListObject = DisplayCardsList();
    imageCardListObject.initialize();
    updateCurrentPictureSet();
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
                  DisplayCard newPicture =
                      imageCardListObject.fileToDisplayCard(imageFile);
                  imageCardListObject.addPicture(newPicture);
                }
              }
              updateCurrentPictureSet();
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
          itemCount: currentPictureSet.length,
          itemBuilder: (BuildContext context, int index) {
            if (currentPictureSet != []) {
              return currentPictureSet[index];
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
