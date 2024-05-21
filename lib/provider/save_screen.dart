import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/provider/switch_provider.dart';
import 'package:provider/provider.dart';
import '../model/global_img.dart';
import '../view/screens/material_screen/profile/Profile_Screen.dart';
import 'chat_provider.dart';
import 'datepicker_provider.dart';

class AdaptiveSaveButton extends StatelessWidget {
  const AdaptiveSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? OutlinedButton(
        onPressed: () {
          Provider.of<ChatProvider>(context, listen: false).addData(
              PersonDataModel(
                  imgPath:
                  Provider.of<PersonAddProvider>(context, listen: false)
                      .imgPath ??
                      null,
                  chatConversation: txtChatConversation?.text ?? "",
                  name: txtFullName != null ? txtFullName!.text : "",
                  phoneNumber:
                  txtPhoneNumber != null ? txtPhoneNumber!.text : "",
                  date: Provider.of<PersonAddProvider>(context,
                      listen: false)
                      .dateTime ??
                      DateTime.now(),
                  timeOfDay:
                  Provider.of<PersonAddProvider>(context, listen: false)
                      .timeOfDay ??
                      TimeOfDay.now()));
          Provider.of<PersonAddProvider>(context, listen: false).imgPath =
          null;
          Provider.of<PersonAddProvider>(context, listen: false)
              .clearController();
        },
        child: const Text("Save"))
        : CupertinoButton(
      child: Container(
          height: 45,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(10)),
          child: const Text(
            "Save",
            style: TextStyle(color: CupertinoColors.white),
          )),
      onPressed: () {
        Provider.of<ChatProvider>(context, listen: false).addData(
            PersonDataModel(
                imgPath:
                Provider.of<
                    PersonAddProvider>(context, listen: false)
                    .imgPath ??
                    null,
                chatConversation:
                txtChatConversation !=
                    null
                    ? txtChatConversation!.text
                    : "",
                name: txtFullName != null ? txtFullName!.text : "",
                phoneNumber:
                txtPhoneNumber != null ? txtPhoneNumber!.text : "",
                date: Provider.of<PersonAddProvider>(context,
                    listen: false)
                    .dateTime ??
                    DateTime.now(),
                timeOfDay:
                Provider.of<PersonAddProvider>(context, listen: false)
                    .timeOfDay ??
                    TimeOfDay.now()));
        Provider.of<PersonAddProvider>(context, listen: false).imgPath =
        null;

        Provider.of<PersonAddProvider>(context, listen: false)
            .clearController();
      },
    );
  }
}