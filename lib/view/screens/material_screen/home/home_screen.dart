import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/provider/switch_provider.dart';
import 'package:platform_converter_app/view/screens/material_screen/call/call_screen.dart';
import 'package:platform_converter_app/view/screens/material_screen/chat/chat_screen.dart';
import 'package:platform_converter_app/view/screens/material_screen/profile/profile_screen.dart';
import 'package:platform_converter_app/view/screens/material_screen/setting/setting_screen.dart';
import 'package:provider/provider.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final switchProviderTrue = Provider.of<SwitchProvider>(context, listen: true).isAndroid;

    return Scaffold(
      appBar: AppBar(
        title: Text('Platform Converter',style: Theme.of(context).textTheme.titleLarge,),
        actions: [
          Switch(
              value: switchProviderTrue,
              onChanged: (value) {
                Provider.of<SwitchProvider>(context, listen: false).onClick(value);
              },
          ),
        ],
      ),
      body: ContainedTabBarView(
        tabs: const [
          Icon(Icons.person),
          Text('CHATS'),
          Text('CALLS'),
          Text('SETTINGS'),
        ],
        views: [
          ProfileScreen(),
          const ChatTab(),
          const CallScreen(),
          const SettingScreen(),
        ],
      ),
    );
  }
}
