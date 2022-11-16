import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInState {}

class InitialSignInState extends SignInState {}

class LoadingSignInState extends SignInState {}

class SuccessSignInState extends SignInState {
  final UserCredential? user;

  SuccessSignInState(this.user);
}

class ErrorSignInState extends SignInState {
  ErrorSignInState(
    this.code,
    this.message,
  );
  final String? code;
  final String? message;
}
