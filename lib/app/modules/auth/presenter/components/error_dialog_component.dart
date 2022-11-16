import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinpet/app/shared/theme/color_theme.dart';
import 'package:tinpet/app/shared/theme/text_theme.dart';

class ErrorDialogComponent extends StatelessWidget {
  const ErrorDialogComponent({
    super.key,
    required this.error,
  });

  final FirebaseAuthException error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Algo inesperado aconteceu',
        style: MyTextTheme.body2?.copyWith(
          color: MyColorTheme.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(
              error.message ?? '',
              style: MyTextTheme.body2?.copyWith(
                color: MyColorTheme.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "código do erro: ${error.code}",
              style: MyTextTheme.body2?.copyWith(
                fontSize: 14,
                color: MyColorTheme.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'Ok, tentar novamente.',
            style: MyTextTheme.body2?.copyWith(
              color: MyColorTheme.black,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
