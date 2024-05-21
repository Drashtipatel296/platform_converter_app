import 'package:flutter/material.dart';

class AddImage extends StatelessWidget {
  const AddImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 30, horizontal: 110),
      child: CircleAvatar(
        radius: 75,
        child: Icon(
          Icons.add_a_photo_outlined,
          size: 35,
        ),
      ),
    );
  }
}