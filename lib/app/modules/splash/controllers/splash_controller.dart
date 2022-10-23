import 'package:flutter/cupertino.dart';
import 'package:flutter_gdscmaliki/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_gdscmaliki/app/routes/app_pages.dart';
import 'package:flutter_gdscmaliki/constants/constant.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement SplashController

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    animationInitilization();
    super.onInit();
  }

  animationInitilization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.forward();
  }

  void navigateToLogin() async {
    WidgetsFlutterBinding.ensureInitialized();
    await firebaseInitialization.then((value) {
      Get.put(LoginController());
      Get.offNamed(Routes.LOGIN);
    });
  }
}
