import 'package:flutter/material.dart';
import '../styles/style.dart';
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
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: kHeaderDecoration, // Keep color same as desktop
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SiteLogo(onTap: onLogoTap),
            ),
            const Spacer(),
            IconButton(
              onPressed: onMenuTap,
              icon: const Icon(Icons.menu, size: 28),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
