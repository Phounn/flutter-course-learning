class CourseModel {
  final String name;
  final String price;
  final String imageUrl;
  final String description;
  bool isApplied;
  CourseModel({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.isApplied,
  });
}

class CourseList {
  static List<CourseModel> listCourse = [
    CourseModel(
      name: 'Flutter Mobile P',
      price: '1,500,000',
      imageUrl: 'https://miro.medium.com/1*10RECXGTH5NyaeBg5yD1pw.png',
      description:
          'Learn how to build high-quality native interfaces on iOS and Android in record time.',
      isApplied: true,
    ),
    CourseModel(
      name: 'Python for Data Science',
      price: '1,200,000',
      imageUrl: 'https://www.fullstackpython.com/img/logos/py.png',
      description:
          'Master Python for data analysis, visualization, and machine learning.',
      isApplied: false,
    ),
    CourseModel(
      name: 'UI/UX Design Essentials',
      price: '950,000',
      imageUrl: 'https://miro.medium.com/1*hp-yfKsmzsj711iLbM8eEw.jpeg',
      description:
          'Learn the fundamental principles of UI/UX design and how to use Figma.',
      isApplied: false,
    ),
    CourseModel(
      name: 'Node.js Backend Mastery',
      price: '1,800,000',
      imageUrl:
          'https://agilesparks.com/wp-content/uploads/2022/06/nodejs-new-pantone-black.png',
      description:
          'Build scalable and efficient back-end applications using Node.js and Express.',
      isApplied: true,
    ),
  ];
}
