import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wecare/providers/chats_provider.dart';
import 'package:wecare/providers/models_provider.dart';
import 'package:wecare/screens/consult.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // scaffoldBackgroundColor: scaffoldBackgroundColor,
            appBarTheme: AppBarTheme(
              // color: cardColor,
            )),
        home: const ChatScreen(),
      ),
    );
  }
}
