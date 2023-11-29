import 'package:adventure_nepal/app/theme/app_images.dart';
import 'package:flutter/material.dart';

class FullPageInfoWidget extends StatelessWidget {
  const FullPageInfoWidget(
      {super.key, this.message = "Something went wrong", this.onRefresh});

  final String? message;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.80,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 120, child: Image.asset(AppImages.info)),
                  const SizedBox(height: 16),
                  Text("$message"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> refresh() async {
    onRefresh?.call();
  }
}
