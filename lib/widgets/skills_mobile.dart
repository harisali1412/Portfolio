import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/design_system.dart';
import 'package:portfolio/constants/skills_items.dart';
import 'package:portfolio/widgets/animated_card.dart';
import 'package:portfolio/widgets/section_header.dart';
import 'package:portfolio/widgets/skill_icon.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveHelper.getPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: 40,
      ),
      child: Column(
        children: [
          const SectionHeader(
            title: "Skills & Technologies",
            subtitle: "Cross-platform apps, reliable backends and applied AI",
            alignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: ResponsiveHelper.getMaxWidth(context)),
            child: Column(
              children: [
                for (int i = 0; i < skillCategories.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: _buildSkillCategory(skillCategories[i]),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(SkillCategory category) {
    return AnimatedCard(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColor.bgCard,
              CustomColor.bgLight1,
            ],
          ),
          borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
          border: Border.all(
            color: Colors.white.withOpacity(0.06),
            width: 1,
          ),
          boxShadow: DesignSystem.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.name,
              style: DesignSystem.headingH3.copyWith(
                fontSize: DesignSystem.fontSizeLG,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: category.items.map((skill) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SkillIcon(
                        name: skill.name,
                        assetPath: skill.icon,
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          skill.name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: DesignSystem.fontSizeSM,
                            color: CustomColor.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
