import 'package:flutter/material.dart';
import 'package:portfolio/widgets/project_card.dart';
import '../constants/colors.dart';
import '../utils/projects_utils.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Work Projects Title
          const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "Work Projects",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Here are some of the projects I have worked on.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: CustomColor.whiteSecondary,
            ),
          ),

          const SizedBox(height: 40),

          // Work Projects Card
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
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

          const SizedBox(height: 10),

          // Instruction Text
          const Text(
            "📌 Tap on a project image to open its GitHub or live link.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: CustomColor.whiteSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
