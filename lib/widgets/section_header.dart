import 'package:flutter/material.dart';
import 'package:portfolio/constants/design_system.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.start,
    this.titleSize,
  });

  final String title;
  final String? subtitle;
  final CrossAxisAlignment alignment;
  final double? titleSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleSize ?? DesignSystem.fontSizeXXL,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: -0.5,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: DesignSystem.spacingSM),
          Text(
            subtitle!,
            style: DesignSystem.bodyLarge,
            textAlign: alignment == CrossAxisAlignment.center
                ? TextAlign.center
                : TextAlign.start,
          ),
        ],
      ],
    );
  }
}