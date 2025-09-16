import 'dart:ui';

class CustomColor {
  // Primary Colors
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryDark = Color(0xFF4F46E5);
  static const Color secondary = Color(0xFF10B981); // Emerald
  
  // Background Colors
  static const Color scaffoldBg = Color(0xFF0F172A); // Slate 900
  static const Color bgLight1 = Color(0xFF1E293B); // Slate 800
  static const Color bgLight2 = Color(0xFF2A3B53); // Custom darker slate
  static const Color bgLight3 = Color(0xFF3A4B63); // Custom lighter slate
  
  // Text Colors
  static const Color textPrimary = Color(0xFFF8FAFC); // Slate 50
  static const Color textSecondary = Color(0xFFCBD5E1); // Slate 300
  static const Color textMuted = Color(0xFF94A3B8); // Slate 400
  
  // Accent Colors
  static const Color accent = Color(0xFFF59E0B); // Amber 500
  static const Color accentLight = Color(0xFFFCD34D); // Amber 300
  
  // Status Colors
  static const Color success = Color(0xFF10B981); // Emerald 500
  static const Color warning = Color(0xFFF59E0B); // Amber 500
  static const Color error = Color(0xFFEF4444); // Red 500
  
  // Gradient Colors
  static const Color gradientStart = Color(0xFF6366F1);
  static const Color gradientEnd = Color(0xFF8B5CF6);
  
  // Legacy colors for backward compatibility
  static const Color yellowSecondary = accent;
  static const Color yellowPrimary = accent;
  static const Color whiteSecondary = textSecondary;
  static const Color whitePrimary = textPrimary;
  static const Color textFieldBg = Color(0xFF1E293B);
  static const Color hintDark = textMuted;
}
