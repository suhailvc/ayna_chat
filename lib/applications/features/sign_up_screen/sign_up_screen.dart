import 'package:ayna_task/applications/features/login_screen/login_screen.dart';
import 'package:ayna_task/applications/features/login_screen/widgets/custom_text_field.dart';
import 'package:ayna_task/applications/features/sign_up_screen/signup_bloc/bloc/signup_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up for Chat App',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                  const SizedBox(height: 15),
                  CustomTextField(
                    dataController: nameController,
                    secure: false,
                    icon: const Icon(Icons.person),
                    hintText: 'Full name',
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    dataController: emailController,
                    secure: false,
                    icon: const Icon(Icons.email),
                    hintText: 'email',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    dataController: passwordController,
                    secure: true,
                    icon: const Icon(Icons.lock),
                    hintText: 'Password',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () async {
                      BlocProvider.of<SignupBloc>(context).add(SignupEventBloc(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                          context: context));
                      emailController.clear();
                      passwordController.clear();
                      nameController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 78, 69, 206),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false);
                        },
                      text: ' Log in',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 78, 69, 206),
                        fontSize: 15,
                      ),
                    )
                  ])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
