import 'package:ayna_task/data/datasources/login_method.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEventBloc>((event, emit) async {
      await logInMethod(
          email: event.email, password: event.password, context: event.context);
      return emit(LoginState());
    });
  }
}
