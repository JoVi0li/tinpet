import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinpet/app/modules/match/presenter/controllers/soul_mate_result_controller.dart';
import 'package:tinpet/app/shared/routes/app_routes.dart';
import 'package:tinpet/app/shared/theme/color_theme.dart';
import 'package:tinpet/app/shared/theme/text_theme.dart';

import '../../../../shared/components/app_bar_component.dart';

class SoulMateResultView extends StatefulWidget {
  const SoulMateResultView({super.key, required this.backToSoulMate});
  final bool backToSoulMate;

  @override
  State<SoulMateResultView> createState() => _SoulMateResultViewState();
}

class _SoulMateResultViewState extends State<SoulMateResultView> {
  late final SoulMateResultController controller;
  late final Map<String, String> dog;

  @override
  void initState() {
    super.initState();
    controller = context.read<SoulMateResultController>();
    dog = controller.dogShort();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColorTheme.red,
        onPressed: () {
          if(widget.backToSoulMate){
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.SOULMATE,
          );

          } else if(!widget.backToSoulMate){

          Navigator.pushReplacementNamed(
            context,
            AppRoutes.HOW_ABOUT_THIS_PET,
          );
          }
        },
        child: const Icon(
          Icons.keyboard_return,
        ),
      ),
      body: Stack(
        children: [
          Image.network(
            dog['image']!,
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
          ),
          Positioned(
            left: 16,
            bottom: deviceSize.height * 0.10,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dog['name']!,
                  style: MyTextTheme.body5,
                ),
                Text(
                  """${dog['race']!}, ${dog['age']!}""",
                  style: MyTextTheme.body5,
                ),
                Text(
                  dog['description']!,
                  style: MyTextTheme.body7,
                ),
              ],
            ),
          ),
          const AppBarComponent(
            iconBlack: false,
          ),
        ],
      ),
    );
  }
}
