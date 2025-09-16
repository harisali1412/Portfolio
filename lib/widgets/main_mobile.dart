import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key, this.onContactTap, this.onProjectsTap});

  final VoidCallback? onContactTap;
  final VoidCallback? onProjectsTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      constraints: const BoxConstraints(minHeight: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/images/avatar.png',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 40),
          
          // Greeting
          const Text(
            "Hello, I'm",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: CustomColor.accent,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          
          // Name
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: CustomColor.textPrimary,
                height: 1.1,
                letterSpacing: -0.5,
              ),
              children: [
                TextSpan(text: "Haris Ali\n"),
                TextSpan(
                  text: "Safder",
                  style: TextStyle(color: CustomColor.primary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          
          // Title
          const Text(
            "Flutter Developer, DevOps & Machine Learning Engineer",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: CustomColor.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          
          // Description
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
          
          // CTA Buttons
                     SizedBox(
             width: double.infinity,
             child: ElevatedButton(
               onPressed: onContactTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.primary,
                foregroundColor: CustomColor.textPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
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
          const SizedBox(height: 12),
                     SizedBox(
             width: double.infinity,
             child: OutlinedButton(
               onPressed: onProjectsTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: CustomColor.primary,
                side: const BorderSide(color: CustomColor.primary),
                padding: const EdgeInsets.symmetric(vertical: 16),
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
    );
  }
}
