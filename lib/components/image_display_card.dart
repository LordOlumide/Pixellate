import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  final Image picture;
  final onCardTapped;
  bool isSelected;

  // TODO: Implement color change on selected picture
  DisplayCard({
    this.isSelected = false,
    this.onCardTapped,
    this.picture = const Image(
        image: AssetImage('images/testing_stock/stickFigureMale.png')),
  });

  selectOrUnselect(bool choice) {
    isSelected = choice;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTapped,
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          color: Colors.grey[300],
          image: DecorationImage(
            image: picture.image,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(isSelected ? 0.4 : 0.0),
                BlendMode.srcOver
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
