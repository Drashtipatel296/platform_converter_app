import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/provider/switch_provider.dart';
import 'package:provider/provider.dart';
import '../../provider/theme_provider.dart';
import '../view/screens/ios_screen/ios_screen.dart';
import '../view/screens/material_screen/home/home_screen.dart';

class AdaptiveScreen extends StatelessWidget {
  const AdaptiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isActive = Provider.of<SwitchProvider>(context).isAndroid;
    final isDarkMode = Provider.of<ThemeProvider>(context).isDark;


    if (isActive) {
      return MaterialApp(
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const MaterialScreen(),
      );
    } else {
      return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoTheme(
              data: CupertinoThemeData(
                brightness: themeProvider.isDark
                    ? Brightness.dark
                    : Brightness.light,
              ),
              child: const IosScreen(),
            ),
          );
        },
      );
    }
  }
}