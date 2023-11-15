import 'package:adventure_nepal/app/api/api_client.dart';
import 'package:adventure_nepal/app/modules/home/views/home_page.dart';
import 'package:adventure_nepal/app/modules/select_interests/controllers/select_interests_controller.dart';
import 'package:adventure_nepal/app/widgets/app_button.dart';
import 'package:adventure_nepal/app/widgets/loading_widget.dart';
import 'package:adventure_nepal/app/widgets/selectable_button.dart';
import 'package:adventure_nepal/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../theme/app_images.dart';
import '../../../theme/app_styles.dart';

class SelectInterestsView extends StatefulWidget {
  const SelectInterestsView({Key? key}) : super(key: key);

  @override
  State<SelectInterestsView> createState() => _SelectInterestsViewState();
}

class _SelectInterestsViewState extends State<SelectInterestsView> {
  final SelectInterestsController controller =
      Get.put(SelectInterestsController());
  List<String> choices = [
    'Mountains',
    'Temples',
    'Villages',
    'Cities',
    'Rivers',
    'Lakes',
    'Hiking',
    'Camping',
    "Foods"
  ];
  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Container(
        height: Device.height,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              AppImages.launcherIcon,
              width: 100,
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              "Select your interests",
              style: AppStyles.headingStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "You will get recommendations based on the categories you select now. This can be changed later as well",
              textAlign: TextAlign.center,
              style: AppStyles.subtitleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                ...List.generate(
                    choices.length,
                    (index) => SelectableButton(
                        text: choices[index],
                        onTap: (value) {
                          if (value) {
                            selectedInterests.add(choices[index]);
                          } else {
                            selectedInterests.remove(choices[index]);
                          }
                        })),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                AppButton(text: "Skip", onTap: () {}),
                const Spacer(),
                Obx(() {
                  final data = controller.changePasswordResponse.value;
                  switch (data.status) {
                    case ApiStatus.LOADING:
                      return const LoadingWidget();
                    default:
                      return AppButton(
                          text: "Continue",
                          onTap: () {
                            controller
                                .storeInterests(9, selectedInterests)
                                .then((value) {
                              if (value.status == ApiStatus.SUCCESS) {
                                Get.offAll(() => const HomePage());
                                SnackBarUtil.showSnackBar(
                                    message: 'Interests Updated');
                              } else {}
                            });
                          });
                  }
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
