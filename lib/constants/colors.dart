import 'dart:ui';
import 'package:flutter/foundation.dart';

class PortfolioPalette {
  const PortfolioPalette({
    required this.name,
    required this.primary,
    required this.secondary,
  });

  final String name;
  final Color primary;
  final Color secondary;
}

const portfolioPalettes = [
  PortfolioPalette(
    name: 'Ocean',
    primary: Color(0xFF2563EB),
    secondary: Color(0xFF10B981),
  ),
  PortfolioPalette(
    name: 'Emerald',
    primary: Color(0xFF059669),
    secondary: Color(0xFF34D399),
  ),
  PortfolioPalette(
    name: 'Violet',
    primary: Color(0xFF7C3AED),
    secondary: Color(0xFFC084FC),
  ),
  PortfolioPalette(
    name: 'Amber',
    primary: Color(0xFFD97706),
    secondary: Color(0xFFFBBF24),
  ),
  PortfolioPalette(
    name: 'Rose',
    primary: Color(0xFFE11D48),
    secondary: Color(0xFFFB7185),
  ),
];

final portfolioPalette =
    ValueNotifier<PortfolioPalette>(portfolioPalettes.first);

class CustomColor {
  // Accent colors are supplied by the active palette.
  static Color get primary => portfolioPalette.value.primary;
  static const Color primaryDark = Color(0xFF1D4ED8); // Blue 700
  static const Color primaryLight = Color(0xFF60A5FA); // Blue 400

  static Color get secondary => portfolioPalette.value.secondary;
  static const Color secondaryLight = Color(0xFF34D399); // Emerald 400
  static const Color secondaryDark = Color(0xFF059669); // Emerald 600

  // Background Colors
  static const Color scaffoldBg = Color(0xFF0A0A0F);
  static const Color bgLight1 = Color(0xFF14141D);
  static const Color bgLight2 = Color(0xFF1C1C2A);
  static const Color bgLight3 = Color(0xFF242433);
  static const Color bgCard = Color(0xFF181825);
  static const Color bgElevated = Color(0xFF202030);

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0C8);
  static const Color textMuted = Color(0xFF7A7A9E);
  static const Color textLight = Color(0xFFA0A0B8);

  // Accent Colors
  static const Color accent = Color(0xFFFFB347);
  static const Color accentLight = Color(0xFFFFC975);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFFFB347);
  static const Color error = Color(0xFFFF6B6B);
  static const Color info = Color(0xFF3B82F6);

  static Color get gradientStart => portfolioPalette.value.primary;
  static const Color gradientMid = Color(0xFF3B82F6); // Blue 500
  static Color get gradientEnd => portfolioPalette.value.secondary;

  // Glass Effect Colors
  static const Color glassBg = Color(0x1AFFFFFF);
  static const Color glassBorder = Color(0x33FFFFFF);

  // Shadows
  static const Color shadowLight = Color(0x0D000000);
  static const Color shadowMedium = Color(0x1A000000);
  static const Color shadowDark = Color(0x33000000);

  // Legacy getters
  static Color get whiteSecondary => textSecondary;
  static Color get whitePrimary => textPrimary;
  static Color get hintDark => textMuted;
  static Color get yellowSecondary => accent;
  static Color get yellowPrimary => accent;
  static Color get textFieldBg => bgLight1;
}
