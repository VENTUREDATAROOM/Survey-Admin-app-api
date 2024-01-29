import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/color/app_color.dart';
import '../res/components/radio_button.dart';
import '../res/routes/routes_name.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: Container(
          height: 300,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Text(
                "Select Language /भाषा चुने ",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Get.updateLocale(Locale("en", "US"));
                        Get.toNamed(RouteName.loginView);
                      },
                      child: RadioButton(
                        position: 0,
                        title: "English",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Get.updateLocale(Locale("hi", "IN"));
                        Get.toNamed(RouteName.loginView);
                      },
                      child: RadioButton(
                        position: 3,
                        title: "Hindi",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
