import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tinpet/app/modules/auth/domain/repositories/i_auth_repository.dart';

abstract class ISignInWithAppleUseCase {
  Future<Either<FirebaseAuthException, UserCredential>> call();
}

class SignInWithAppleUseCase implements ISignInWithAppleUseCase {
  SignInWithAppleUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Either<FirebaseAuthException, UserCredential>> call() async {
    return await _repository.signInWithApple();
  }
}
