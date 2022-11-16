import 'package:flutter/material.dart';
import 'package:tinpet/app/modules/match/presenter/views/soul_mate_result_view.dart';
import 'package:tinpet/app/shared/components/app_bar_component.dart';
import 'package:tinpet/app/shared/components/drawer_component.dart';
import 'package:tinpet/app/shared/theme/color_theme.dart';
import 'package:tinpet/app/shared/theme/text_theme.dart';

enum ResponseOne { yes, no }

enum ResponseTwo { yes, no }

enum ResponseThree { yes, no }

enum ResponseFour { yes, no }

class HowAboutThisPetView extends StatefulWidget {
  const HowAboutThisPetView({super.key});

  @override
  State<HowAboutThisPetView> createState() => _HowAboutThisPetViewState();
}

class _HowAboutThisPetViewState extends State<HowAboutThisPetView> {
  ResponseOne _responseOne = ResponseOne.yes;
  ResponseTwo _responseTwo = ResponseTwo.yes;
  ResponseThree _responseThree = ResponseThree.yes;
  ResponseFour _responseFour = ResponseFour.yes;
  ValueNotifier<bool> showLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    onShowIsLoading();
  }

  showIsLoading() {
    setState(() {
      showLoading.value = true;
    });
  }

  onShowIsLoading() {
    showLoading.addListener(() async {
      await Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SoulMateResultView(
              backToSoulMate: false,
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    if (showLoading.value) {
      return Scaffold(
        drawer: const DrawerComponent(),
        body: Stack(
          children: [
            Center(
              child: SizedBox(
                width: deviceSize.width - 80,
                height: deviceSize.width - 80,
                child: CircularProgressIndicator(
                  color: MyColorTheme.red,
                  strokeWidth: 5,
                ),
              ),
            ),
            const AppBarComponent(
              iconBlack: false,
            ),
          ],
        ),
      );
    }
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: showIsLoading,
        style: ElevatedButton.styleFrom(backgroundColor: MyColorTheme.red),
        child: Text(
          'Confirmar',
          style: MyTextTheme.body2,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: const DrawerComponent(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 70,
              bottom: 0,
              left: 16,
              right: 16,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tem o costume de praticar exercícios ao ar livre?',
                      style: MyTextTheme.body3,
                    ),
                    ListTile(
                      title: Text(
                        'Sim',
                        style: MyTextTheme.body4,
                      ),
                      leading: Radio<ResponseOne>(
                        value: ResponseOne.yes,
                        groupValue: _responseOne,
                        onChanged: (value) {
                          setState(() {
                            _responseOne = value as ResponseOne;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'No',
                        style: MyTextTheme.body4,
                      ),
                      leading: Radio<ResponseOne>(
                        value: ResponseOne.no,
                        groupValue: _responseOne,
                        onChanged: (value) {
                          setState(() {
                            _responseOne = value as ResponseOne;
                          });
                        },
                      ),
                    ),
                    Text(
                      'Procura um cão dócil ou um protetor?',
                      style: MyTextTheme.body3,
                    ),
                    ListTile(
                      title: Text(
                        'Dócil',
                        style: MyTextTheme.body4,
                      ),
                      leading: Radio<ResponseTwo>(
                        value: ResponseTwo.yes,
                        groupValue: _responseTwo,
                        onChanged: (value) {
                          setState(() {
                            _responseTwo = value as ResponseTwo;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Protetor',
                        style: MyTextTheme.body4,
                      ),
                      leading: Radio<ResponseTwo>(
                        value: ResponseTwo.no,
                        groupValue: _responseTwo,
                        onChanged: (value) {
                          setState(() {
                            _responseTwo = value as ResponseTwo;
                          });
                        },
                      ),
                    ),
                    Text(
                      'Mora em casa ou apartamento?',
                      style: MyTextTheme.body3,
                    ),
                    ListTile(
                      title: Text(
                        'Casa',
                        style: MyTextTheme.body4,
                      ),
                      leading: Radio<ResponseThree>(
                        value: ResponseThree.yes,
                        groupValue: _responseThree,
                        onChanged: (value) {
                          setState(() {
                            _responseThree = value as ResponseThree;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Apartamento',
                        style: MyTextTheme.body4,
                      ),
                      leading: Radio<ResponseThree>(
                        value: ResponseThree.no,
                        groupValue: _responseThree,
                        onChanged: (value) {
                          setState(() {
                            _responseThree = value as ResponseThree;
                          });
                        },
                      ),
                    ),
                    Text(
                      'Tem filhos pequenos?',
                      style: MyTextTheme.body3,
                    ),
                    ListTile(
                      title: Text(
                        'Sim',
                        style: MyTextTheme.body4,
                      ),
                      leading: Radio<ResponseFour>(
                        value: ResponseFour.yes,
                        groupValue: _responseFour,
                        onChanged: (value) {
                          setState(() {
                            _responseFour = value as ResponseFour;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'No',
                        style: MyTextTheme.body4,
                      ),
                      leading: Radio<ResponseFour>(
                        value: ResponseFour.no,
                        groupValue: _responseFour,
                        onChanged: (value) {
                          setState(() {
                            _responseFour = value as ResponseFour;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height - 150,
              child: const AppBarComponent(
                iconBlack: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
