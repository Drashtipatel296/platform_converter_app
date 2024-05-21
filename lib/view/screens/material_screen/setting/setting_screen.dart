import 'package:flutter/material.dart';
import 'package:platform_converter_app/view/screens/ios_screen/settings/components/profile_container.dart';
import 'package:provider/provider.dart';
import '../../../../provider/profile_provider.dart';
import '../../../../provider/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.person,
                size: 27,
                color: Colors.grey,
              ),
              title: Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('Update Profile Data'),
              trailing: Switch(
                value: Provider
                    .of<ProfileProvider>(context, listen: true)
                    .isOpen,
                onChanged: (value) {
                  Provider.of<ProfileProvider>(context, listen: false).onTap(
                      value);
                },
              ),
            ),
            Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                return profileProvider.isOpen
                    ? Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    child: profile(),)
                    : Container();
              },
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(
                Icons.light_mode_outlined,
                size: 27,
                color: Colors.grey,
              ),
              title: Text(
                'Theme',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('Change Theme'),
              trailing: Switch(
                value: Provider
                    .of<ThemeProvider>(context, listen: true)
                    .isDark,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeTheme(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}