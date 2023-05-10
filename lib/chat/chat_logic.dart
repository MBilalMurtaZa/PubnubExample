/// Generated by Flutter GetX Starter on 2022-11-03 12:36

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:pubnub/pubnub.dart';
import 'package:pubnubexample/chat/chat_model.dart';
import 'package:pubnubexample/main.dart';


class ChatLogic extends GetxController {

  var scrollController = ScrollController();

  var isLoading = false;


  var senderColor = const Color(0xFFE9E9EB);

  var chatController = TextEditingController();

  Subscription subscription = pnRepo.pubnub.subscribe(channels: {pnRepo.chatChannelName});

  List<ChatModel> list = <ChatModel>[].obs;


  @override
  Future<void> onInit() async {
    BatchHistoryResult message = await pnRepo.pubnub.batch.fetchMessages({pnRepo.chatChannelName});
    list.assignAll(message.channels[pnRepo.chatChannelName]!.map((e) => chatModelFromJson(e.message)));
    chatListener();
    super.onInit();
  }


  chatListener(){


    subscription.messages.listen((Envelope event) {
      list.add(chatModelFromJson(event.payload));
    });
  }
  





  void onSendMessage() async{
    // type: 0 = text, 1 = image, 2 = sticker
    if(chatController.text.isEmpty){
      pShowToast(message: 'Nothing to send');
      return;
    }

    ChatModel chatModel = ChatModel(idFrom: userId, idTo: peerId, timestamp: DateTime.now().microsecondsSinceEpoch, content: chatController.text, type: 0);
    PublishResult result = await pnRepo.sendMessage(chatModel.toJson());
    if(result.isError){
      pShowToast(message: result.description);
    }else{
      pShowToast(message: result.description);
      chatController.clear();
    }

  }



}