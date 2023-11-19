import 'package:adventure_nepal/app/modules/login/views/login_view.dart';
import 'package:adventure_nepal/app/utils/storage_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimens.dart';
import '../../../utils/string_util.dart';
import '../../../widgets/app_text.dart';
import '../../select_interests/views/select_interests_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: "",
              fontWeight: FontWeight.bold,
              fontSize: AppDimens.veryLargeTextSize,
              color: AppColors.textColor.withOpacity(0.7),
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CircleAvatar(
            radius: 32,
            backgroundColor: AppColors.grey,
            child: Text(
              StringUtil.getInitials(StorageUtil.getUser()?.fullName ?? ""),
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(StorageUtil.getUser()?.fullName ?? "N/A",
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 4,
          ),
          Text(StorageUtil.getUser()?.email ?? "N/A",
              style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              title: const Text(
                "Interests",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              leading: const Icon(Icons.category, color: Colors.black87),
              onTap: () {
                Get.to(() => const SelectInterestsView(
                      isFromProfile: true,
                    ));
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              title: const Text(
                "About Us",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              leading: const Icon(Icons.person, color: Colors.black87),
              onTap: () {
                _launchURL("https://www.google.com");
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              title: const Text(
                "Contact Us",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black87),
              ),
              leading: const Icon(Icons.contact_support, color: Colors.black87),
              onTap: () {
                _launchEmail();
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              title: const Text(
                "Logout",
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
              ),
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              onTap: () {
                StorageUtil.clear();
                Get.offAll(() => const LoginView());
              },
            ),
          ),
        ],
      )),
    );
  }

  _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@example.com',
      queryParameters: {'subject': 'Feedback'},
    );

    final Uri emailAddress = Uri.parse(emailLaunchUri.toString());

    if (await canLaunchUrl(emailAddress)) {
      await launchUrl(emailAddress);
    } else {
      throw 'Could not launch $emailAddress';
    }
  }
}
