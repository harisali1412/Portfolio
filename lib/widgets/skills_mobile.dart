import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/skills_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Platforms Section
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Center(
              child: Text(
                "Platforms",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
          ),
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CustomColor.bgLight2,
              ),
              child: ListTile(
                leading: Image.asset(
                  platformItems[i]["img"],
                  width: 30,
                ),
                title: Text(
                  platformItems[i]["title"],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          const SizedBox(height: 40),

          // Skills Section
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Center(
              child: Text(
                "Skills",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillsItems.length; i++)
                Chip(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  backgroundColor: CustomColor.bgLight2,
                  label: Text(
                    skillsItems[i]["title"],
                    style: const TextStyle(fontSize: 14),
                  ),
                  avatar: Image.asset(skillsItems[i]["img"], width: 24),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
