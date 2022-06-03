import 'package:flutter/material.dart';
import 'image_display_card.dart';

class SelectedCard extends ChangeNotifier{

  DisplayCard? current;

  void changeCardToFalse() {
    current!.selectOrUnselect(false);
    notifyListeners();
  }

  changeCardToTrue() {
    current!.selectOrUnselect(true);
    notifyListeners();
  }

}