import 'package:ayna_task/applications/features/login_screen/login_bloc/bloc/login_bloc.dart';
import 'package:ayna_task/applications/features/login_screen/widgets/custom_text_field.dart';
import 'package:ayna_task/applications/features/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();

    var passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 90),
              Text(
                'Chat App',
                style: GoogleFonts.pacifico(fontSize: 30),
              ),
              const SizedBox(height: 6),
              const Text(
                'Log in our account',
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 78, 69, 206)),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                dataController: emailController,
                secure: false,
                icon: const Icon(Icons.email),
                hintText: 'Email',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                dataController: passwordController,
                secure: true,
                icon: const Icon(Icons.lock),
                hintText: 'Password',
              ),
              const SizedBox(height: 19),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(221, 78, 69, 206),
                          minimumSize: const Size(100, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context).add(LoginEventBloc(
                            email: emailController.text,
                            password: passwordController.text,
                            context: context));
                      },
                      child: const Text('Log In'));
                },
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 10,
                      height: 1.4,
                      thickness: 2,
                      color: Color.fromARGB(221, 78, 69, 206),
                    ),
                  ),
                  Text(
                    'Or with',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(221, 78, 69, 206)),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10,
                      color: Color.fromARGB(221, 78, 69, 206),
                      height: 1.4,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Don't have account? Lets  ",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  TextSpan(
                    text: 'Sign Up',
                    style: const TextStyle(
                        color: Color.fromARGB(221, 78, 69, 206), fontSize: 15),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                  )
                ]),
              )
            ],
          ),
        ),
      )),
    );
  }
}
