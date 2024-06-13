part of 'login_bloc.dart';

class LoginEvent {}

class LoginEventBloc extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;
  LoginEventBloc({required this.email, required this.password, required this.context});
}
