import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinpet/app/modules/match/presenter/controllers/drawer_controller.dart';
import 'package:tinpet/app/modules/match/presenter/controllers/page_view_controller.dart';
import 'package:tinpet/app/shared/components/app_bar_component.dart';
import 'package:tinpet/app/shared/components/drawer_component.dart';
import 'package:tinpet/app/shared/theme/color_theme.dart';
import 'package:tinpet/app/shared/theme/text_theme.dart';

class MatchView extends StatefulWidget {
  const MatchView({super.key});

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  // ignore: unused_field
  late final MyDrawerController _drawerController;
  late final PageViewController _pageViewController;

  @override
  void initState() {
    super.initState();
    _drawerController = context.read<MyDrawerController>();
    _pageViewController = context.read<PageViewController>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const DrawerComponent(),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageViewController.pageControllerOne,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Image.network(
                _pageViewController.dogs[index]['image']!,
                width: deviceSize.width,
                height: deviceSize.height,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              );
            },
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
          const AppBarComponent(iconBlack: false,),
          Positioned(
            left: 16,
            bottom: deviceSize.height * 0.15,
            child: SizedBox(
              height: 150,
              width: deviceSize.width,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageViewController.pageControllerTwo,
                itemBuilder: ((context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _pageViewController.dogs[index]['name']!,
                        style: MyTextTheme.body5,
                      ),
                      Text(
                        """${_pageViewController.dogs[index]['race']!}, ${_pageViewController.dogs[index]['age']!}""",
                        style: MyTextTheme.body5,
                      ),
                      Text(
                        _pageViewController.dogs[index]['shelter']!,
                        style: MyTextTheme.body6,
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
          Positioned(
            width: deviceSize.width,
            bottom: deviceSize.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: MyColorTheme.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        blurStyle: BlurStyle.normal,
                        color: MyColorTheme.black.withOpacity(0.5),
                        offset: const Offset(1.5, 3),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close, size: 30),
                    onPressed: () {
                      setState(() {
                        _pageViewController.nextPage();
                      });
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: MyColorTheme.white,
                      elevation: 6,
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: MyColorTheme.red,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        blurStyle: BlurStyle.normal,
                        color: MyColorTheme.black.withOpacity(0.5),
                        offset: const Offset(1.5, 3),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: MyColorTheme.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _pageViewController.nextPage();
                      });
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: MyColorTheme.white,
                      elevation: 6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
