import 'package:adventure_nepal/app/modules/home/views/home_page.dart';
import 'package:adventure_nepal/app/modules/otp_verify/views/otp_verify_view.dart';
import 'package:adventure_nepal/app/utils/storage_util.dart';
import 'package:adventure_nepal/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/api_client.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_images.dart';
import '../../../theme/app_styles.dart';
import '../../../utils/validators.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/password_field.dart';
import '../../forgot_password/views/forgot_password_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginController());

  String? email = "shrawankumarthakur77@gmail.com";
  String? password = "12345678";
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
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
                  "Sign In",
                  style: AppStyles.headingStyle,
                ),
                const SizedBox(
                  height: 20,
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
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const ForgotPasswordView());
                      },
                      child: Text("Forgot Password?",
                          style: AppStyles.labelStyle
                              .copyWith(color: AppColors.brandSecondaryAlt2)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                loginObserver()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginObserver() {
    return Obx(() {
      final response = controller.loginResponse.value;
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
            controller.doLogin(email ?? "", password ?? "").then((value) {
              if (value.status == ApiStatus.SUCCESS) {
                if (value.response?.isVerified == true) {
                  Get.offAll(() => const HomePage());
                  StorageUtil.setIsLoggedIn(true);
                } else {
                  Get.to(() => OtpVerifyView(
                        email: email ?? "",
                      ));
                }
              } else {
                StorageUtil.clear();
                SnackBarUtil.showSnackBar(
                    message: value.message ?? "Error: Unknown");
              }
            });
          }
        });
  }
}
