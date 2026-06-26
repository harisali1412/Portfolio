import 'package:flutter/material.dart';

class NavItem {
  final String title;
  final IconData icon;
  
  const NavItem({required this.title, required this.icon});
}

const List<NavItem> navItems = [
  NavItem(title: "Home", icon: Icons.home_rounded),
  NavItem(title: "Experience", icon: Icons.work_rounded),
  NavItem(title: "Skills", icon: Icons.psychology_rounded),
  NavItem(title: "Projects", icon: Icons.grid_view_rounded),
  NavItem(title: "Contact", icon: Icons.mail_rounded),
  NavItem(title: "Blog", icon: Icons.article_rounded),
];

// Legacy support
List<String> navTitles = navItems.map((e) => e.title).toList();
List<IconData> navIcons = navItems.map((e) => e.icon).toList();