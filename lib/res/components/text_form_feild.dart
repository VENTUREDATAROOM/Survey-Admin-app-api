import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class EditTextUtils {
  TextFormField getCustomEditTextArea({
    String labelValue = "",
    String hintValue = "",
    required FormFieldValidator<String> validator,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required TextStyle textStyle,
    required bool obscureText,
    required String validationErrorMsg,
    bool isDateOfBirth = false,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      style: textStyle,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: (value) {
        if (isDateOfBirth) {
          // Format Date of Birth (DD-MM-YYYY)
          var formattedValue = '';

          for (var i = 0; i < value.length; i++) {
            if ((i == 2 || i == 5) && value[i] != '-') {
              formattedValue += '-';
            }
            formattedValue += value[i];
          }

          controller.value = controller.value.copyWith(
            text: formattedValue,
            selection: TextSelection.collapsed(
              offset: formattedValue.length,
            ),
            composing: TextRange.empty,
          );
        }
      },
      decoration: InputDecoration(
        labelText: labelValue.tr,
        hintText: hintValue.tr,
        labelStyle: textStyle,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
