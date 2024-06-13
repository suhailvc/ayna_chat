import 'package:ayna_task/applications/core/widgets/warning_widget.dart';
import 'package:ayna_task/data/models/user_details.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

signUpUser(
    {required name,
    requiredemail,
    required password,
    required email,
    required context}) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  if (name.isEmpty || email.isEmpty || password.isEmpty) {
    warning(context, 'Please fill in all the fields.');
    return;
  }

  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    warning(context, 'Please enter a valid email address.');
    return;
  }

  if (password.length < 6) {
    warning(context, 'Password must be at least 6 characters long.');
    return;
  }
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  } catch (error) {
    warning(context, 'email already present');

    return;
  }
  await auth.authStateChanges().firstWhere((user) => user != null);
  String uid = auth.currentUser!.uid;
  UserDetails user = UserDetails(
    name: name,
    email: email,
    password: password,
    userId: uid,
  );
  Map<String, dynamic> userData = user.toJson();
  FirebaseFirestore.instance.collection('users').doc(uid).set(userData);
  FirebaseFirestore.instance.collection('uids').add({
    'uid': FirebaseAuth.instance.currentUser!.uid.toString(),
  });
  FirebaseFirestore.instance.collection('chat_list').doc(uid).set({"Uid": []});

  warning(context, 'Successfully signed up');
}
