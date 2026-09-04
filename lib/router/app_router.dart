import 'package:flutter/material.dart';
import 'package:flutter_testing/views/projects/project_details.dart';
import 'package:flutter_testing/views/projects/project_item_list.dart';
import 'package:flutter_testing/widgets/centered_view/centered_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_testing/views/home_view/home_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return CenteredView(child: child);
      },
      routes: [GoRoute(path: '/', builder: (context, state) => const HomeView())],
    ),
    GoRoute(
      path: '/projects/:id',
      builder: (context, state) {
        final projectId = state.pathParameters['id'];
        final project = myProjects.firstWhere(
          (item) => item.id == projectId,
        );

        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          body: SafeArea(
            child: SingleChildScrollView(
              child: CenteredView(child: ProjectDetailPage(project: project)),
            ),
          ),
        );
      },
    ),
  ],
);
