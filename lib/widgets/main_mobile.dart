import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      constraints: const BoxConstraints(minHeight: 450),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100), // Rounded Image
              child: Image.asset(
                'assets/images/avatar.png',
                height: 180,
                width: 180,
                fit: BoxFit.cover, // Ensures full image display
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Hi,\nI'm Haris Ali Safder\nA Flutter Developer and Machine Learning Engineer",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1.5,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity, // Full-width button for mobile
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: CustomColor.yellowPrimary,
                foregroundColor: CustomColor.whitePrimary,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text("Get in touch", style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
