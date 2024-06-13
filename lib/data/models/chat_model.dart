import 'package:hive_flutter/hive_flutter.dart';
part 'chat_model.g.dart';

@HiveType(typeId: 0)
class MessageModel {
  @HiveField(0)
  final String? message;
  @HiveField(1)
  final String? userId;
  @HiveField(2)
  final String? toId;
  @HiveField(3)
  final String? sentTime;
  @HiveField(4)
  final String? messageId;

  MessageModel({
    required this.message,
    required this.userId,
    required this.toId,
    required this.sentTime,
    required this.messageId,
  });
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      userId: json['userId'],
      toId: json['toId'],
      sentTime: json['sentTime'],
      messageId: json['messageId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'toId': toId,
      'sentTime': sentTime,
      'messageId': messageId,
    };
  }
}
