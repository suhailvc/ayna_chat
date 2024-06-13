// import 'package:ayna_task/applications/features/sign_up_screen/signup_bloc/bloc/signup_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SignUpButton extends StatefulWidget {
//   const SignUpButton({super.key});

//   @override
//   State<SignUpButton> createState() => _SignUpButtonState();
// }

// class _SignUpButtonState extends State<SignUpButton> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SignupBloc, SignupState>(
//       builder: (context, state) {
//         return ElevatedButton(
//           onPressed: () async {bloc},
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color.fromARGB(255, 78, 69, 206),
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: const Text(
//             'Sign Up',
//             style: TextStyle(fontSize: 16, color: Colors.white),
//           ),
//         );
//       },
//     );
//   }
// }
