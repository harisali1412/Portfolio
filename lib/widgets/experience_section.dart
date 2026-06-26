import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/design_system.dart';
import 'package:portfolio/constants/experience_items.dart';
import 'package:portfolio/widgets/animated_card.dart';
import 'package:portfolio/widgets/section_header.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveHelper.getPadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        children: [
          const SectionHeader(
            title: "Professional Experience",
            subtitle: "My journey in software development",
            alignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: ResponsiveHelper.getMaxWidth(context)),
            child: Column(
              children: [
                for (int i = 0; i < experiences.length; i++)
                  AnimatedCard(
                    delay: i * 150,
                    child: _buildExperienceCard(experiences[i], isMobile),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(ExperienceItem exp, bool isMobile) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCompanyLogo(exp.company),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp.role,
                      style: DesignSystem.headingH3,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      exp.company,
                      style: const TextStyle(
                        color: CustomColor.primary,
                        fontSize: DesignSystem.fontSizeMD,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        _buildInfoChip(Icons.calendar_today, exp.period),
                        _buildInfoChip(Icons.location_on, exp.location),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(
            color: Colors.white10,
            height: 1,
          ),
          const SizedBox(height: 16),
          ...exp.achievements.map(
            (achievement) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [CustomColor.primary, CustomColor.gradientEnd],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColor.primary.withOpacity(0.3),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      achievement,
                      style: DesignSystem.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyLogo(String company) {
    String logoPath = '';

    if (company.contains('Glixen')) {
      logoPath = 'assets/companies/glixentechnologies.png';
    } else if (company.contains('Shaukat')) {
      logoPath = 'assets/companies/shaukatkhanum.png';
    } else if (company.contains('TxLabz')) {
      logoPath = 'assets/companies/txlabz.png';
    }

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(
          color: Colors.white.withOpacity(0.06),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        child: logoPath.isNotEmpty
            ? Image.asset(
                logoPath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildInitialLogo(company),
              )
            : _buildInitialLogo(company),
      ),
    );
  }

  Widget _buildInitialLogo(String company) {
    return Center(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [CustomColor.primary, CustomColor.gradientEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        ),
        child: Center(
          child: Text(
            company.substring(0, 1).toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: CustomColor.textMuted),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: DesignSystem.fontSizeSM,
              color: CustomColor.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}