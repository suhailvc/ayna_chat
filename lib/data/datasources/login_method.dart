import 'package:ayna_task/applications/core/widgets/warning_widget.dart';
import 'package:ayna_task/applications/features/chat_screen/chat_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

logInMethod({required email, required password, required context}) async {
  if (email.isEmpty || password.isEmpty) {
    warning(context, 'Please fill in all the fields.');
    return;
  }

  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    warning(context, 'Please enter a valid email address.');
    return;
  }

  if (password.length < 6 || password.isEmpty) {
    warning(context, 'Password must be at least 6 characters long.');
    return;
  }
  try {
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatScreen(),
          ),
          (route) => false);
    }
  } catch (error) {
    warning(context, 'Invalid email or password. Please try again.');
  }
}
