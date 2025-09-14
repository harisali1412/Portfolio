import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/sns_links.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  final Map<String, String> snsLinks = {
    "github": SnsLinks.github,
    "linkedin": SnsLinks.linkedin,
    "facebook": SnsLinks.facebook,
    "instagram": SnsLinks.instagram,
    "whatsapp": SnsLinks.whatsapp,
    "x": SnsLinks.x,
  };

  Future<void> _submitForm() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields.")),
      );
      return;
    }

    try {
      final url = Uri.parse('https://formspree.io/f/xvgragrp'); // 🔁 Replace with your actual Formspree URL
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

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Message sent successfully.")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to send message.")),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(80, 80, 80, 80),
      decoration: const BoxDecoration(
        color: CustomColor.bgLight1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          // Section Header
          const Text(
            "Get In Touch",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: CustomColor.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Let's discuss your project and see how I can help",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: CustomColor.textMuted,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 60),

          // Contact Form and Social Links
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Contact Form
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight2,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: CustomColor.bgLight3.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Send a Message",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: CustomColor.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildTextField(
                          controller: _nameController,
                          label: "Name",
                          icon: Icons.person,
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _emailController,
                          label: "Email",
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          controller: _messageController,
                          label: "Message",
                          icon: Icons.message,
                          maxLines: 4,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: 24),
                        _buildSubmitButton(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 40),

                // Social Links
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Connect With Me",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: CustomColor.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Feel free to reach out through any of these platforms",
                        style: TextStyle(
                          fontSize: 16,
                          color: CustomColor.textMuted,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: snsLinks.entries.map((entry) {
                          return Container(
                            decoration: BoxDecoration(
                              color: CustomColor.bgLight2,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: CustomColor.bgLight3.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: IconButton(
                              icon: _getIcon(entry.key),
                              iconSize: 24,
                              onPressed: () async {
                                final url = Uri.parse(entry.value);
                                if (!await canLaunchUrl(url)) return;
                                await launchUrl(url, mode: LaunchMode.externalApplication);
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
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
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(color: CustomColor.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: CustomColor.textMuted),
        prefixIcon: Icon(icon, color: CustomColor.textMuted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CustomColor.bgLight3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: CustomColor.bgLight3.withValues(alpha: 0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CustomColor.primary),
        ),
        filled: true,
        fillColor: CustomColor.bgLight1,
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColor.primary,
          foregroundColor: CustomColor.textPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        ),
        onPressed: _submitForm,
        child: const Text(
          "Send Message",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _getIcon(String key) {
    switch (key) {
      case "github":
        return Image.asset(SnsLinks.githubImage, width: 24, height: 24);
      case "linkedin":
        return Image.asset(SnsLinks.linkedinImage, width: 24, height: 24);
      case "facebook":
        return Image.asset(SnsLinks.facebookImage, width: 24, height: 24);
      case "instagram":
        return Image.asset(SnsLinks.instagramImage, width: 24, height: 24);
      case "whatsapp":
        return Image.asset(SnsLinks.whatsappImage, width: 24, height: 24);
      case "x":
        return Image.asset(SnsLinks.xImage, width: 24, height: 24);
      default:
        return const Icon(Icons.link, size: 24, color: CustomColor.textPrimary);
    }
  }
}
