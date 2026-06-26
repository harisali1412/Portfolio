class SkillCategory {
  final String name;
  final List<SkillItem> items;

  SkillCategory({required this.name, required this.items});
}

class SkillItem {
  final String name;
  final String icon;
  final int? proficiency;

  SkillItem({required this.name, required this.icon, this.proficiency});
}

List<SkillCategory> skillCategories = [
  SkillCategory(
    name: "Mobile Development",
    items: [
      SkillItem(name: "Flutter", icon: "assets/images/flutter.png", proficiency: 5),
      SkillItem(name: "Dart", icon: "assets/images/dart.png", proficiency: 5),
      SkillItem(name: "Supabase", icon: "assets/images/supabase.png", proficiency: 4),
      SkillItem(name: "Firebase", icon: "assets/images/firebase.png", proficiency: 4),
    ],
  ),
  SkillCategory(
    name: "Backend & API",
    items: [
      SkillItem(name: "REST APIs", icon: "assets/images/restapi.png", proficiency: 5),
      SkillItem(name: "Python Flask", icon: "assets/images/python.png", proficiency: 4),
    ],
  ),
  SkillCategory(
    name: "DevOps & Cloud",
    items: [
      SkillItem(name: "AWS", icon: "assets/images/aws.png", proficiency: 3),
      SkillItem(name: "CI/CD", icon: "assets/images/jenkins.png", proficiency: 3),
    ],
  ),
  SkillCategory(
    name: "Tools & Technologies",
    items: [
      SkillItem(name: "Git/GitHub", icon: "assets/images/github.png", proficiency: 5),
      SkillItem(name: "Postman", icon: "assets/images/postman.png", proficiency: 4),
      SkillItem(name: "VS Code", icon: "assets/images/vscode.png", proficiency: 5),
      SkillItem(name: "Android Studio", icon: "assets/images/android.png", proficiency: 4),
    ],
  ),
];
