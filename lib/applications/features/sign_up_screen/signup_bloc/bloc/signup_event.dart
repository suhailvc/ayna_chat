part of 'signup_bloc.dart';

class SignupEvent {}

class SignupEventBloc extends SignupEvent {
  final String email;
  final String password;
  final String name;
  final BuildContext context;
  SignupEventBloc(
      {required this.email,
      required this.password,
      required this.name,
      required this.context});
}
