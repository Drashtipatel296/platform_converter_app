import 'package:flutter/cupertino.dart';
final TextEditingController txtFullName = TextEditingController();
final TextEditingController txtMobileNumber = TextEditingController();
final TextEditingController txtChat = TextEditingController();
final TextEditingController txtDate = TextEditingController();
final TextEditingController txtTime = TextEditingController();




class CupertinoTextfield extends StatelessWidget {
  const CupertinoTextfield({
    super.key,
    this.text,
    this.icon,
    this.type,
    this.controller,
  });

  final text;
  final icon;
  final type;
  final controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: CupertinoTextField(
              placeholder: text,
              keyboardType: type,
              prefix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: CupertinoColors.activeBlue,
                ),
              ),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: CupertinoColors.systemGrey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              style: const TextStyle(
                color: CupertinoColors.black,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}