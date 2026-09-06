class ProjectItem {
  final String id;
  final String title;
  final String summary;
  final String description;
  final List<String> techStack;
  final String projectType;
  final String platform;
  final String? liveUrl;
  final String? githubUrl;
  final List<String> images;

  const ProjectItem({
    required this.id,
    required this.title,
    required this.summary,
    required this.description,
    required this.techStack,
    required this.projectType,
    required this.platform,
    this.liveUrl,
    this.githubUrl,
    this.images = const [],
  });
}

const List<ProjectItem> myProjects = [
  ProjectItem(
    id: 'aria',
    title: 'ARIA (Augmented Reality Informative Assistant)',
    summary:
        'An augmented-reality assistant that brings information into the physical environment.',
    description:
        'ARIA (An Informative Augmented Reality Assistant for Front Desk Information Services) is an AI-powered augmented reality assistant designed to improve information and navigation services within a campus environment. It allows users to interact with an AI chatbot to ask questions about campus information and receive visual assistance when locating rooms, offices, and other facilities. The system combines Augmented Reality, Artificial Intelligence, voice interaction, and real-time data management. Built with Unity and C#, ARIA provides the AR navigation experience, while a Python-based backend using FastAPI and PyTorch handles the AI chatbot, speech processing, and API services. Firebase Realtime Database is used for dynamically managing campus information, while QR codes provide an accessible way to initiate the AR experience.',
    techStack: ['Unity', 'C#', 'Python', 'PyTorch', 'Firebase'],
    projectType: 'Augmented reality assistant',
    platform: 'Mobile',
    images: [
      'assets/ARIA.png',
      'assets/ARIA_Body.jpg',
      'assets/ARIA_Body.jpg',
      'assets/ARIA_Body.jpg',
      'assets/DHSUD.png',
    ],
    liveUrl: 'https://joshuasalcedo899-cmyk.github.io/blog',
    githubUrl: 'https://github.com/joshuasalcedo899-cmyk/ARIA',
  ),
  ProjectItem(
    id: 'mail-tracking',
    title: 'Automated Mail Tracker for DHSUD',
    summary:
        'A tracking system for managing departmental mail workflows and visibility.',
    description:
        'This project organizes mail-tracking workflows for the Department of Human Settlements and Urban Development, helping users follow the status of incoming and outgoing correspondence.',
    techStack: ['PHP', 'CSS', 'JavaScript', 'Node.js'],
    projectType: 'Workflow dashboard',
    platform: 'Web',
    images: ['assets/DHSUD.png'],
  ),
];
