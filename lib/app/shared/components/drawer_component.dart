import 'package:tinpet/app/modules/match/presenter/controllers/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tinpet/app/shared/theme/color_theme.dart';
import 'package:tinpet/app/shared/theme/text_theme.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final MyDrawerController _controller;
  late final Map<String, String>? user;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.duration = const Duration(seconds: 6);
    _animationController.repeat();
    _controller = context.read<MyDrawerController>();
    user = _controller.getUser();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 304.0,
      semanticLabel: 'drawer',
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: 304.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DrawerHeader(
              child: LottieBuilder.asset(
                'lib/app/shared/assets/animations/dog_drawer_animation.json',
                height: 150,
                width: 150,
              ),
            ),
            _DrawerItem(
              title: 'Tinpet',
              subtitle: 'O bom e velho match',
              onTap: () => _controller.onPressedMatch(context),
              selected: false,
            ),
            _DrawerItem(
              title: 'Que tal esse pet?',
              subtitle: 'Escolhemos para você',
              onTap: () => _controller.onPressedHowAboutThisPet(context),
              selected: false,
            ),
            _DrawerItem(
              title: 'Alma gêmea',
              subtitle: 'Encontre o pet que é a sua cara',
              onTap: () => _controller.onPressedSoulMate(context),
              selected: false,
            ),
            const Spacer(),
            _UserCard(user: user),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  final String title;
  final String subtitle;

  final void Function() onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      selected: selected,
      selectedColor: MyColorTheme.red,
      enabled: true,
      style: ListTileStyle.drawer,
      dense: false,
      minVerticalPadding: 14,
      title: Text(
        title,
        style: MyTextTheme.body3,
      ),
      subtitle: Text(
        subtitle,
        style: MyTextTheme.body4,
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final Map<String, String>? user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: user?['photo'] != null || user?['photo'] != ''
            ? Image.network(user!['photo']!)
            : Image.asset(
                'lib/app/shared/assets/images/user_default_image.jpg'),
      ),
      style: ListTileStyle.drawer,
      dense: false,
      minVerticalPadding: 14,
      title: Text(
        user?['name'] ?? '',
        style: MyTextTheme.body3,
      ),
      subtitle: Row(
        children: [
          Text(
            'Ver perfil ',
            style: MyTextTheme.body4,
          ),
          const SizedBox(width: 5),
          SvgPicture.asset(
            'lib/app/shared/assets/icons/arrow_up_right_icon.svg',
          )
        ],
      ),
    );
  }
}
