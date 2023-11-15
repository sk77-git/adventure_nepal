import 'package:adventure_nepal/app/modules/change_password/controllers/change_password_controller.dart';
import 'package:adventure_nepal/app/modules/login/views/login_view.dart';
import 'package:adventure_nepal/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/api_client.dart';
import '../../../theme/app_images.dart';
import '../../../theme/app_styles.dart';
import '../../../utils/validators.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/password_field.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  String? password;
  String? cPassword;
  final controller = Get.put(ChangePasswordController());
  var formKey = GlobalKey<FormState>();

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(''),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  AppImages.launcherIcon,
                  width: 135,
                  height: 52,
                ),
                const SizedBox(
                  height: 72,
                ),
                Text("Reset Password", style: AppStyles.headingStyle),
                const SizedBox(
                  height: 41,
                ),
                PasswordField(
                  obscureText: !passwordVisible,
                  title: "New Password",
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
                  height: 30,
                ),
                PasswordField(
                  obscureText: !passwordVisible,
                  title: "Confirm Password",
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
                  height: 30,
                ),
                continueButton(),
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

  Widget continueButton() {
    return Obx(() {
      final response = controller.changePasswordResponse.value;
      switch (response.status) {
        case ApiStatus.LOADING:
          return const Center(child: LoadingWidget());
        default:
          return AppButton(
              text: "Continue",
              fullWidth: true,
              onTap: () {
                bool isValid = formKey.currentState?.validate() ?? false;
                if (isValid) {
                  if (password == cPassword) {
                    controller
                        .changePassword(widget.email, password ?? "")
                        .then((value) {
                      var response = controller.changePasswordResponse.value;
                      if (response.status == ApiStatus.SUCCESS) {
                        Get.offAll(() => const LoginView());
                        SnackBarUtil.showSnackBar(
                            message:
                                "Password Changed! Login again to continue");
                      } else {
                        SnackBarUtil.showSnackBar(
                            message:
                                "Password Change Failed! ${value.message ?? ""}");
                      }
                    });
                  } else {}
                }
              });
      }
    });
  }
}
