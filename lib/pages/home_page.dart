import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/design_system.dart';
import 'package:portfolio/widgets/contact_section.dart';
import 'package:portfolio/widgets/drawer_mobile.dart';
import 'package:portfolio/widgets/experience_section.dart';
import 'package:portfolio/widgets/footer.dart';
import 'package:portfolio/widgets/header_mobile.dart';
import 'package:portfolio/widgets/main_desktop.dart';
import 'package:portfolio/widgets/main_mobile.dart';
import 'package:portfolio/widgets/projects_section.dart';
import 'package:portfolio/widgets/skills_desktop.dart';
import 'package:portfolio/widgets/skills_mobile.dart';
import 'package:portfolio/widgets/education_section.dart';
import 'package:portfolio/widgets/blog_section.dart';
import '../widgets/header_desktop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

// Make the state class public so other widgets can access it
class HomePageState extends State<HomePage> {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late ScrollController scrollController;
  late List<GlobalKey> navbarKeys;
  bool showBackToTop = false;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    scrollController = ScrollController();
    navbarKeys = List.generate(7, (index) => GlobalKey());
    scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final shouldShowBackToTop = scrollController.offset > 300;
    if (showBackToTop != shouldShowBackToTop) {
      setState(() => showBackToTop = shouldShowBackToTop);
    }
  }

  void scrollToSection(int navIndex) async {
    final key = navbarKeys[navIndex];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: DesignSystem.animationDuration,
        curve: DesignSystem.animationCurve,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PortfolioPalette>(
      valueListenable: portfolioPalette,
      builder: (context, palette, _) {
        final isMobile = ResponsiveHelper.isMobile(context);

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          floatingActionButton: showBackToTop
              ? FloatingActionButton(
                  onPressed: () {
                    scrollController.animateTo(
                      0,
                      duration: DesignSystem.animationDuration,
                      curve: DesignSystem.animationCurve,
                    );
                  },
                  backgroundColor: palette.primary,
                  child: const Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.white,
                  ),
                )
              : null,
          endDrawer: !isMobile
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          body: SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  key: navbarKeys[0],
                  padding: EdgeInsets.only(top: isMobile ? 0 : 20),
                  child: Column(
                    children: [
                      if (!isMobile)
                        HeaderDesktop(
                          onNavMenuTap: (int navIndex) {
                            scrollToSection(navIndex);
                          },
                        )
                      else
                        HeaderMobile(
                          onLogoTap: () {
                            scrollToSection(0);
                          },
                          onMenuTap: () {
                            scaffoldKey.currentState?.openEndDrawer();
                          },
                        ),
                      if (!isMobile) MainDesktop() else MainMobile(),
                    ],
                  ),
                ),
                Container(
                  key: navbarKeys[1],
                  child: BlogSection(),
                ),
                Container(
                  key: navbarKeys[2],
                  child: ExperienceSection(),
                ),
                Container(
                  key: navbarKeys[3],
                  child: isMobile ? SkillsMobile() : SkillsDesktop(),
                ),
                Container(
                  key: navbarKeys[4],
                  child: ProjectsSection(),
                ),
                EducationSection(),
                Container(
                  key: navbarKeys[5],
                  child: ContactSection(),
                ),
                Footer(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
