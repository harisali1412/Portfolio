import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/experience_items.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key, required this.experience});

  final ExperienceItem experience;

  Widget _buildCompanyImage(String company) {
    String logoPath = '';
    if (company.contains('Glixen')) {
      logoPath = 'assets/companies/glixentechnologies.png';
    } else if (company.contains('Shaukat')) {
      logoPath = 'assets/companies/shaukatkhanum.png';
    } else if (company.contains('TxLabz')) {
      logoPath = 'assets/companies/txlabz.png';
    }

    if (logoPath.isNotEmpty) {
      return Image.asset(
        logoPath,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildInitialFallback(company),
      );
    }
    return _buildInitialFallback(company);
  }

  Widget _buildInitialFallback(String company) {
    return Container(
      width: 50,
      height: 50,
      color: CustomColor.primary.withOpacity(0.1),
      child: Center(
        child: Text(
          company.substring(0, 1),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: CustomColor.primary,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: CustomColor.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: CustomColor.bgLight2.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Logo
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: CustomColor.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: CustomColor.primary.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _buildCompanyImage(experience.company),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience.role,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      experience.company,
                      style: const TextStyle(
                        fontSize: 16,
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
                          experience.period,
                          style: const TextStyle(
                            fontSize: 13,
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
                          experience.location,
                          style: const TextStyle(
                            fontSize: 13,
                            color: CustomColor.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(
            color: CustomColor.bgLight2,
            height: 1,
          ),
          const SizedBox(height: 16),
          ...experience.achievements.map(
            (achievement) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: CustomColor.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      achievement,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: CustomColor.textSecondary,
                      ),
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
}