import 'package:flutter/material.dart';

class SkillIcon extends StatelessWidget {
  const SkillIcon({
    super.key,
    required this.name,
    required this.size,
    this.assetPath,
  });

  final String name;
  final double size;
  final String? assetPath;

  @override
  Widget build(BuildContext context) {
    Widget fallback() {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          name.substring(0, 1).toUpperCase(),
          style: TextStyle(
            fontSize: size * 0.5,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }

    final path = assetPath;
    if (path == null) return fallback();
    return Image.asset(
      path,
      width: size,
      height: size,
      errorBuilder: (context, error, stackTrace) => fallback(),
    );
  }
}
