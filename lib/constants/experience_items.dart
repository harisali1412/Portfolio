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
      "Developing, maintaining, and enhancing production-grade Flutter mobile applications with a focus on reliability, performance, and user experience",
      "Troubleshooting and resolving complex application issues across UI, authentication, API integration, networking, and third-party services",
      "Managing and integrating WordPress-based backends and REST APIs, including server-side troubleshooting and API connectivity",
      "Customizing and extending AdForest applications to meet client requirements by developing new features and optimizing existing functionality",
      "Integrating and maintaining Firebase Authentication, phone verification, Google and Facebook Sign-In, payment services, push notifications, and other third-party integrations",
      "Testing, debugging, and optimizing applications across Android devices while ensuring stable API communication and production readiness",
    ],
  ),
  ExperienceItem(
    company: "Shaukat Khanum Memorial Cancer Hospital & Research Centre",
    role: "Mobile Application Developer",
    period: "December 2025 - May 2026",
    location: "Lahore, Pakistan",
    achievements: const [
      "Developed MediTrack, a healthcare mobile application designed to support workflows for both doctors and patients",
      "Developed a Chughtai Lab-inspired healthcare application using MVC architecture and GetX for scalable state management",
      "Designed and integrated RESTful APIs using Python and Flask, connecting backend services with Flutter through the Dio HTTP client",
      "Integrated Stripe to enable secure and globally supported card payment functionality",
      "Performed comprehensive manual testing of UI components, form validation, authentication flows, APIs, and application functionality using Postman",
    ],
  ),
  ExperienceItem(
    company: "TxLabz",
    role: "DevOps Engineer (Internship)",
    period: "July 2025 - October 2025",
    location: "Lahore, Pakistan",
    achievements: const [
      "Gained hands-on experience with AWS cloud infrastructure, CI/CD pipelines, and staging and production deployment workflows",
      "Developed a code-metrics prototype for collecting, processing, and storing software engineering metrics in a database",
      "Integrated Slack webhooks to automate metric summaries and configured Grafana dashboards for monitoring and visualization",
    ],
  ),
  ExperienceItem(
    company: "TxLabz",
    role: "Mobile Application Developer (Internship)",
    period: "August 2023 - September 2023",
    location: "Lahore, Pakistan",
    achievements: const [
      "Developed mobile applications including a Basic Calculator and BMI Calculator using Flutter",
      "Designed and developed an HBL-inspired banking application with Firebase integration for user data management",
      "Gained practical experience in Flutter development, Firebase integration, UI implementation, and application debugging",
    ],
  ),
];

