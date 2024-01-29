import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/components/round_button.dart';
import '../res/components/text_form_feild.dart';
import '../utils/validator.dart';
import '../view_models/controller/register_controller.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final registerViewModelController = Get.put(RegistrationController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("register".tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 1.2,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage("assets/images/subji_logo.png"),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    EditTextUtils().getCustomEditTextArea(
                        obscureText: false,
                        labelValue: 'email_hint'.tr,
                        hintValue: 'email_hint'.tr,
                        validator: (str) {
                          if (str!.isEmpty) {
                            return Validator.validateEmail(str ?? "");
                          }
                        },
                        controller:
                            registerViewModelController.emailController.value,
                        keyboardType: TextInputType.emailAddress,
                        textStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14.0),
                        validationErrorMsg: 'email_hint'.tr),
                    const SizedBox(
                      height: 20,
                    ),
                    EditTextUtils().getCustomEditTextArea(
                        obscureText: false,
                        labelValue: 'Enter Name',
                        hintValue: 'Enter name',
                        validator: (str) {
                          if (str!.isEmpty) {
                            return Validator.validateName(str ?? "");
                          }
                        },
                        controller:
                            registerViewModelController.nameController.value,
                        keyboardType: TextInputType.name,
                        textStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14.0),
                        validationErrorMsg: 'Enter Name'),
                    const SizedBox(
                      height: 20,
                    ),
                    EditTextUtils().getCustomEditTextArea(
                        obscureText: false,
                        labelValue: 'Date Of Birth',
                        hintValue: 'Enter Date Of Birth',
                        validator: (str) {
                          if (str!.isEmpty) {
                            return Validator.validateEmail(str ?? "");
                          }
                        },
                        controller:
                            registerViewModelController.dobController.value,
                        keyboardType: TextInputType.emailAddress,
                        textStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14.0),
                        validationErrorMsg: 'Enter Date Of Birth',
                        isDateOfBirth: true),
                    const SizedBox(
                      height: 20,
                    ),
                    EditTextUtils().getCustomEditTextArea(
                      labelValue: 'password_hint'.tr,
                      hintValue: 'password_hint'.tr,
                      obscureText: true,
                      controller:
                          registerViewModelController.passwordController.value,
                      keyboardType: TextInputType.emailAddress,
                      textStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontSize: 14.0),
                      validationErrorMsg: 'password_hint'.tr,
                      validator: (str) {
                        if (str!.isEmpty) {
                          return Validator.validatePassword(str ?? "");
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    EditTextUtils().getCustomEditTextArea(
                        obscureText: false,
                        labelValue: 'mobile_hint'.tr,
                        hintValue: 'mobile_hint'.tr,
                        validator: (str) =>
                            Validator.validatePhoneNumber(str ?? ""),
                        controller:
                            registerViewModelController.mobileController.value,
                        keyboardType: TextInputType.number,
                        textStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14.0),
                        validationErrorMsg: 'mobile_hint'.tr),
                    const SizedBox(
                      height: 20,
                    ),
                    EditTextUtils().getCustomEditTextArea(
                        obscureText: false,
                        labelValue: 'Aadhar Number'.tr,
                        hintValue: 'Enter Aadhar number'.tr,
                        validator: (str) {
                          if (str!.isEmpty) {
                            return Validator.validateAmountNumber(str ?? "");
                          }
                        },
                        controller:
                            registerViewModelController.aadharController.value,
                        keyboardType: TextInputType.number,
                        textStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14.0),
                        validationErrorMsg: 'Enter Aadhar number'.tr),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Row(
                    //   children: [
                    //     RadioButton(
                    //       position: 0,
                    //       title: "Surveyer",
                    //     ),
                    //     RadioButton(position: 1, title: "Farmer"),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 40,
                    ),
                    Obx(() => RoundButtonWidget(
                          title: 'Register',
                          loading: registerViewModelController.loading.value,
                          onPress: () {
                            if (kDebugMode) {
                              print(_formKey.currentState!.validate());
                            }
                            if (_formKey.currentState!.validate()) {
                              registerViewModelController.registerApi();
                            }
                          },
                          height: 50,
                          width: 200,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
