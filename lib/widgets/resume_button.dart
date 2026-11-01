import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeButton extends StatelessWidget {
  const ResumeButton({super.key});

  Future<void> _openResume(BuildContext context) async {
    final resumeUri = Uri.base.resolve('Resume.pdf');
    final opened = await launchUrl(
      resumeUri,
      webOnlyWindowName: '_blank',
    );
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to open the resume right now.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _openResume(context),
      icon: const Icon(Icons.description_outlined, size: 18),
      label: const Text('View resume'),
    );
  }
}
