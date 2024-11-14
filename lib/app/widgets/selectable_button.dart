import 'package:adventure_nepal/app/theme/app_styles.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SelectableButton extends StatefulWidget {
  final String text;
  final ValueChanged<bool> onTap;
  final bool isSelected;

  const SelectableButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.isSelected = false});

  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void _toggleSelected() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onTap(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: _toggleSelected,
        style: ElevatedButton.styleFrom(
          backgroundColor: _isSelected ? AppColors.primary : AppColors.backgroundColorGrey,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.grey, width: 1),
              borderRadius: BorderRadius.circular(4)),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            overflow: TextOverflow.clip,
            widget.text,
            style: AppStyles.subtitleStyle.copyWith(
                fontWeight: FontWeight.w800,
                color: _isSelected ? AppColors.white : AppColors.grey),
          ),
        ),
      ),
    );
  }
}
