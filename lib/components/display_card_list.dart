import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pixellate/components/image_display_card.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

List<Image> listOfInitialImages = const [
  Image(image: AssetImage('images/testing_stock/stickFigureMale.png')),
  Image(image: AssetImage('images/testing_stock/stickFigureFemale.png')),
  Image(image: AssetImage('images/testing_stock/gown.png')),
  Image(image: AssetImage('images/testing_stock/hat1.png')),
  Image(image: AssetImage('images/testing_stock/hat2.png')),
  Image(image: AssetImage('images/testing_stock/shirt1.png')),
  Image(image: AssetImage('images/testing_stock/trouser.png')),
  Image(image: AssetImage('images/testing_stock/blueBackground.png')),
];

/// The object that contains and manages the displayList.
class DisplayCardsList {
  final List<DisplayCard> _displayList = [];

  // initialize it to contain all the images from listOfInitialImages
  initialize() {
    for (Image image in listOfInitialImages) {
      _displayList.add(DisplayCard(
        picture: image,
      ));
    }
  }

  // returns a copy of _displayList
  List<DisplayCard> get displayList {
    return _displayList;
  }

  // adds a new picture
  void addPicture(DisplayCard newPicture) {
    _displayList.add(newPicture);
  }
}

/// Opens the file picker to get a single image and returns the File object
Future<List<File>?> getNewImageFiles() async {
  List<XFile>? images = [];
  images = await _picker.pickMultiImage();
  if (images != []) {
    return [for (XFile image in images!) File(image.path)];
  }
  return null;
}

/// Returns the image in a DisplayCard if it exists
DisplayCard fileToDisplayCard(imageFile) {
  return DisplayCard(
    picture: Image.file(imageFile),
  );
}
