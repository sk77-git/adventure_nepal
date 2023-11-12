import 'dart:developer';

import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:adventure_nepal/app/modules/otp_verify/views/otp_verify_view.dart';
import 'package:adventure_nepal/app/utils/validators.dart';
import 'package:adventure_nepal/app/widgets/input_field.dart';
import 'package:adventure_nepal/app/widgets/loading_widget.dart';
import 'package:adventure_nepal/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_images.dart';
import '../../../theme/app_styles.dart';
import '../../../widgets/app_button.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  String? email;
  final controller = Get.put(ForgotPasswordController());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text("Forgot Password"),
          ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.launcherIcon,
                  width: 135,
                  height: 52,
                ),
                const SizedBox(
                  height: 72,
                ),
                Text(
                  "Forgot Password",
                  style: AppStyles.headingStyle,
                ),
                const SizedBox(
                  height: 41,
                ),
                Text(
                  "Enter your email for verification process. we will send 6 digits code on your email.",
                  style: AppStyles.hintStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                InputField(
                  title: "Email",
                  textInputType: TextInputType.emailAddress,
                  initialValue: email,
                  hint: "abc@abc.com",
                  onChangedCallback: (newValue) {
                    email = newValue;
                  },
                  validator: (string) =>
                      Validator.validateEmail(string: string),
                ),
                const SizedBox(
                  height: 30,
                ),
                submitObserver(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget submitObserver() {
    return Obx(() {
      final response = controller.forgotPasswordResponse.value;
      switch (response.status) {
        case ApiStatus.LOADING:
          return const Center(child: LoadingWidget());
        default:
          return submitButton();
      }
    });
  }

  Widget submitButton() {
    return AppButton(
        text: "Submit",
        fullWidth: true,
        onTap: () {
          bool isValid = formKey.currentState?.validate() ?? false;
          if (isValid) {
            controller.forgotPassword(email ?? "").then((value) {
              if (value.status == ApiStatus.SUCCESS) {
                log("ForgotPassword.success:Email:$email");
                Get.to(() => OtpVerifyView(
                      email: email ?? "",
                      purpose: "forgot-password",
                    ));
                SnackBarUtil.showSnackBar(message: "OTP sent successfully!");
              } else {
                SnackBarUtil.showSnackBar(
                    message: value.message ?? "Something went wrong");
              }
            });
          } else {}
        });
  }
}
