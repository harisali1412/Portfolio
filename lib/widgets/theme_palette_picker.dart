import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class ThemePalettePicker extends StatelessWidget {
  const ThemePalettePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PortfolioPalette>(
      tooltip: 'Choose accent colour',
      onSelected: (palette) => portfolioPalette.value = palette,
      icon: const Icon(Icons.palette_outlined),
      itemBuilder: (context) => [
        for (final palette in portfolioPalettes)
          PopupMenuItem(
            value: palette,
            child: Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: palette.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(palette.name)),
                if (palette == portfolioPalette.value)
                  Icon(
                    Icons.check_rounded,
                    size: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
