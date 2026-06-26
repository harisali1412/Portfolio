class ExperienceItem {
  final String company;
  final String role;
  final String period;
  final String location;
  final List<String> achievements;
  final String? logo;

  ExperienceItem({
    required this.company,
    required this.role,
    required this.period,
    required this.location,
    required this.achievements,
    this.logo,
  });
}

final List<ExperienceItem> experiences = [
  ExperienceItem(
    company: "Glixen Technologies",
    role: "Mobile Application Developer",
    period: "June 2026 - Present",
    location: "Lahore, Pakistan",
    achievements: const [
      "Developing cross-platform Flutter applications for healthcare and technology domains",
      "Building scalable mobile solutions with clean architecture patterns",
      "Collaborating with cross-functional teams to deliver high-quality products",
    ],
  ),
  ExperienceItem(
    company: "Shaukat Khanum Memorial Cancer Hospital & Research Centre",
    role: "Mobile Application Developer",
    period: "April 2026 - May 2026",
    location: "Lahore, Pakistan",
    achievements: [
      "Built MediTrack healthcare platform for doctors and patients with role-based dashboards",
      "Integrated Supabase for authentication and real-time health record management",
      "Implemented Stripe payment gateway for global card payments",
      "Developed REST APIs using Flask and integrated with Flutter via Dio",
      "Implementing state management using GetX and MVC architecture",
      "Performed comprehensive testing of widgets, validation forms, and APIs using Postman",
    ],
  ),
  ExperienceItem(
    company: "TxLabz",
    role: "DevOps Engineer (Internship)",
    period: "July 2025 - September 2025",
    location: "Lahore, Pakistan",
    achievements: [
      "Gained hands-on experience with AWS Cloud Provider and CI/CD pipelines",
      "Managed staging and production deployments with automated workflows",
      "Configured and monitored services using command-line tools",
      "Built code-metrics prototype with database storage and visualization",
      "Implemented Slack webhook integration for automated notifications",
      "Visualized metrics using Grafana dashboards",
    ],
  ),
  ExperienceItem(
    company: "TxLabz",
    role: "Mobile Application Developer (Internship)",
    period: "August 2023 - September 2023",
    location: "Lahore, Pakistan",
    achievements: [
      "Completed 6-week intensive internship in Flutter mobile app development",
      "Built Basic Calculator and BMI Calculator applications",
      "Designed HBL-like banking application with Firebase integration",
      "Implemented user authentication and data management using Firebase",
    ],
  ),
];