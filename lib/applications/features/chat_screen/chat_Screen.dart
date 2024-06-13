import 'dart:convert';

import 'package:ayna_task/applications/features/login_screen/login_screen.dart';
import 'package:ayna_task/data/constant/constants.dart';
import 'package:ayna_task/data/datasources/database_data.dart';
import 'package:ayna_task/data/models/chat_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  // ignore: no_logic_in_create_state
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final WebSocketChannel _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.org'),
  );

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  var userId = FirebaseAuth.instance.currentUser!.uid;
  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      final messageModel = MessageModel(
        message: message,
        userId: userId,
        toId: 'toId',
        sentTime: DateTime.now().toIso8601String(),
        messageId: DateTime.now().millisecondsSinceEpoch.toString(),
      );
      _channel.sink.add(json.encode(messageModel.toJson()));
      setState(() {
        messages.add(messageModel);
      });
      DatabaseServices().sendMessage(message: messageModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 226, 231, 231),
        title: Text(
          'Chat With Anonymous',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            decorationThickness: 2.0,
          ),
        ),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              label: Text("Log Out"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: _channel.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as String;
                    try {
                      final jsonData =
                          json.decode(data) as Map<String, dynamic>;
                      final message = MessageModel.fromJson(jsonData);
                      messages.add(message);
                    } catch (e) {
                      print('Error decoding JSON: $e');
                      print('Received data: $data');
                    }
                  }
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return Align(
                          alignment: index % 2 == 0
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? const Color.fromARGB(255, 118, 68, 255)
                                    : Colors.teal,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              message.message ?? "",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ));
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Send a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_controller.text);
                    _controller.clear();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
