import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color/app_color.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SizedBox(height: height * 0.15),
              const Icon(
                Icons.cloud_off,
                color: AppColor.blueColor,
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              Text(
                'general_exception'.tr,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.15),
              InkWell(
                onTap: widget.onPress,
                child: Container(
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                      color: AppColor.blueColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Retry',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
