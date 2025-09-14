import 'package:flutter/material.dart';
import 'package:portfolio/widgets/project_card.dart';
import '../constants/colors.dart';
import '../utils/projects_utils.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;
    final horizontalPadding = isMobile ? 16.0 : 80.0;
    final verticalPadding = isMobile ? 32.0 : 80.0;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(
        horizontalPadding, verticalPadding, horizontalPadding, verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Header
          Text(
            "Featured Projects",
            style: TextStyle(
              fontSize: isMobile ? 24 : 36,
              fontWeight: FontWeight.bold,
              color: CustomColor.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Here are some of the projects I have worked on",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 15 : 18,
              color: CustomColor.textMuted,
              height: 1.5,
            ),
          ),
          SizedBox(height: isMobile ? 32 : 60),

          // Projects Grid
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: isMobile
                ? Column(
                    children: [
                      for (int i = 0; i < workProjectUtils.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: 1.0,
                            child: ProjectCard(project: workProjectUtils[i]),
                          ),
                        ),
                    ],
                  )
                : Wrap(
                    spacing: 32,
                    runSpacing: 32,
                    alignment: WrapAlignment.center,
                    children: [
                      for (int i = 0; i < workProjectUtils.length; i++)
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: 1.0,
                          child: ProjectCard(project: workProjectUtils[i]),
                        ),
                    ],
                  ),
          ),

          SizedBox(height: isMobile ? 24 : 40),

          // Call to Action
          Container(
            padding: EdgeInsets.all(isMobile ? 16 : 24),
            decoration: BoxDecoration(
              color: CustomColor.bgLight1,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: CustomColor.bgLight2.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Interested in working together?",
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 20,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Let's discuss your project and see how I can help bring your ideas to life.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 16,
                    color: CustomColor.textMuted,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.primary,
                      foregroundColor: CustomColor.textPrimary,
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 0 : 32,
                        vertical: isMobile ? 12 : 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Get in Touch",
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
