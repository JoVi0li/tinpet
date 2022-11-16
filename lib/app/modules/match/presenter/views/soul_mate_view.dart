import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tinpet/app/modules/match/presenter/views/soul_mate_result_view.dart';
import 'package:tinpet/app/shared/components/app_bar_component.dart';
import 'package:tinpet/app/shared/components/drawer_component.dart';
import 'package:tinpet/app/shared/theme/color_theme.dart';
import 'package:tinpet/app/shared/theme/text_theme.dart';

class SoulMateView extends StatefulWidget {
  const SoulMateView({super.key});

  @override
  State<SoulMateView> createState() => _SoulMateStateView();
}

class _SoulMateStateView extends State<SoulMateView> {
  late List<CameraDescription> _cameras;
  late CameraController controller;
  ValueNotifier<bool> showLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _cameras = context.read<List<CameraDescription>>();
    controller = CameraController(_cameras[1], ResolutionPreset.max);
    initCamera();
    onShowIsLoading();
  }

  initCamera() {
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<XFile> takePhoto() {
    return controller.takePicture();
  }

  Widget cameraWidget(context) {
    var camera = controller.value;
    // fetch screen size
    final size = MediaQuery.of(context).size;

    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * camera.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Transform.scale(
      scale: scale,
      child: Center(
        child: CameraPreview(controller),
      ),
    );
  }

  showIsLoading() {
    setState(() {
      controller.pausePreview();
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
              backToSoulMate: true,
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // Transform.scale(
    //           scale: controller.value.aspectRatio / deviceRatio,
    //           child: Center(
    //             child: AspectRatio(
    //               aspectRatio: controller.value.aspectRatio,
    //               child: CameraPreview(controller),
    //             ),
    //           ),
    //         ),
    //       ),
    if (!controller.value.isInitialized) {
      return Scaffold(
        drawer: const DrawerComponent(),
        body: Stack(
          children: [
            Center(child: CircularProgressIndicator(color: MyColorTheme.red)),
            const AppBarComponent(
              iconBlack: false,
            ),
          ],
        ),
      );
    }
    return Scaffold(
      drawer: const DrawerComponent(),
      floatingActionButton: showLoading.value
          ? Container()
          : FloatingActionButton(
              backgroundColor: MyColorTheme.red,
              onPressed: showIsLoading,
              child: const Icon(
                Icons.camera_alt_outlined,
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: cameraWidget(context),
          ),
          showLoading.value
              ? Center(
                  child: SizedBox(
                    width: deviceSize.width - 80,
                    height: deviceSize.width - 80,
                    child: CircularProgressIndicator(
                      color: MyColorTheme.red,
                      strokeWidth: 5,
                    ),
                  ),
                )
              : Positioned(
                  top: deviceSize.height * 0.2,
                  child: Container(
                    width: deviceSize.width - 80,
                    height: deviceSize.width - 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: MyColorTheme.white,
                        style: BorderStyle.solid,
                        width: 4,
                      ),
                    ),
                  ),
                ),
          showLoading.value
              ? Container()
              : Positioned(
                  left: 20,
                  right: 20,
                  bottom: deviceSize.height * .15,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                          'lib/app/shared/assets/icons/camera_icon.svg'),
                      const SizedBox(height: 15),
                      Text(
                        'Olha o flash',
                        style: MyTextTheme.body3!.copyWith(
                          color: MyColorTheme.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Deixa esse rostinho bunito bem alinhado com a câmera.',
                        style: MyTextTheme.body4!.copyWith(
                          color: MyColorTheme.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
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
