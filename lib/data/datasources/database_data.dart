import 'package:ayna_task/data/constant/constants.dart';
import 'package:ayna_task/data/models/chat_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseServices {
  Box<MessageModel>? _chatBox;
  openChatBox() async {
    _chatBox = await Hive.openBox<MessageModel>('chat');
  }

  sendMessage({required message}) async {
    await _chatBox!.add(message);
    messages = _chatBox!.values.toList();
  }

  List<MessageModel> getMessage() {
    return _chatBox!.values.toList();
  }
}
