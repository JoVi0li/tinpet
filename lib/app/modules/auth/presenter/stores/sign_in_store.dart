import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tinpet/app/modules/auth/domain/useCases/sign_in_with_google_use_case.dart';
import 'package:tinpet/app/modules/auth/presenter/controllers/sign_in_controller.dart';
import 'package:tinpet/app/modules/auth/presenter/states/sign_in_state.dart';

class SignInStore extends ValueNotifier<SignInState> {
  SignInStore(this._signInWithGoogleUseCase, this._signInController)
      : super(InitialSignInState());

  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignInController _signInController;

  Future<void> signWithGoogle(BuildContext context) async {
    value = LoadingSignInState();

    var response = await _signInWithGoogleUseCase();

    response.fold(
      (l) {
        value = ErrorSignInState(l.code, l.message);
        _signInController.showErrorDialog(l, context);
      },
      (r) {
        value = SuccessSignInState(r);
        _signInController.saveUser(r).then((saved) {
          if (!saved) {
            var error = FirebaseAuthException(
              code: 'cannot-saved',
              message: '''Erro ao salvar as informações do
                usuário, tente novamente.''',
            );

            value = ErrorSignInState(error.code, error.message);
            
            _signInController.showErrorDialog(error, context);
          } else {
            _signInController.navToMatch(context);
          }
        });
      },
    );
  }
}
