import 'package:flutter/material.dart';
import 'package:pubnubexample/chat/chat_view.dart';
import 'package:pubnubexample/services/pn_repo.dart';

late double deviceWidth;
late double deviceHeight;
late PnRepo pnRepo;

String userId = '200';
String peerId = '100';

Future<void> main() async{
  pnRepo = PnRepo();
  pnRepo.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const ChatView(),
    );
  }
}

