import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/profile_provider.dart';
import '../../../../provider/theme_provider.dart';
import '../../material_screen/setting/components/profile_screen.dart';


class IosSettings extends StatelessWidget {
  const IosSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              subtitle: Text('Update Profile Data'),
              trailing: Switch(
                value:
                Provider
                    .of<ProfileProvider>(context, listen: true)
                    .isOpen,
                onChanged: (value) =>
                    Provider.of<ProfileProvider>(context, listen: false)
                        .onTap(value),
              ),
            ),
            Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                return profileProvider.isOpen
                    ? Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    child: profileContainer())
                    : Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.light_mode_outlined),
              title: Text('Theme'),
              subtitle: Text('Change Theme'),
              trailing: Switch(
                inactiveThumbColor: Colors.white,
                value:
                Provider
                    .of<ThemeProvider>(context, listen: true)
                    .isDark,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false).changeTheme(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}