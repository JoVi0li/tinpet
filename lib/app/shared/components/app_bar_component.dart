import 'package:flutter/material.dart';
import 'package:tinpet/app/shared/theme/color_theme.dart';
import 'package:tinpet/app/shared/theme/text_theme.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key, required this.iconBlack});
  final bool iconBlack;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'tinpet'.toUpperCase(),
            style: MyTextTheme.headline3,
          ),
          expandedHeight: 150,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: iconBlack ? MyColorTheme.black : MyColorTheme.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ],
    );
  }
}
