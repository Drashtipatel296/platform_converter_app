import 'package:flutter/material.dart';

import '../../profile/Profile_Screen.dart';

final TextEditingController name = TextEditingController();
final TextEditingController bio = TextEditingController();

Widget profileContainer() {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          getImage();
        },
        child: CircleAvatar(
          radius: 60,
          backgroundImage: image != null ? FileImage(image!) : null,
          child: image == null
              ? Icon(
            Icons.camera_alt,
            size: 50,
            color: Colors.grey[800],
          )
              : null,
        ),
      ),
      TextField(
        controller: name,
        decoration: InputDecoration(
          hintText: 'Enter your name...',
        ),
      ),
      TextField(
        controller: bio,
        decoration: InputDecoration(
          hintText: 'Enter your Bio...',
        ),
      ),
      Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text('SAVE'),
          ),
          TextButton(onPressed: () {}, child: Text('CLEAR'))
        ],
      )
    ],
  );
}