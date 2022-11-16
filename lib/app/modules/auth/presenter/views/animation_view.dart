import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:tinpet/app/shared/routes/app_routes.dart';
import 'package:tinpet/app/shared/theme/text_theme.dart';

class AnimationView extends StatefulWidget {
  const AnimationView({super.key});

  @override
  State<AnimationView> createState() => _AnimationViewState();
}

class _AnimationViewState extends State<AnimationView>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.duration = const Duration(seconds: 6);
    _animationController.forward();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> navToSignIn(
    BuildContext context,
  ) async {
    return Navigator.pushNamedAndRemoveUntil<void>(
      context,
      AppRoutes.SIGN_IN,
      (route) => false,
    );
  }

  void onLoaded(LottieComposition lottieComp, BuildContext context) {
    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          navToSignIn(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 70,
          horizontal: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'tinpet'.toUpperCase(),
              style: MyTextTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Center(
                child: LottieBuilder.asset(
                  'lib/app/shared/assets/animations/tinpet_splash_animation.json',
                  controller: _animationController,
                  repeat: false,
                  reverse: false,
                  onLoaded: (lottieComp) => onLoaded(lottieComp, context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
