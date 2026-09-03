import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_testing/views/projects/project_item_list.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectItem project;
  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 720;

            return ListView(
              padding: EdgeInsets.symmetric(
                horizontal: isCompact ? 20 : 48,
                vertical: isCompact ? 20 : 32,
              ),
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ProjectHeader(project: project),
                        const SizedBox(height: 32),
                        _ProjectGallery(project: project),
                        const SizedBox(height: 40),
                        _ProjectContent(project: project, isCompact: isCompact),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ProjectHeader extends StatelessWidget {
  final ProjectItem project;

  const _ProjectHeader({required this.project});

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    await launchUrl(url, mode: LaunchMode.platformDefault);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              tooltip: 'Back to home',
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.arrow_back),
            ),
            const Spacer(),
            if (project.githubUrl != null)
              IconButton(
                tooltip: 'Open source code',
                onPressed: () => _launchUrl(project.githubUrl!),
                icon: const Icon(Icons.code),
              ),
            if (project.liveUrl != null)
              IconButton(
                tooltip: 'Open live project',
                onPressed: () => _launchUrl(project.liveUrl!),
                icon: const Icon(Icons.open_in_new),
              ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          project.title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: const Color(0xFF151515),
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          project.summary,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: const Color(0xFF5A5A5A),
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: project.techStack
              .map(
                (tech) => Chip(
                  label: Text(tech),
                  side: const BorderSide(color: Color(0xFFD6D6D6)),
                  backgroundColor: Colors.white,
                  visualDensity: VisualDensity.compact,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ProjectGallery extends StatelessWidget {
  final ProjectItem project;

  const _ProjectGallery({required this.project});

  @override
  Widget build(BuildContext context) {
    if (project.images.isEmpty) {
      return const _ImagePlaceholder();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final showSupportingImages =
            constraints.maxWidth >= 720 && project.images.length > 1;

        if (!showSupportingImages) {
          return _GalleryImage(
            imagePath: project.images.first,
            aspectRatio: 16 / 9,
          );
        }

        final supportingImages = project.images.skip(1).take(2).toList();
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: _GalleryImage(
                imagePath: project.images.first,
                aspectRatio: 1,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: _GalleryImage(imagePath: supportingImages.first),
                  ),
                  if (supportingImages.length > 1) ...[
                    const SizedBox(height: 16),
                    Expanded(
                      child: _GalleryImage(imagePath: supportingImages[1]),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _GalleryImage extends StatelessWidget {
  final String imagePath;
  final double? aspectRatio;

  const _GalleryImage({required this.imagePath, this.aspectRatio});

  @override
  Widget build(BuildContext context) {
    final image = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD6D6D6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => const _ImagePlaceholder(),
        ),
      ),
    );

    if (aspectRatio == null) {
      return image;
    }

    return AspectRatio(aspectRatio: aspectRatio!, child: image);
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD6D6D6)),
      ),
      child: const Icon(Icons.photo_library_outlined, size: 44),
    );
  }
}

class _ProjectContent extends StatelessWidget {
  final ProjectItem project;
  final bool isCompact;

  const _ProjectContent({required this.project, required this.isCompact});

  @override
  Widget build(BuildContext context) {
    final overview = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Overview', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Text(
          project.description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        ),
      ],
    );

    final facts = _ProjectFacts(project: project);

    if (isCompact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [overview, const SizedBox(height: 28), facts],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: overview),
        const SizedBox(width: 56),
        Expanded(child: facts),
      ],
    );
  }
}

class _ProjectFacts extends StatelessWidget {
  final ProjectItem project;

  const _ProjectFacts({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD6D6D6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Project facts', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          _FactRow(label: 'Type', value: project.projectType),
          const SizedBox(height: 12),
          _FactRow(label: 'Platform', value: project.platform),
          const SizedBox(height: 12),
          _FactRow(label: 'Stack', value: project.techStack.join(', ')),
        ],
      ),
    );
  }
}

class _FactRow extends StatelessWidget {
  final String label;
  final String value;

  const _FactRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: const Color(0xFF6D6D6D),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 3),
        Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
