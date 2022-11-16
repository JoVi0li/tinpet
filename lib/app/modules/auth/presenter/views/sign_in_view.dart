import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tinpet/app/modules/auth/presenter/states/sign_in_state.dart';
import 'package:tinpet/app/modules/auth/presenter/stores/sign_in_store.dart';
import 'package:tinpet/app/shared/theme/color_theme.dart';
import 'package:tinpet/app/shared/theme/text_theme.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late final SignInStore _store;

  @override
  void initState() {
    super.initState();
    _store = context.read<SignInStore>();
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  void signIn(){
    
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final widthWithPadding = MediaQuery.of(context).size.width - 80;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/app/shared/assets/images/sign_in_background_image.png',
            width: deviceSize.width,
            height: deviceSize.height,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          Container(
            width: deviceSize.width,
            height: deviceSize.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MyColorTheme.black.withOpacity(0),
                  MyColorTheme.black.withOpacity(0.75)
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 70,
              ),
              child: Column(
                children: [
                  Text(
                    'tinpet'.toUpperCase(),
                    style: MyTextTheme.headline2,
                  ),
                  const Spacer(),
                  Text(
                    'Encontre a companhia perfeita',
                    style: MyTextTheme.body1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Um novo conceito de adoção',
                    style: MyTextTheme.body2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 56),
                  ValueListenableBuilder(
                    valueListenable: _store,
                    builder: (context, value, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(widthWithPadding, 70),
                          backgroundColor: MyColorTheme.white,
                        ),
                        onPressed: () => _store.signWithGoogle(context),
                        child: value == LoadingSignInState()
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: MyColorTheme.red,
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    'lib/app/shared/assets/icons/google_logo_icon.svg',
                                  ),
                                  Text(
                                    'Entrar com o Google',
                                    style: MyTextTheme.googleSignInButton,
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
