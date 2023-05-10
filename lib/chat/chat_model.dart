

import 'dart:convert';

List<ChatModel> chatModelListFromJson(str) => List<ChatModel>.from(str.map((x) => ChatModel.fromJson(x)));
ChatModel chatModelFromJson(str) => ChatModel.fromJson((str));

String chatModelToJson(List<ChatModel> data) => json.encode(List.from(data.map((x) => x.toJson())));


class ChatModel {
  ChatModel({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
  });

  String idFrom;
  String idTo;
  int timestamp;
  String content;
  int type;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    idFrom: json["idFrom"],
    idTo: json["idTo"],
    timestamp: json["timestamp"],
    content: json["content"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "idFrom": idFrom,
    "idTo": idTo,
    "timestamp": timestamp,
    "content": content,
    "type": type,
  };
}
