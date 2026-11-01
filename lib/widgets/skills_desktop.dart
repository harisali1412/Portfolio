import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/design_system.dart';
import 'package:portfolio/constants/skills_items.dart';
import 'package:portfolio/widgets/animated_card.dart';
import 'package:portfolio/widgets/section_header.dart';
import 'package:portfolio/widgets/skill_icon.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getPadding(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : 60,
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
            child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    final rows = <Widget>[];
    for (int i = 0; i < skillCategories.length; i += 2) {
      final left = skillCategories[i];
      final right =
          i + 1 < skillCategories.length ? skillCategories[i + 1] : null;
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: AnimatedCard(
                  delay: i * 100,
                  child: _buildSkillCategory(left),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: right != null
                    ? AnimatedCard(
                        delay: (i + 1) * 100,
                        child: _buildSkillCategory(right),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      );
      if (i + 2 < skillCategories.length) rows.add(const SizedBox(height: 24));
    }
    return Column(children: rows);
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        for (int i = 0; i < skillCategories.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: _buildSkillCategory(skillCategories[i]),
          ),
      ],
    );
  }

  Widget _buildSkillCategory(SkillCategory category) {
    return Container(
      padding: const EdgeInsets.all(24),
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
        mainAxisSize: MainAxisSize.min,
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
                  horizontal: 14,
                  vertical: 10,
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
                      size: 20,
                    ),
                    const SizedBox(width: 8),
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
                    if (skill.proficiency != null) ...[
                      const SizedBox(width: 8),
                      _buildProficiencyIndicator(skill.proficiency!),
                    ],
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProficiencyIndicator(int level) {
    return Row(
      children: List.generate(5, (index) {
        return Container(
          margin: const EdgeInsets.only(right: 2),
          width: 4,
          height: 8,
          decoration: BoxDecoration(
            color: index < level
                ? CustomColor.primary
                : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(2),
          ),
        );
      }),
    );
  }
}
