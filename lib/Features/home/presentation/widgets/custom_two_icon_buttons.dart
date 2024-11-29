import 'package:flutter/material.dart';

import '../../../../core/constant/app_sized.dart';
import '../../../../core/utils/app_colors.dart';

class CustomTwoIconButtons extends StatelessWidget {
  const CustomTwoIconButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close,
            color: AppColors.teal,
          ),
        ),
        width(100),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward,
            color: AppColors.teal,
          ),
        ),
      ],
    );
  }
}
