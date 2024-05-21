import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/view/screens/ios_screen/profile/profile_screen.dart';
import 'package:platform_converter_app/view/screens/ios_screen/settings/setting_screen.dart';
import 'package:provider/provider.dart';
import '../../../provider/switch_provider.dart';
import 'call/call_screen.dart';
import 'chat/chat_screen.dart';

class IosScreen extends StatelessWidget {
  const IosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Platform Converter',
          style: TextStyle(fontSize: 20),
        ),
        trailing: CupertinoSwitch(
          value: Provider.of<SwitchProvider>(context, listen: true).isAndroid,
          onChanged: (value) =>
              Provider.of<SwitchProvider>(context, listen: false)
                  .onClick(value),
        ),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              //label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone),
              label: 'Call',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Setting',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              switch (index) {
                case 0:
                  return const IosProfile();
                  break;
                case 1:
                  return const IosChats();
                  break;
                case 2:
                  return const IosCall();
                  break;
                case 3:
                  return const IosSettings();
                  break;
                default:
                  return Container();
              }
            },
          );
        },
      ),
    );
  }
}