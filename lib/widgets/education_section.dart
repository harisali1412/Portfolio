import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/design_system.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getPadding(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : 60,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColor.scaffoldBg,
            CustomColor.bgLight1,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Education",
            style: TextStyle(
              fontSize: DesignSystem.fontSizeXXL,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "My academic background",
            textAlign: TextAlign.center,
            style: DesignSystem.bodyLarge,
          ),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ResponsiveHelper.getMaxWidth(context),
            ),
            child: Column(
              children: [
                _buildEducationCard(
                  context: context,
                  degree: "Bachelor's in Computer Science",
                  institution: "Bahria University",
                  period: "September 2020 - January 2025",
                  location: "Lahore, Pakistan",
                  icon: Icons.school_rounded,
                ),
                const SizedBox(height: 20),
                _buildEducationCard(
                  context: context,
                  degree: "High School Diploma",
                  institution: "Concordia College",
                  period: "2018 - 2020",
                  location: "Lahore, Pakistan",
                  icon: Icons.school_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard({
    required BuildContext context,
    required String degree,
    required String institution,
    required String period,
    required String location,
    required IconData icon,
  }) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
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
      child: isMobile
          ? _buildMobileLayout(degree, institution, period, location, icon)
          : _buildDesktopLayout(degree, institution, period, location, icon),
    );
  }

  Widget _buildMobileLayout(
    String degree,
    String institution,
    String period,
    String location,
    IconData icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [CustomColor.primary, CustomColor.gradientEnd],
                ),
                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    degree,
                    style: const TextStyle(
                      fontSize: DesignSystem.fontSizeMD,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    institution,
                    style: const TextStyle(
                      fontSize: DesignSystem.fontSizeSM,
                      color: CustomColor.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Period and Location in a wrap for mobile
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: CustomColor.textMuted,
                ),
                const SizedBox(width: 4),
                Text(
                  period,
                  style: const TextStyle(
                    fontSize: DesignSystem.fontSizeSM,
                    color: CustomColor.textMuted,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 14,
                  color: CustomColor.textMuted,
                ),
                const SizedBox(width: 4),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: DesignSystem.fontSizeSM,
                    color: CustomColor.textMuted,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(
    String degree,
    String institution,
    String period,
    String location,
    IconData icon,
  ) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [CustomColor.primary, CustomColor.gradientEnd],
            ),
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                degree,
                style: const TextStyle(
                  fontSize: DesignSystem.fontSizeLG,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                institution,
                style: const TextStyle(
                  fontSize: DesignSystem.fontSizeMD,
                  color: CustomColor.primary,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: CustomColor.textMuted,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    period,
                    style: const TextStyle(
                      fontSize: DesignSystem.fontSizeSM,
                      color: CustomColor.textMuted,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.location_on,
                    size: 14,
                    color: CustomColor.textMuted,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: DesignSystem.fontSizeSM,
                      color: CustomColor.textMuted,
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
}