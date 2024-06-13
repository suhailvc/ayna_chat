import 'package:ayna_task/applications/features/chat_screen/chat_Screen.dart';
import 'package:ayna_task/applications/features/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

wait(context) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  await Future.delayed(const Duration(milliseconds: 3700));

  auth.currentUser?.uid != null
      ? Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ChatScreen()))
      : Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
}
