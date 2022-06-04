import 'package:flutter/material.dart';
import 'package:pixellate/components/image_display_card.dart';
import 'package:pixellate/constants.dart';

class ImageStateList extends ChangeNotifier{

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

  // adds a new picture
  void addPicture(Image newPicture) {
    baseImageList.add(newPicture);
    baseStatesList.add(false);
  }

}
