import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/size.dart';
import 'package:portfolio/constants/sns_links.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:portfolio/widgets/drawer_mobile.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/projects_section.dart';
import 'package:portfolio/widgets/skills_desktop.dart';
import 'package:portfolio/widgets/skills_mobile.dart';
import '../widgets/header_desktop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());
  bool showBackToTop = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        showBackToTop =
            scrollController.offset > 300; // Show button after 300px scroll
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          floatingActionButton: showBackToTop
              ? FloatingActionButton(
                  onPressed: () {
                    scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  backgroundColor: CustomColor.primary,
                  foregroundColor: CustomColor.textPrimary,
                  child: const Icon(Icons.arrow_upward),
                )
              : null,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                children: [
                  SizedBox(key: navbarKeys.first),
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    HeaderDesktop(onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    })
                  else
                    HeaderMobile(
                      onLogoTap: () {},
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
                  if (constraints.maxWidth >= kMinDesktopWidth)
                    MainDesktop(
                      onContactTap: () => scrollToSection(3),
                      onProjectsTap: () => scrollToSection(2),
                    )
                  else
                    MainMobile(
                      onContactTap: () => scrollToSection(3),
                      onProjectsTap: () => scrollToSection(2),
                    ),
                  Container(
                    key: navbarKeys[1],
                    width: screenWidth,
                    padding: const EdgeInsets.fromLTRB(80, 80, 80, 80),
                    decoration: const BoxDecoration(
                      color: CustomColor.bgLight1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (constraints.maxWidth >= kMinDesktopWidth)
                          const SkillsDesktop()
                        else
                          const SkillsMobile(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  ProjectsSection(key: navbarKeys[2]),
                  const SizedBox(height: 60),
                  ContactSection(key: navbarKeys[3]),
                  const Footer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) async {
    if (navIndex == 4) {
      final Uri blogUri = Uri.parse(SnsLinks.blog);
      if (await canLaunchUrl(blogUri)) {
        await launchUrl(blogUri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch ${SnsLinks.blog}';
      }
      return;
    }
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
