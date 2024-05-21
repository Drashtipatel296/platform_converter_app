import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../provider/chat_provider.dart';
import '../../../../utils/adaptive_widgets/listtile_screen.dart';

class IosCall extends StatelessWidget {
  const IosCall({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);

    return Column(
      children: [
        ...List.generate(
            providerTrue.personData.length,
                (index) => AdaptiveListTile(
              index: index,
              isForChat: false,
            ))
      ],
    );
  }
}