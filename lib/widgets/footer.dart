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
            color: CustomColor.bgLight2.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [CustomColor.primary, CustomColor.gradientEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(
                  Icons.code,
                  color: CustomColor.textPrimary,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Haris Ali Safder",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Flutter Developer & Machine Learning Engineer",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: CustomColor.textMuted,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Made with ❤️ using Flutter",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: CustomColor.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
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
