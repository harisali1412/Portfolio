import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class DesignSystem {
  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingSM = 8.0;
  static const double spacingMD = 16.0;
  static const double spacingLG = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
  static const double spacingXXXL = 64.0;
  
  // Border Radius
  static const double radiusSM = 8.0;
  static const double radiusMD = 12.0;
  static const double radiusLG = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusFull = 50.0;
  
  // Font Sizes
  static const double fontSizeXS = 11.0;
  static const double fontSizeSM = 13.0;
  static const double fontSizeMD = 15.0;
  static const double fontSizeLG = 18.0;
  static const double fontSizeXL = 24.0;
  static const double fontSizeXXL = 32.0;
  static const double fontSizeXXXL = 48.0;
  static const double fontSizeHero = 56.0;
  
  // Text Styles
  static const TextStyle headingHero = TextStyle(
    fontSize: fontSizeHero,
    fontWeight: FontWeight.w800,
    color: CustomColor.textPrimary,
    letterSpacing: -1.5,
    height: 1.1,
  );
  
  static const TextStyle headingH1 = TextStyle(
    fontSize: fontSizeXXXL,
    fontWeight: FontWeight.w700,
    color: CustomColor.textPrimary,
    letterSpacing: -1.0,
    height: 1.2,
  );
  
  static const TextStyle headingH2 = TextStyle(
    fontSize: fontSizeXXL,
    fontWeight: FontWeight.w700,
    color: CustomColor.textPrimary,
    letterSpacing: -0.5,
    height: 1.3,
  );
  
  static const TextStyle headingH3 = TextStyle(
    fontSize: fontSizeXL,
    fontWeight: FontWeight.w600,
    color: CustomColor.textPrimary,
    height: 1.4,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: fontSizeLG,
    fontWeight: FontWeight.w400,
    color: CustomColor.textSecondary,
    height: 1.6,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: fontSizeMD,
    fontWeight: FontWeight.w400,
    color: CustomColor.textSecondary,
    height: 1.6,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: fontSizeSM,
    fontWeight: FontWeight.w400,
    color: CustomColor.textMuted,
    height: 1.5,
  );
  
  // Shadows
  static List<BoxShadow> get cardShadow => [
    const BoxShadow(
      color: CustomColor.shadowDark,
      blurRadius: 24,
      offset: Offset(0, 8),
    ),
    const BoxShadow(
      color: CustomColor.shadowMedium,
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];
  
  static List<BoxShadow> get glowShadow => [
    BoxShadow(
      color: CustomColor.primary.withValues(alpha: 0.3),
      blurRadius: 60,
      offset: const Offset(0, 0),
    ),
  ];
  
  // Animations
  static const Duration animationDuration = Duration(milliseconds: 500);
  static const Curve animationCurve = Curves.easeOutCubic;
}

class ResponsiveHelper {
  static bool isMobile(BuildContext context) => 
      MediaQuery.of(context).size.width < 768;
  
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1024;
  
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
  
  static double getPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 16.0;
    if (width < 900) return 32.0;
    if (width < 1200) return 48.0;
    return 80.0;
  }
  
  static double getMaxWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return double.infinity;
    if (width < 900) return 700;
    if (width < 1200) return 900;
    return 1200;
  }
  
  static double getGridColumns(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 1;
    if (width < 900) return 2;
    return 3;
  }
}