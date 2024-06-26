import 'package:flutter/material.dart';
import 'package:platform_converter_app/provider/adaptive_screen.dart';
import 'package:platform_converter_app/provider/chat_provider.dart';
import 'package:platform_converter_app/provider/datepicker_provider.dart';
import 'package:platform_converter_app/provider/imgpicker_provider.dart';
import 'package:platform_converter_app/provider/profile_provider.dart';
import 'package:platform_converter_app/provider/switch_provider.dart';
import 'package:platform_converter_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SwitchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomImageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PersonAddProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        ),
      ],
      // child: PlatformConverter(),
      child: const AdaptiveScreen(),
    ),
  );
}

//
// class PlatformConverter extends StatelessWidget {
//   const PlatformConverter({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       themeMode: Provider.of<ThemeProvider>(context,listen: true).isDarkMode
//           ? ThemeMode.dark
//           : ThemeMode.light,
//       debugShowCheckedModeBanner: false,
//       // // theme: ThemeData(
//       //   textTheme: TextTheme(
//       //     titleLarge: TextStyle(
//       //         fontWeight: FontWeight.w500, fontSize: 28, color: Colors.black),
//       //   ),
//       // ),
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       home :  AdaptiveScreen()
//
//
//     );
//   }
// }
//
//
// class Ios extends StatelessWidget {
//   const Ios({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       theme: CupertinoThemeData(
//         brightness: Provider.of<ThemeProvider>(context).brightness
//       ),
//       debugShowCheckedModeBanner: false,
//       home: Ios_Screen(),
//     );
//   }
// }