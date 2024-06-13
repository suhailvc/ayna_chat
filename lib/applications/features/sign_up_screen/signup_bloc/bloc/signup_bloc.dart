import 'package:ayna_task/data/datasources/signup_method.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';


part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEventBloc>((event, emit) async {
      await signUpUser(
          name: event.name,
          password: event.password,
          email: event.email,
          context: event.context);
      return emit(SignupState());
    });
  }
}
