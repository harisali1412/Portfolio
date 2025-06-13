import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      width: double.maxFinite,
      color: CustomColor.bgLight1,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Made with ❤️ by Haris Ali Safder",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 14,
              color: CustomColor.whiteSecondary,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "© 2025 Haris Ali Safder. All rights reserved.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: CustomColor.whiteSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
