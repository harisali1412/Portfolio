class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

// Work Projects
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
      image: 'assets/projects/DFU.png',
      title: 'Diabetic Foot Ulcer Prediction and Recommendation',
      subtitle:
          'AI based project using python and it will diagnose foot ulcer of 4 classes classification',
      webLink: 'https://github.com/harisali1412/DFU-Detection'),
  ProjectUtils(
      image: 'assets/projects/ECG.png',
      title: 'Electrocardiogram Detection',
      subtitle:
          'AI based project using python and it will diagnose heart of 6 classes classification',
      webLink: 'https://github.com/harisali1412/ECG-Detection'),
  ProjectUtils(
      image: 'assets/projects/CVD.png',
      title: 'Cardiovascular Disease',
      subtitle:
          'AI based project using python and it will predict according to user input field',
      webLink: 'https://github.com/harisali1412/Cardiovascular_Risk_Prediction')
];
