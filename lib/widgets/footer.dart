import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: CustomColor.bgLight1,
        border: Border(
          top: BorderSide(
            color: CustomColor.bgLight2.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Haris Ali Safder",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: CustomColor.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Flutter Developer & Machine Learning Engineer",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: CustomColor.textMuted,
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Made with ❤️ using Flutter",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: CustomColor.textSecondary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "© 2025 Haris Ali Safder. All rights reserved.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: CustomColor.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}