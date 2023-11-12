import 'dart:developer';

import 'package:adventure_nepal/app/theme/app_colors.dart';
import 'package:adventure_nepal/app/theme/app_images.dart';
import 'package:adventure_nepal/app/theme/app_styles.dart';
import 'package:adventure_nepal/app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerifyView extends StatefulWidget {
  const OtpVerifyView({Key? key}) : super(key: key);

  @override
  State<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends State<OtpVerifyView> {
  String? enteredCode;
  var formKey = GlobalKey<FormState>();
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorWhite,
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
                height: 15,
              ),
              AppButton(
                  text: "Continue",
                  onTap: () {
                    log("tapped");
                  }),
              const SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
