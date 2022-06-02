import 'package:pixellate/components/image_display_card.dart';

/// The object that contains and manages the displayList.
class DisplayCardsList {

  final List<DisplayCard> baseDisplayList = [];

  // adds a new picture
  void addPicture(DisplayCard newPicture) {
    baseDisplayList.add(newPicture);
  }

  // toggleCardState(int index) {
  //   baseDisplayList[index].selectOrUnselect();
  // }
}
