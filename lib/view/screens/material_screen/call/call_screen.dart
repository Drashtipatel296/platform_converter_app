import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import '../../../../provider/chat_provider.dart';
import '../../../../provider/switch_provider.dart';
import '../../../../utils/adaptive_widgets/circleavtar_screen.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAndroid =
        Provider.of<SwitchProvider>(context, listen: true).isAndroid;
    final providerTrue = Provider.of<ChatProvider>(context);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: providerTrue.personData.length,
            itemBuilder: (context, index) {
              var person = providerTrue.personData[index];
              return ListTile(
                  leading: const AdaptiveCircleAvatar(radius: 30),
                  title: Text(person.name ?? "No Name"),
                  subtitle: Text(person.chatConversation ?? "No Conversation"),
                  trailing: IconButton(
                    onPressed: () {
                      Uri uri = Uri.parse(
                          'tel: +91 ${providerTrue.personData[index].phoneNumber}');
                      url.launchUrl(uri);
                    },
                    icon: const Icon(Icons.call),
                  ));
            },
          ),
        ),
      ],
    );
  }
}