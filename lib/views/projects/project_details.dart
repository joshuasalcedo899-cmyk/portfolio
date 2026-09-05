import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/app_colors.dart';
import 'package:flutter_testing/views/projects/image_view.dart';
import 'package:flutter_testing/views/projects/project_item_list.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectItem project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.groupedBackground(context),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 760;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isCompact ? 16 : 48,
              vertical: isCompact ? 16 : 36,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1080),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProjectHeader(project: project, isCompact: isCompact),
                    const SizedBox(height: 28),
                    _ProjectGallery(project: project),
                    const SizedBox(height: 28),
                    _ProjectContent(project: project, isCompact: isCompact),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProjectHeader extends StatelessWidget {
  final ProjectItem project;
  final bool isCompact;

  const _ProjectHeader({required this.project, required this.isCompact});

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    await launchUrl(url, mode: LaunchMode.platformDefault);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _CircleIconButton(
              tooltip: 'Back to home',
              icon: CupertinoIcons.chevron_back,
              onPressed: () => context.go('/'),
            ),
            const Spacer(),
            if (project.githubUrl != null)
              _CircleIconButton(
                tooltip: 'Open source code',
                icon: CupertinoIcons.chevron_left_slash_chevron_right,
                onPressed: () => _launchUrl(project.githubUrl!),
              ),
            if (project.liveUrl != null) ...[
              const SizedBox(width: 8),
              _CircleIconButton(
                tooltip: 'Open live project',
                icon: CupertinoIcons.arrow_up_right,
                onPressed: () => _launchUrl(project.liveUrl!),
              ),
            ],
          ],
        ),
        const SizedBox(height: 30),
        Text(
          project.projectType,
          style: textTheme.labelLarge?.copyWith(
            color: AppColors.accent,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          project.title,
          style: (isCompact ? textTheme.headlineMedium : textTheme.displaySmall)
              ?.copyWith(
                color: AppColors.label(context),
                fontWeight: FontWeight.w800,
                height: 1.04,
              ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Text(
            project.summary,
            style: textTheme.titleMedium?.copyWith(
              color: AppColors.secondaryLabel(context),
              height: 1.45,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: project.techStack
              .map((tech) => _TechnologyPill(label: tech))
              .toList(),
        ),
      ],
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  const _CircleIconButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: AppColors.secondaryGroupedBackground(context),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: SizedBox(
            width: 44,
            height: 44,
            child: Icon(icon, color: AppColors.label(context), size: 22),
          ),
        ),
      ),
    );
  }
}

class _TechnologyPill extends StatelessWidget {
  final String label;

  const _TechnologyPill({required this.label});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.secondaryGroupedBackground(context),
        border: Border.all(color: AppColors.separator(context)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.label(context),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ProjectGallery extends StatefulWidget {
  final ProjectItem project;

  const _ProjectGallery({required this.project});

  @override
  State<_ProjectGallery> createState() => _ProjectGalleryState();
}

class _ProjectGalleryState extends State<_ProjectGallery> {
  var _selectedIndex = 0;

  void _selectImage(int index) {
    setState(() => _selectedIndex = index);
  }

  void _selectNextImage() {
    _selectImage((_selectedIndex + 1) % widget.project.images.length);
  }

  void _selectPreviousImage() {
    _selectImage(
      (_selectedIndex - 1 + widget.project.images.length) %
          widget.project.images.length,
    );
  }

  void _openSelectedImage() {
    showDialog(
      context: context,
      builder: (context) =>
          ImageView(imagePath: widget.project.images[_selectedIndex]),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.project.images.isEmpty) {
      return const _ImagePlaceholder();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 720;
        final hasMultipleImages = widget.project.images.length > 1;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gallery', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Material(
              color: AppColors.secondaryGroupedBackground(context),
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: isCompact ? 4 / 3 : 16 / 9,
                        child: _GalleryImageTile(
                          imagePath: widget.project.images[_selectedIndex],
                          onTap: _openSelectedImage,
                        ),
                      ),
                      if (hasMultipleImages) ...[
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: _GalleryNavigationButton(
                                tooltip: 'Previous image',
                                icon: CupertinoIcons.chevron_left,
                                onPressed: _selectPreviousImage,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: _GalleryNavigationButton(
                                tooltip: 'Next image',
                                icon: CupertinoIcons.chevron_right,
                                onPressed: _selectNextImage,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 14,
                          bottom: 14,
                          child: _ImageCountPill(
                            current: _selectedIndex + 1,
                            total: widget.project.images.length,
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (hasMultipleImages)
                    _ThumbnailStrip(
                      images: widget.project.images,
                      selectedIndex: _selectedIndex,
                      onSelected: _selectImage,
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _GalleryImageTile extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;

  const _GalleryImageTile({required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background(context),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.background(context),
            border: Border.all(color: AppColors.separator(context)),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(
                  CupertinoIcons.photo,
                  size: 44,
                  color: AppColors.secondaryLabel(context),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ThumbnailStrip extends StatelessWidget {
  final List<String> images;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _ThumbnailStrip({
    required this.images,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(12),
        itemCount: images.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return Semantics(
            button: true,
            selected: isSelected,
            label: 'Select image ${index + 1}',
            child: Material(
              color: AppColors.background(context),
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => onSelected(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  width: 112,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? AppColors.accent
                          : AppColors.separator(context),
                      width: isSelected ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _GalleryNavigationButton extends StatelessWidget {
  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  const _GalleryNavigationButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: AppColors.background(context).withValues(alpha: 0.86),
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: SizedBox(
            width: 44,
            height: 44,
            child: Icon(icon, color: AppColors.label(context), size: 24),
          ),
        ),
      ),
    );
  }
}

class _ImageCountPill extends StatelessWidget {
  final int current;
  final int total;

  const _ImageCountPill({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.background(context).withValues(alpha: 0.86),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(
          '$current of $total',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.label(context),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return _SectionSurface(
      title: 'Gallery',
      child: SizedBox(
        height: 260,
        child: Center(
          child: Icon(
            CupertinoIcons.photo,
            size: 44,
            color: AppColors.secondaryLabel(context),
          ),
        ),
      ),
    );
  }
}

class _ProjectContent extends StatelessWidget {
  final ProjectItem project;
  final bool isCompact;

  const _ProjectContent({required this.project, required this.isCompact});

  @override
  Widget build(BuildContext context) {
    final overview = _SectionSurface(
      title: 'Overview',
      child: Text(
        project.description,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColors.label(context),
          height: 1.55,
        ),
      ),
    );

    final facts = _ProjectFacts(project: project);

    if (isCompact) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [overview, const SizedBox(height: 16), facts],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: overview),
        const SizedBox(width: 18),
        Expanded(child: facts),
      ],
    );
  }
}

class _SectionSurface extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionSurface({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondaryGroupedBackground(context),
        border: Border.all(color: AppColors.separator(context)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.label(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _ProjectFacts extends StatelessWidget {
  final ProjectItem project;

  const _ProjectFacts({required this.project});

  @override
  Widget build(BuildContext context) {
    return _SectionSurface(
      title: 'Project Facts',
      child: Column(
        children: [
          _FactRow(label: 'Type', value: project.projectType),
          const _FactDivider(),
          _FactRow(label: 'Platform', value: project.platform),
          const _FactDivider(),
          _FactRow(label: 'Stack', value: project.techStack.join(', ')),
        ],
      ),
    );
  }
}

class _FactDivider extends StatelessWidget {
  const _FactDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(height: 22, color: AppColors.separator(context));
  }
}

class _FactRow extends StatelessWidget {
  final String label;
  final String value;

  const _FactRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 92,
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.secondaryLabel(context),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.label(context)),
          ),
        ),
      ],
    );
  }
}
