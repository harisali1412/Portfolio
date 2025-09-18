import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/skills_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header
        const Text(
          "Skills & Technologies",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: CustomColor.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Technologies I work with",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: CustomColor.textMuted,
          ),
        ),
        const SizedBox(height: 60),
        
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 700) {
              // Mobile or narrow web: horizontal scroll
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Platforms Section
                    SizedBox(
                      width: 320,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Platforms",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: CustomColor.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: [
                              for (int i = 0; i < platformItems.length; i++)
                                Container(
                                  width: 280,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: CustomColor.bgLight1,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: CustomColor.bgLight2.withOpacity(0.3),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: CustomColor.bgLight2,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Image.asset(
                                          platformItems[i]["img"],
                                          width: 32,
                                          height: 32,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    // Skills Section
                    SizedBox(
                      width: 320,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Technologies",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: CustomColor.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              for (int i = 0; i < skillsItems.length; i++)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: CustomColor.bgLight1,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: CustomColor.bgLight2.withOpacity(0.3),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        skillsItems[i]["img"],
                                        width: 20,
                                        height: 20,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // Desktop/tablet: original layout
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Platforms Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Platforms",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: CustomColor.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            for (int i = 0; i < platformItems.length; i++)
                              Container(
                                width: 280,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: CustomColor.bgLight1,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: CustomColor.bgLight2.withOpacity(0.3),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(38),  // 0.15 * 255 ≈ 38
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                    BoxShadow(
                                      color: CustomColor.primary.withOpacity(13),  // 0.05 * 255 ≈ 13
                                      blurRadius: 16,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: CustomColor.bgLight2,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.asset(
                                        platformItems[i]["img"],
                                        width: 32,
                                        height: 32,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 60),
                  // Skills Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Technologies",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: CustomColor.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            for (int i = 0; i < skillsItems.length; i++)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: CustomColor.bgLight1,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: CustomColor.bgLight2.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      skillsItems[i]["img"],
                                      width: 20,
                                      height: 20,
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
