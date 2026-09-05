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
    role: "Flutter Developer",
    period: "June 2026 - Present",
    location: "Lahore, Pakistan",
    achievements: const [
      "Maintaining and enhancing AdForest mobile applications built with Flutter",
      "Diagnosing and resolving application issues including UI, authentication, and API integration",
      "Managing and troubleshooting the server, WordPress backend, and REST API connectivity",
      "Customizing the AdForest application per client requirements by implementing new features and modifying existing functionality",
      "Integrating and maintaining third-party services including Firebase Authentication, phone verification, Google and Facebook Sign-In, and payment features",
      "Testing application functionality, debugging API responses, and ensuring stable performance across Android devices",
    ],
  ),
  ExperienceItem(
    company: "Shaukat Khanum Memorial Cancer Hospital & Research Centre",
    role: "Mobile Application Developer",
    period: "December 2025 - May 2026",
    location: "Lahore, Pakistan",
    achievements: const [
      "Built MediTrack, a healthcare application for both doctors and patients",
      "Built a Chughtai Lab clone application using MVC architecture and GetX state management",
      "Implemented REST APIs in Python using Flask and integrated them into Flutter via the Dio HTTP client",
      "Implemented global card payment using Stripe",
      "Tested widgets, validation and authentication forms, and APIs manually using Postman",
    ],
  ),
  ExperienceItem(
    company: "TxLabz",
    role: "DevOps Engineer (Internship)",
    period: "July 2025 - October 2025",
    location: "Lahore, Pakistan",
    achievements: const [
      "Gained hands-on experience with AWS Cloud Provider, CI/CD pipelines, and staging and production deployments",
      "Built a code-metrics prototype and stored its data in a database",
      "Sent prototype summaries to Slack via webhook and visualized metrics in Grafana",
    ],
  ),
  ExperienceItem(
    company: "TxLabz",
    role: "Mobile Application Developer (Internship)",
    period: "August 2023 - September 2023",
    location: "Lahore, Pakistan",
    achievements: const [
      "Completed a 6-week internship in Mobile App Development using Flutter",
      "Built Basic Calculator and BMI Calculator applications",
      "Designed an HBL-like banking application integrated with Firebase for user data management",
    ],
  ),
];