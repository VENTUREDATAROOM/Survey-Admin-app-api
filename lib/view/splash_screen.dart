import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/color/app_color.dart';
import '../view_models/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController sp = SplashController();

  @override
  void initState() {
    sp.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(child: Image.asset("assets/images/ice_launcher.png")),
            Center(
              child: Text('welcome_back'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
