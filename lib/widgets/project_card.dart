import 'package:flutter/material.dart';
import 'package:portfolio/utils/projects_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectUtils project;

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if(!await launchUrl(uri, mode: LaunchMode.externalApplication)){
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 380,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: CustomColor.bgLight1,
        border: Border.all(
          color: CustomColor.bgLight2.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          GestureDetector(
            onTap: () {
              if(project.webLink != null) {
                _launchURL(project.webLink!);
              }
            },
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: CustomColor.bgLight2,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  project.image,
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Project Content
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.textPrimary,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Subtitle
                  Text(
                    project.subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: CustomColor.textMuted,
                      height: 1.3,
                    ),
                  ),
                  const Spacer(),
                  // Action Button
                  if(project.webLink != null)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => _launchURL(project.webLink!),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: CustomColor.primary,
                          side: const BorderSide(color: CustomColor.primary),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "View Project",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
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
