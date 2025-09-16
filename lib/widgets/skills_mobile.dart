import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/skills_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        const Text(
          "Skills & Technologies",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: CustomColor.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Technologies I work with",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: CustomColor.textMuted,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 48),

        // Platforms Section
        const Text(
          "Platforms",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: CustomColor.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        for (int i = 0; i < platformItems.length; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomColor.bgLight1,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: CustomColor.bgLight2.withValues(alpha: 0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 26),  // 0.1 * 255 ≈ 26
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight3,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    platformItems[i]["img"],
                    width: 28,
                    height: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    platformItems[i]["title"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 40),

        // Skills Section
        const Text(
          "Technologies",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: CustomColor.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.start,
          children: [
            for (int i = 0; i < skillsItems.length; i++)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: CustomColor.bgLight2,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: CustomColor.bgLight3.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        skillsItems[i]["img"],
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        skillsItems[i]["title"],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: CustomColor.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
