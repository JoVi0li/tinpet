import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tinpet/app/modules/auth/domain/repositories/i_auth_repository.dart';

abstract class ISignInWithGoogleUseCase {
  Future<Either<FirebaseAuthException, UserCredential>> call();
}

class SignInWithGoogleUseCase implements ISignInWithGoogleUseCase {
  SignInWithGoogleUseCase(this._repository);

  final IAuthRepository _repository;

  @override
  Future<Either<FirebaseAuthException, UserCredential>> call() async {
    return await _repository.signInWithGoogle();
  }
}
