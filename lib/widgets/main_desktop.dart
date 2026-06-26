import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/design_system.dart';
import 'package:portfolio/widgets/gradient_button.dart';
import 'package:portfolio/pages/home_page.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 1024;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isSmall ? 40 : 80,
        vertical: 40,
      ),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 300,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [CustomColor.primary, CustomColor.gradientEnd],
                    ),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusFull),
                  ),
                  child: const Text(
                    "Available for Work",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Hello, I'm",
                  style: TextStyle(
                    fontSize: DesignSystem.fontSizeLG,
                    color: CustomColor.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [CustomColor.primary, CustomColor.gradientEnd],
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: const Text(
                    "Haris Ali Safder",
                    style: TextStyle(
                      fontSize: DesignSystem.fontSizeHero,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -1.5,
                      height: 1.1,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusFull),
                  ),
                  child: const Text(
                    "Mobile Application Developer • Flutter & AI Specialist",
                    style: TextStyle(
                      fontSize: DesignSystem.fontSizeMD,
                      color: CustomColor.textSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Building impactful mobile applications for healthcare, fintech, "
                  "and AI-powered solutions. Experienced in Flutter, Supabase, "
                  "Stripe, and machine learning integration.",
                  style: DesignSystem.bodyLarge,
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    SizedBox(
                      width: 200,
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
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 180,
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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
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
              ],
            ),
          ),
          const SizedBox(width: 60),
          // Profile Image
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: screenWidth * 0.32,
                height: screenWidth * 0.32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [CustomColor.primary, CustomColor.gradientEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
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
            ),
          ),
        ],
      ),
    );
  }
}