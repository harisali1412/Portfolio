import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/design_system.dart';
import 'package:portfolio/constants/projects_items.dart';
import 'package:portfolio/widgets/animated_card.dart';
import 'package:portfolio/pages/home_page.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getPadding(context);
    final maxWidth = ResponsiveHelper.getMaxWidth(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : 60,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColor.bgLight1,
            CustomColor.scaffoldBg,
          ],
        ),
      ),
      child: Column(
        children: [
          const Text(
            "Featured Projects",
            style: TextStyle(
              fontSize: DesignSystem.fontSizeXXL,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Here are some of the projects I have worked on",
            textAlign: TextAlign.center,
            style: DesignSystem.bodyLarge,
          ),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: isMobile
                ? Column(
                    children: [
                      for (int i = 0; i < allProjects.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: AnimatedCard(
                            delay: i * 100,
                            child: _buildProjectCard(context, allProjects[i]),
                          ),
                        ),
                    ],
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      mainAxisExtent: 430,
                    ),
                    itemCount: allProjects.length,
                    itemBuilder: (context, index) {
                      return AnimatedCard(
                        delay: index * 100,
                        child: _buildProjectCard(context, allProjects[index]),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 48),
          _buildCTASection(isMobile, context),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, ProjectItem project) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Container(
      height: isMobile ? 380 : null,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
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
          // Project Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(DesignSystem.radiusLG),
              topRight: Radius.circular(DesignSystem.radiusLG),
            ),
            child: Stack(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  color: CustomColor.bgLight2,
                  child: Image.asset(
                    project.image,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 160,
                        width: double.infinity,
                        color: CustomColor.bgLight2,
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_not_supported,
                                color: CustomColor.textMuted,
                                size: 40,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Image not found',
                                style: TextStyle(
                                  color: CustomColor.textMuted,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        CustomColor.bgCard.withOpacity(0.6),
                      ],
                    ),
                  ),
                ),
                if (project.featured)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [CustomColor.primary, CustomColor.gradientEnd],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColor.primary.withOpacity(0.3),
                            blurRadius: 12,
                          ),
                        ],
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
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      project.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: CustomColor.textMuted,
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Technologies
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: project.technologies.take(3).map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: CustomColor.primary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          tech,
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: CustomColor.primary,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 8),
                  // Buttons
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (project.webLink != null)
                        OutlinedButton(
                          onPressed: () async {
                            await launchUrl(Uri.parse(project.webLink!),
                                mode: LaunchMode.externalApplication,
                                webOnlyWindowName: '_blank');
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: CustomColor.primary,
                            side: BorderSide(
                                color: CustomColor.primary.withOpacity(0.3)),
                            padding:
                                const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text(
                            "View Project",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: CustomColor.primary),
                          ),
                        ),
                      if (project.androidLink != null ||
                          project.iosLink != null) ...[
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            if (project.androidLink != null)
                              Expanded(
                                child: _buildComingSoonButton(
                                  context: context,
                                  label: 'Android',
                                  icon: Icons.android_rounded,
                                ),
                              ),
                            if (project.androidLink != null &&
                                project.iosLink != null)
                              const SizedBox(width: 6),
                            if (project.iosLink != null)
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
      icon: Icon(icon, size: 11, color: Colors.white),
      label: Text(label,
          style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColor.primary.withOpacity(0.6),
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildCTASection(bool isMobile, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColor.primary.withOpacity(0.1),
            CustomColor.gradientEnd.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(
          color: Colors.white.withOpacity(0.06),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          const Text(
            "Interested in working together?",
            style: TextStyle(
              fontSize: DesignSystem.fontSizeXL,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            "Let's discuss your project and see how I can help bring your ideas to life.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: DesignSystem.fontSizeMD,
              color: CustomColor.textMuted,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: isMobile ? double.infinity : 180,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                final homeState = context.findAncestorStateOfType<HomePageState>();
                if (homeState != null) {
                  homeState.scrollToSection(4);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                ),
              ).copyWith(
                overlayColor: WidgetStateProperty.all(
                  Colors.white.withOpacity(0.1),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [CustomColor.primary, CustomColor.gradientEnd],
                  ),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Get in Touch",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}