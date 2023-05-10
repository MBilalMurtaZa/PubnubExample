import 'package:pubnub/core.dart';
import 'package:pubnub/pubnub.dart';

import '../main.dart';


class PnRepo {
  final String pubnubPublishKey = "pub-c-8b3b660e-8b3a-4c06-841b-bde510815d30";
  final String pubnubSubscribeKey = "sub-c-9b016ca5-da11-4a3f-aa09-497909d9c4fe";
  final String chatChannelName = "497909d9c4fe-da11-4a3f-aa09-";
  late Channel chatChannel;

  late PubNub pubnub;



  init(){
    final myKeySet = Keyset(subscribeKey: pubnubSubscribeKey, publishKey: pubnubPublishKey, userId: UserId(userId));
    pubnub = PubNub(defaultKeyset: myKeySet);
    chatChannel = pubnub.channel(chatChannelName);
  }

  Future<PublishResult> sendMessage(Map data, {Channel? channel})  async {
    PublishResult result = await (channel??chatChannel).publish(data);
    return result;
  }


}








