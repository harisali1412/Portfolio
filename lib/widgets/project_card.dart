import 'package:flutter/material.dart';
import 'package:portfolio/constants/projects_items.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectItem project;

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      clipBehavior: Clip.antiAlias,
      width: isMobile ? double.infinity : 320,
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
              if (project.webLink != null) {
                _launchURL(project.webLink!);
              }
            },
            child: Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(
                      project.image,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Featured Badge
                if (project.featured)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [CustomColor.primary, CustomColor.gradientEnd],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Featured",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          
          // Project Content
          Padding(
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                
                // Subtitle
                Text(
                  project.subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: CustomColor.textMuted,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                
                // Technologies
                if (project.technologies.isNotEmpty)
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: project.technologies.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: CustomColor.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          tech,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: CustomColor.primary,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                
                const SizedBox(height: 16),
                
                // Action Buttons
                _buildActionButtons(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final hasGithub = project.webLink != null;
    final hasAndroid = project.androidLink != null;
    final hasIos = project.iosLink != null;

    if (!hasGithub && !hasAndroid && !hasIos) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (hasGithub)
          OutlinedButton(
            onPressed: () => _launchURL(project.webLink!),
            style: OutlinedButton.styleFrom(
              foregroundColor: CustomColor.primary,
              side: const BorderSide(color: CustomColor.primary),
              padding: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text(
              "View Project",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        if (hasAndroid || hasIos) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              if (hasAndroid)
                Expanded(
                  child: _buildComingSoonButton(
                    context: context,
                    label: 'Android',
                    icon: Icons.android_rounded,
                  ),
                ),
              if (hasAndroid && hasIos) const SizedBox(width: 8),
              if (hasIos)
                Expanded(
                  child: _buildComingSoonButton(
                    context: context,
                    label: 'iOS',
                    icon: Icons.apple_rounded,
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildComingSoonButton({
    required BuildContext context,
    required String label,
    required IconData icon,
  }) {
    return ElevatedButton.icon(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label app coming soon! 🚀'),
            backgroundColor: CustomColor.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(16),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      icon: Icon(icon, size: 13, color: Colors.white),
      label: Text(label,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColor.primary.withOpacity(0.6),
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}