class ProjectItem {
  final String image;
  final String title;
  final String subtitle;
  final List<String> technologies;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final bool featured;

  ProjectItem({
    required this.image,
    required this.title,
    required this.subtitle,
    this.technologies = const [],
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.featured = false,
  });
}

List<ProjectItem> allProjects = [
  ProjectItem(
    image: 'assets/projects/MediTrack.png',
    title: 'MediTrack — Health Management Platform',
    subtitle: 'Cross-platform Flutter app connecting patients & doctors with real-time chat, health records, prescriptions, and role-based dashboards.',
    technologies: ['Flutter', 'Supabase', 'GetX', 'Firebase', 'FCM'],
    androidLink: 'https://play.google.com/store/apps/details?id=com.haris.meditrack',
    iosLink: 'https://apps.apple.com/app/meditrack',
    webLink: 'https://github.com/harisali1412/MediTrack',
    featured: true,
  ),
  ProjectItem(
    image: 'assets/projects/DFU.png',
    title: 'Diabetic Foot Ulcer Prediction',
    subtitle: 'AI-based 4-class classification system using EfficientNetB0 for early detection and diagnosis',
    technologies: ['Python', 'TensorFlow', 'EfficientNet', 'Flutter'],
    webLink: 'https://github.com/harisali1412/DFU-Detection',
    featured: true,
  ),
  ProjectItem(
    image: 'assets/projects/ECG.png',
    title: 'ECG Heart Disease Detection',
    subtitle: '6-class classification system for cardiovascular disease detection using deep learning',
    technologies: ['Python', 'TensorFlow', 'Deep Learning'],
    webLink: 'https://github.com/harisali1412/ECG-Detection',
    featured: true,
  ),
  ProjectItem(
    image: 'assets/projects/CVD.png',
    title: 'Cardiovascular Risk Prediction',
    subtitle: 'AI-based risk prediction system based on user health parameters',
    technologies: ['Python', 'Machine Learning', 'Data Science'],
    webLink: 'https://github.com/harisali1412/Cardiovascular_Risk_Prediction',
    featured: true,
  ),
];