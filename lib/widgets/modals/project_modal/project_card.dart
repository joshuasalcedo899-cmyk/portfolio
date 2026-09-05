import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/app_colors.dart';
import 'package:flutter_testing/widgets/modals/project_modal/project_tags.dart';
import 'package:go_router/go_router.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String image;
  final String route;
  final List<String> tags;

  const ProjectCard({
    super.key,
    required this.title,
    required this.image,
    required this.route,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'View $title',
      child: Material(
        color: AppColors.tertiaryGroupedBackground(context),
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            final router = GoRouter.of(context);
            Navigator.pop(context);
            router.go(route);
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.apps_rounded,
                          size: 44,
                          color: AppColors.secondaryLabel(context),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.label(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(flex: 2, child: ProjectTags(tags)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'View project',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge?.copyWith(color: AppColors.accent),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.accent,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
