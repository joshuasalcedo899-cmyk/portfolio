

class ProjectItem {
  final String id;
  final String title;
  final String description;
  final List<String> techStack;
  final String? liveUrl;
  final String? githubUrl;
  final List<String> images;

  const ProjectItem({
    required this.id,
    required this.title,
    required this.description,
    required this.techStack,
    this.liveUrl,
    this.githubUrl,
    this.images = const [],
  });
}

const List<ProjectItem> myProjects = [
  ProjectItem(
    id: 'aria',
    title: 'Local AI Assistant',
    description: 'Android voice assistant using Piper TTS and local LLM endpoints.',
    techStack: ['Flutter', 'Kotlin', 'REST API'],
    githubUrl: 'https://github.com/username/project1',
  ),
  ProjectItem(
    id: 'mail-tracking',
    title: 'Custom Media Dashboard',
    description: 'A dashboard client for home server media streams.',
    techStack: ['Flutter Web', 'WebSockets'],
  ),
];