import 'package:go_router/go_router.dart';
import 'package:flutter_testing/views/home_view/home_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
  ]
);
