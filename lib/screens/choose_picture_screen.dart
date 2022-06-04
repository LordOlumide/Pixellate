import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pixellate/functionality/file_getter.dart';
import 'package:pixellate/components/image_display_card.dart';
import 'package:pixellate/functionality/permissions.dart';
import 'package:pixellate/components/image_state_lists.dart';

class ChooseScreen extends StatefulWidget {
  static const screen_id = 'choose_screen';

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {

  // object to control the image list and state list
  ImageStateList imageStateObject = ImageStateList();

  // var to keep track of the currently selected image
  Image? currentlySelectedImage;

  @override
  void initState() {
    super.initState();
    checkForStoragePermission();

    imageStateObject.initializeBaseDisplayList();
  }

  @override
  Widget build(BuildContext context) {
    // Assign these for easier access in the build method.
    List<Image> baseImageList = imageStateObject.baseImageList;
    List<bool> baseStatesList = imageStateObject.baseStatesList;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Choose picture'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () async {
              List<File>? imageFiles = await getNewImageFiles();
              if (imageFiles != null) {
                for (File imageFile in imageFiles) {
                  Image newPicture = Image.file(imageFile);
                  setState(() {
                    imageStateObject.addPicture(newPicture);
                  });
                }
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              Navigator.pop(context, currentlySelectedImage);
            },
          ),
        ],
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        /// Changes the currentlySelectedImage and the color of
        /// the chosen card by setting all values in the baseStatesList
        /// to false, then assigning only the chosen one to true.
        setToSelectedImage(int index) {
          currentlySelectedImage = baseImageList[index];
          setState(() {
            baseStatesList.setAll(
                0, [for (int i = 0; i < baseStatesList.length; i++) false]);
            baseStatesList[index] = true;
          });
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
      }),
    );
  }
}
