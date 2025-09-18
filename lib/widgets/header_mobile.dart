import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});

  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: CustomColor.bgLight1.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: CustomColor.bgLight2.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            SiteLogo(onTap: onLogoTap),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: CustomColor.bgLight2,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: onMenuTap,
                icon: const Icon(
                  Icons.menu,
                  size: 24,
                  color: CustomColor.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
