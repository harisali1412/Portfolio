import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/design_system.dart';
import 'package:portfolio/constants/sns_links.dart';
import 'package:portfolio/widgets/section_header.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  final Map<String, String> snsLinks = {
    "github": SnsLinks.github,
    "linkedin": SnsLinks.linkedin,
    "facebook": SnsLinks.facebook,
    "instagram": SnsLinks.instagram,
    "whatsapp": SnsLinks.whatsapp,
    "x": SnsLinks.x,
  };

  final Map<String, String> snsImages = {
    "github": SnsLinks.githubImage,
    "linkedin": SnsLinks.linkedinImage,
    "facebook": SnsLinks.facebookImage,
    "instagram": SnsLinks.instagramImage,
    "whatsapp": SnsLinks.whatsappImage,
    "x": SnsLinks.xImage,
  };

  Future<void> _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      );
    } catch (e) {
      _showSnackbar("Could not open link: $e", CustomColor.error);
    }
  }

  Future<void> _submitForm() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      _showSnackbar("Please fill in all fields.", CustomColor.error);
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      _showSnackbar("Please enter a valid email address.", CustomColor.error);
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final url = Uri.parse('https://formspree.io/f/xvgragrp');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: '{"name":"$name","email":"$email","message":"$message"}',
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
        _showSnackbar("Message sent successfully! 🎉", CustomColor.success);
      } else {
        _showSnackbar("Failed to send message. Please try again.", CustomColor.error);
      }
    } catch (e) {
      if (!mounted) return;
      _showSnackbar("Error: $e", CustomColor.error);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getPadding(context);

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
            CustomColor.scaffoldBg,
            CustomColor.bgLight1,
          ],
        ),
      ),
      child: Column(
        children: [
          const SectionHeader(
            title: "Get In Touch",
            subtitle: "Let's discuss your project and see how I can help",
            alignment: CrossAxisAlignment.center,
          ),
          const SizedBox(height: 32),
          _buildContactInfo(isMobile),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: isMobile
                ? _buildMobileLayout()
                : _buildDesktopLayout(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(bool isMobile) {
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        _buildInfoChip(Icons.email_rounded, "harisalisafder@gmail.com", true),
        _buildInfoChip(Icons.phone_rounded, "+92 303 0258495", false),
        _buildInfoChip(Icons.location_on_rounded, "Lahore, Pakistan", false),
      ],
    );
  }

  Widget _buildInfoChip(IconData icon, String label, bool isEmail) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            CustomColor.bgCard,
            CustomColor.bgLight1,
          ],
        ),
        borderRadius: BorderRadius.circular(DesignSystem.radiusFull),
        border: Border.all(
          color: Colors.white.withOpacity(0.06),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: CustomColor.primary),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: DesignSystem.fontSizeSM,
              color: CustomColor.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildContactForm()),
        const SizedBox(width: 40),
        Expanded(flex: 1, child: _buildSocialLinks()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildContactForm(),
        const SizedBox(height: 40),
        _buildSocialLinks(),
      ],
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
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
          const Text(
            "Send a Message",
            style: TextStyle(
              fontSize: DesignSystem.fontSizeXL,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          _buildTextField(
            controller: _nameController,
            label: "Name",
            icon: Icons.person_rounded,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            label: "Email",
            icon: Icons.email_rounded,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _messageController,
            label: "Message",
            icon: Icons.message_rounded,
            maxLines: 4,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: _isSubmitting ? null : _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
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
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Send Message",
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: CustomColor.textMuted),
        prefixIcon: Icon(icon, color: CustomColor.textMuted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          borderSide: const BorderSide(color: CustomColor.primary),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
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
          const Text(
            "Connect With Me",
            style: TextStyle(
              fontSize: DesignSystem.fontSizeXL,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Feel free to reach out through any of these platforms",
            style: TextStyle(
              fontSize: DesignSystem.fontSizeMD,
              color: CustomColor.textMuted,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: snsLinks.entries.map((entry) {
              return _buildSocialButton(entry.key, entry.value);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(String key, String url) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            CustomColor.bgCard,
            CustomColor.bgLight1,
          ],
        ),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(
          color: Colors.white.withOpacity(0.06),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Image.asset(
          snsImages[key] ?? '',
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.link_rounded,
              color: Colors.white,
              size: 24,
            );
          },
        ),
        onPressed: () => _launchURL(url),
        tooltip: 'Open $key',
      ),
    );
  }
}