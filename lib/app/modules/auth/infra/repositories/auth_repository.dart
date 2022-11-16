import 'package:firebase_auth/firebase_auth.dart';
import 'package:tinpet/app/modules/auth/domain/repositories/i_auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<Either<FirebaseAuthException, UserCredential>>
      signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return right(
        await FirebaseAuth.instance.signInWithCredential(credential),
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'too-many-requests':
          return left(
            FirebaseAuthException(
              code: e.code,
              message: 'O limite de requisições foi atingido.',
            ),
          );

        case 'account-exists-with-different-credential':
          return left(
            FirebaseAuthException(
              code: e.code,
              message: 'A conta já existe com credenciais diferentes.',
            ),
          );

        case 'network-request-failed':
          return left(
            FirebaseAuthException(
              code: e.code,
              message: 'Ocorreu um erro de rede.',
            ),
          );

        case 'requires-recent-login':
          return left(
            FirebaseAuthException(
              code: e.code,
              message: '''O usuário realizou login recentemente,
                  por isso não é possível efetuar novamente.
                  Utilize a reautenticação para resolver.''',
            ),
          );

        case 'user-token-expired':
          return left(
            FirebaseAuthException(
              code: e.code,
              message: 'Token expirado, realize login novamente.',
            ),
          );

        case 'user-disabled':
          return left(
            FirebaseAuthException(
              code: e.code,
              message: 'Usuário desabilitado, utilize outra conta.',
            ),
          );

        default:
          return left(
            FirebaseAuthException(
              code: e.code,
              message: e.message,
            ),
          );
      }
    }
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential>> signInWithApple() {
    throw UnimplementedError();
  }
}
