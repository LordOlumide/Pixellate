import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  final ImageProvider image;

  const DisplayCard({this.image = const AssetImage(
      'images/testing_stock/stickFigureMale.png')}
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          image: DecorationImage(
            image: image,
          ),
        ),
      ),
    );
  }
}
