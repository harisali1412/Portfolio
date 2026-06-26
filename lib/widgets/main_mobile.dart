import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/design_system.dart';
import 'package:portfolio/widgets/gradient_button.dart';
import 'package:portfolio/pages/home_page.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [CustomColor.primary, CustomColor.gradientEnd],
              ),
              boxShadow: DesignSystem.glowShadow,
            ),
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColor.scaffoldBg,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/profile/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [CustomColor.primary, CustomColor.gradientEnd],
              ),
              borderRadius: BorderRadius.circular(DesignSystem.radiusFull),
            ),
            child: const Text(
              "Available for Work",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Hello, I'm",
            style: TextStyle(
              fontSize: DesignSystem.fontSizeLG,
              color: CustomColor.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [CustomColor.primary, CustomColor.gradientEnd],
            ).createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: const Text(
              "Haris Ali Safder",
              style: TextStyle(
                fontSize: DesignSystem.fontSizeXXL,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: -0.5,
                height: 1.1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Mobile Application Developer • Flutter & AI Specialist",
            style: TextStyle(
              fontSize: DesignSystem.fontSizeMD,
              color: CustomColor.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          const Text(
            "Building impactful mobile applications for healthcare, fintech, "
            "and AI-powered solutions.",
            style: TextStyle(
              fontSize: DesignSystem.fontSizeMD,
              color: CustomColor.textMuted,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: GradientButton(
              onPressed: () {
                final homeState = context.findAncestorStateOfType<HomePageState>();
                if (homeState != null) {
                  homeState.scrollToSection(4);
                }
              },
              text: "Get in touch",
              icon: const Icon(Icons.send_rounded, size: 20),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: OutlinedButton(
              onPressed: () {
                final homeState = context.findAncestorStateOfType<HomePageState>();
                if (homeState != null) {
                  homeState.scrollToSection(3);
                }
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                ),
              ),
              child: const Text(
                "View Projects",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}