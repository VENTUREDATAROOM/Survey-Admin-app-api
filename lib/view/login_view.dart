import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/components/round_button.dart';
import '../res/components/text_form_feild.dart';
import '../res/routes/routes_name.dart';
import '../utils/validator.dart';
import '../view_models/controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginViewModelController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("login".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/subji_logo.png"),
                ),
                const SizedBox(
                  height: 60,
                ),
                EditTextUtils().getCustomEditTextArea(
                    obscureText: false,
                    labelValue: 'mobile_hint'.tr,
                    hintValue: 'mobile_hint'.tr,
                    validator: (str) =>
                        Validator.validatePhoneNumber(str ?? ""),
                    controller: loginViewModelController.emailController.value,
                    keyboardType: TextInputType.number,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'error_msg'),
                const SizedBox(
                  height: 20,
                ),
                EditTextUtils().getCustomEditTextArea(
                    labelValue: 'password_hint'.tr,
                    hintValue: 'password_hint'.tr,
                    obscureText: true,
                    validator: (str) {
                      if (str!.isEmpty) {
                        return Validator.validatePassword(str ?? "");
                      }
                    },
                    controller:
                        loginViewModelController.passwordController.value,
                    keyboardType: TextInputType.emailAddress,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14.0),
                    validationErrorMsg: 'error_msg'),
                const SizedBox(
                  height: 40,
                ),
                Obx(() => RoundButtonWidget(
                      title: 'login'.tr,
                      loading: loginViewModelController.loading.value,
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          loginViewModelController.loginApi();
                        }
                      },
                      height: 50,
                      width: 200,
                    )),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.registrationView);
                      },
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14.0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
