import 'package:adventure_nepal/app/modules/otp_verify/views/otp_verify_view.dart';
import 'package:adventure_nepal/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/api_client.dart';
import '../../../theme/app_images.dart';
import '../../../theme/app_styles.dart';
import '../../../utils/validators.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/password_field.dart';
import '../controllers/signup_controller.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final controller = Get.put(SignupController());
  String? fullName = "Shrawan Kumar Thakur";
  String? email = "shrawankumarthakur77@gmail.com";
  String? password = "12345678";
  String? cPassword = "12345678";
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  AppImages.launcherIcon,
                  width: 100,
                ),
                const SizedBox(
                  height: 36,
                ),
                Text(
                  "Sign Up",
                  style: AppStyles.headingStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  title: "Full Name",
                  textInputType: TextInputType.name,
                  initialValue: fullName,
                  hint: "John Doe",
                  onChangedCallback: (newValue) {
                    fullName = newValue;
                  },
                  validator: (string) =>
                      Validator.validateIsEmpty(string: string),
                ),
                const SizedBox(
                  height: 15,
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
                  height: 15,
                ),
                PasswordField(
                  obscureText: !passwordVisible,
                  title: "Password",
                  initialValue: password,
                  suffixIcon: IconButton(
                    icon: !passwordVisible
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.password),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  textInputType: TextInputType.visiblePassword,
                  hint: "**********",
                  onChangedCallback: (newValue) {
                    password = newValue;
                  },
                  validator: (string) =>
                      Validator.validatePassword(string: string),
                ),
                const SizedBox(
                  height: 15,
                ),
                PasswordField(
                  obscureText: !passwordVisible,
                  title: "Confirm Password",
                  initialValue: cPassword,
                  suffixIcon: IconButton(
                    icon: !passwordVisible
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.password),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  textInputType: TextInputType.visiblePassword,
                  hint: "**********",
                  onChangedCallback: (newValue) {
                    cPassword = newValue;
                  },
                  validator: (string) => Validator.confirmPassword(
                      password: password ?? "", cPassword: cPassword ?? ""),
                ),
                const SizedBox(
                  height: 15,
                ),
                loginObserver(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginObserver() {
    return Obx(() {
      final response = controller.registerResponse.value;
      switch (response.status) {
        case ApiStatus.LOADING:
          return const Center(child: LoadingWidget());
        default:
          return loginButton();
      }
    });
  }

  Widget loginButton() {
    return AppButton(
        text: "Sign In",
        fullWidth: true,
        onTap: () {
          bool isValid = formKey.currentState?.validate() ?? false;
          if (isValid) {
            //To hide keyboard
            FocusManager.instance.primaryFocus?.unfocus();
            controller
                .register(fullName ?? "", email ?? "", password ?? "")
                .then((value) {
              if (value.status == ApiStatus.SUCCESS) {
                Get.off(
                    () => OtpVerifyView(email: email ?? "", purpose: "signup"));
                SnackBarUtil.showSnackBar(
                    message: "Register Successful! Verify OTP to continue");
              } else {
                SnackBarUtil.showSnackBar(
                    message: value.message ?? "Error: Unknown");
              }
            });
          }
        });
  }
}
