import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/modules/login/views/login_view.dart';
import 'package:adventure_nepal/app/modules/otp_verify/controllers/otp_verify_controller.dart';
import 'package:adventure_nepal/app/theme/app_images.dart';
import 'package:adventure_nepal/app/theme/app_styles.dart';
import 'package:adventure_nepal/app/widgets/app_button.dart';
import 'package:adventure_nepal/app/widgets/loading_widget.dart';
import 'package:adventure_nepal/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerifyView extends StatefulWidget {
  const OtpVerifyView({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends State<OtpVerifyView> {
  final OtpVerifyController controller = Get.put(OtpVerifyController());
  String? enteredCode;
  var formKey = GlobalKey<FormState>();
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.launcherIcon,
                    width: 150,
                  )
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              Text("Enter 6 Digits Code", style: AppStyles.headingStyle),
              const SizedBox(
                height: 20,
              ),
              Text("Enter your 6 digits code that you received on your email.",
                  style: AppStyles.hintStyle),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: OTPTextField(
                    controller: otpController,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45,
                    fieldStyle: FieldStyle.underline,
                    // style: AppStyles.textStyle,
                    onChanged: (pin) {
                      enteredCode = pin;
                    },
                    onCompleted: (pin) {}),
              ),
              const SizedBox(
                height: 30,
              ),
              continueButton(),
              const SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget continueButton() {
    return Obx(() {
      final response = controller.verifyOtpResponse.value;
      switch (response.status) {
        case ApiStatus.LOADING:
          return const Center(child: LoadingWidget());
        default:
          return AppButton(
              fullWidth: true,
              text: "Continue",
              onTap: () {
                controller
                    .verifyOtp(widget.email, enteredCode ?? "")
                    .then((value) {
                  if (value.status == ApiStatus.SUCCESS) {
                    Get.offAll(() => const LoginView());
                    SnackBarUtil.showSnackBar(
                        message:
                            "OTP Verification successful.Please login to continue");
                  } else {
                    SnackBarUtil.showSnackBar(
                        message:
                            value.response?.message ?? "Something went wrong");
                  }
                });
              });
      }
    });
  }
}
