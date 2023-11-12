import 'package:adventure_nepal/app/theme/app_colors.dart';
import 'package:adventure_nepal/app/theme/app_dimens.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      required this.text,
      this.textColor = AppColors.white,
      this.bgColor = AppColors.mainColor,
      this.fullWidth = false,
      required this.onTap})
      : super(key: key);
  final String text;
  final Color textColor;
  final Color bgColor;
  final bool fullWidth;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.cornerRadius)),
        ),
        onPressed: onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            alignment: fullWidth ? Alignment.center : null,
            height: 40,
            child: Row(
              mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                fullWidth
                    ? Expanded(
                        child: Text(
                          text,
                          softWrap: false,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: textColor,
                              overflow: TextOverflow.ellipsis),
                        ),
                      )
                    : Text(
                        text,
                        softWrap: false,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: textColor, overflow: TextOverflow.ellipsis),
                      ),
              ],
            )));
  }
}
