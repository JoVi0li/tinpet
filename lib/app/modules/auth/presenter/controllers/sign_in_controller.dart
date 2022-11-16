import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinpet/app/modules/auth/presenter/components/error_dialog_component.dart';
import 'package:tinpet/app/shared/routes/app_routes.dart';

class SignInController {
  SignInController() {
    _init();
  }

  late final SharedPreferences _sharedPreferences;

  SharedPreferences get sharedPrefe => _sharedPreferences;

  void _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<Widget?> showErrorDialog(
    FirebaseAuthException error,
    BuildContext context,
  ) async {
    return showDialog<Widget>(
      context: context,
      builder: (context) => ErrorDialogComponent(error: error),
    );
  }

  Future<void> navToMatch(BuildContext context) async {
    return Navigator.pushNamedAndRemoveUntil<void>(
      context,
      AppRoutes.MATCH,
      (route) => false,
    );
  }

  Future<bool> saveUser(UserCredential userCred) async {
    final userSaved = await sharedPrefe.setStringList(
      'user',
      <String>[
        userCred.user?.uid ?? '',
        userCred.user?.email ?? '',
        userCred.user?.displayName ?? '',
        userCred.user?.photoURL ?? ''
      ],
    );
    final credentialSaved = await sharedPrefe.setStringList(
      'credential',
      <String>[
        userCred.credential?.accessToken ?? '',
        userCred.credential?.token?.toString() ?? '',
      ],
    );

    if (!userSaved || !credentialSaved) {
      return false;
    }

    return true;
  }
}
