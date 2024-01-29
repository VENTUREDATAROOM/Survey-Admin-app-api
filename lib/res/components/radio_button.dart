import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/controller/register_controller.dart';

class RadioButton extends StatelessWidget {
  final int position;
  final String title;
  RadioButton({super.key, required this.position, required this.title});

  final registerViewModelController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
        builder: (registerViewModelController) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: title,
              groupValue: registerViewModelController.userRole,
              onChanged: (String? value) {
                registerViewModelController.setUserRole(value!);
              }),
          Text(title)
        ],
      );
    });
  }
}
