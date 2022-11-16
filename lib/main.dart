import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tinpet/app/modules/auth/domain/useCases/sign_in_with_google_use_case.dart';
import 'package:tinpet/app/modules/auth/infra/repositories/auth_repository.dart';
import 'package:tinpet/app/modules/auth/presenter/controllers/sign_in_controller.dart';
import 'package:tinpet/app/modules/auth/presenter/stores/sign_in_store.dart';
import 'package:tinpet/app/modules/auth/presenter/views/animation_view.dart';
import 'package:tinpet/app/modules/auth/presenter/views/sign_in_view.dart';
import 'package:tinpet/app/modules/match/presenter/controllers/drawer_controller.dart';
import 'package:tinpet/app/modules/match/presenter/controllers/page_view_controller.dart';
import 'package:tinpet/app/modules/match/presenter/controllers/soul_mate_result_controller.dart';
import 'package:tinpet/app/modules/match/presenter/views/how_about_this_pet_view.dart';
import 'package:tinpet/app/modules/match/presenter/views/match_view.dart';
import 'package:tinpet/app/modules/match/presenter/views/soul_mate_view.dart';
import 'package:tinpet/app/shared/routes/app_routes.dart';
import 'firebase_options.dart';

late List<CameraDescription> _cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => AuthRepository()),
        Provider(create: (context) => SoulMateResultController()),
        Provider(create: (context) => SignInController()),
        Provider(create: (context) => MyDrawerController()),
        Provider(create: (context) => PageViewController()),
        Provider(create: (context) => _cameras),
        Provider(
          create: (context) => SignInWithGoogleUseCase(
            context.read<AuthRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInStore(
            context.read<SignInWithGoogleUseCase>(),
            context.read<SignInController>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinpet',
      initialRoute: AppRoutes.ANIMATION,
      routes: {
        AppRoutes.ANIMATION: (context) => const AnimationView(),
        AppRoutes.SIGN_IN: (context) => const SignInView(),
        AppRoutes.MATCH: (context) => const MatchView(),
        AppRoutes.SOULMATE: (context) => const SoulMateView(),
        AppRoutes.HOW_ABOUT_THIS_PET: (context) => const HowAboutThisPetView(),
      },
    );
  }
}
