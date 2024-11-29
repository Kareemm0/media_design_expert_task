import 'package:flutter/material.dart';

import '../../../../core/constant/app_sized.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_app_text.dart';

class CustomRowOrderText extends StatelessWidget {
  const CustomRowOrderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomAppText(
          text: "Order #",
          color: AppColors.primary,
          weight: FontWeight.w600,
        ),
        width(4),
        const CustomAppText(
          text: "112 (allow edit)",
          weight: FontWeight.w600,
          color: AppColors.teal,
        )
      ],
    );
  }
}
