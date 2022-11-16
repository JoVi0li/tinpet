import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAuthRepository {
  Future<Either<FirebaseAuthException, UserCredential>> signInWithGoogle();
  Future<Either<FirebaseAuthException, UserCredential>> signInWithApple();
}
