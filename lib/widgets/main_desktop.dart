import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key, this.onContactTap, this.onProjectsTap});

  final VoidCallback? onContactTap;
  final VoidCallback? onProjectsTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          // Mobile or narrow web: use vertical scroll
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColor.primary.withValues(alpha: 0.3),
                          blurRadius: 40,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Greeting and name
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.accent,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(text: "Hello, I'm\n"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.textPrimary,
                        height: 1.1,
                        letterSpacing: -1.0,
                      ),
                      children: [
                        TextSpan(text: "Haris Ali\n"),
                        TextSpan(
                          text: "Safder",
                          style: TextStyle(
                            color: CustomColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Flutter Developer & Machine Learning Engineer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.textSecondary,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Passionate about creating innovative mobile applications and intelligent systems. "
                    "Specialized in cross-platform development with Flutter and implementing cutting-edge ML solutions.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: CustomColor.textMuted,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onContactTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColor.primary,
                            foregroundColor: CustomColor.textPrimary,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Get in touch",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: onProjectsTap,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: CustomColor.primary,
                            side: const BorderSide(color: CustomColor.primary),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "View Projects",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          // Desktop/tablet: original layout
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 80),
            height: screenHeight / 1.1,
            constraints: const BoxConstraints(minHeight: 600),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Greeting and name
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: CustomColor.accent,
                            height: 1.2,
                          ),
                          children: [
                            TextSpan(text: "Hello, I'm\n"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Main title
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.textPrimary,
                            height: 1.1,
                            letterSpacing: -1.0,
                          ),
                          children: [
                            TextSpan(text: "Haris Ali\n"),
                            TextSpan(
                              text: "Safder",
                              style: TextStyle(
                                color: CustomColor.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Subtitle
                      const Text(
                        "Flutter Developer & Machine Learning Engineer",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: CustomColor.textSecondary,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Description
                      const Text(
                        "Passionate about creating innovative mobile applications and intelligent systems. "
                        "Specialized in cross-platform development with Flutter and implementing cutting-edge ML solutions.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: CustomColor.textMuted,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 40),
                      // CTA Buttons
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: onContactTap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColor.primary,
                              foregroundColor: CustomColor.textPrimary,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Get in touch",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton(
                            onPressed: onProjectsTap,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: CustomColor.primary,
                              side: const BorderSide(color: CustomColor.primary),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "View Projects",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 80),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        width: screenWidth / 3.5,
                        height: screenWidth / 3.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
