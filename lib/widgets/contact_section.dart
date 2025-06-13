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
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Contact Me",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _nameController,
              label: "Name",
              icon: Icons.person,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 10),
            _buildTextField(
               controller: _emailController,
              label: "Email",
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            _buildTextField(
              controller: _messageController,
              label: "Message",
              icon: Icons.message,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(height: 20),
            _buildSubmitButton(),
            const SizedBox(height: 20),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: snsLinks.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                        icon: _getIcon(entry.key),
                        iconSize: 32,
                        onPressed: () async {
                          final url = Uri.parse(entry.value);
                          if (!await canLaunchUrl(url)) return;
                          await launchUrl(url, mode: LaunchMode.externalApplication);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
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
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColor.yellowPrimary,
          foregroundColor: CustomColor.whitePrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
          shadowColor: Colors.blueAccent.withOpacity(0.4),
          elevation: 6,
        ),
        onPressed: _submitForm,
        child: const Text(
          "Submit",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _getIcon(String key) {
    switch (key) {
      case "github":
        return Image.asset(SnsLinks.githubImage, width: 32, height: 32);
      case "linkedin":
        return Image.asset(SnsLinks.linkedinImage, width: 32, height: 32);
      case "facebook":
        return Image.asset(SnsLinks.facebookImage, width: 32, height: 32);
      case "instagram":
        return Image.asset(SnsLinks.instagramImage, width: 32, height: 32);
      case "whatsapp":
        return Image.asset(SnsLinks.whatsappImage, width: 32, height: 32);
      case "x":
        return Image.asset(SnsLinks.xImage, width: 32, height: 32);
      default:
        return const Icon(Icons.link, size: 32);
    }
  }
}
