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
        'ARIA is an interactive assistant project that combines augmented reality and AI-driven conversation to make information easier to explore in context.',
    techStack: ['Unity', 'C#', 'Python', 'AI', 'AR', 'Chatbot'],
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
