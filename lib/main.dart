import 'package:flutter/material.dart';
import 'package:flutter_testing/router/app_router.dart';

// Main function to run the app
void main() => runApp(const MyApp());

// MyApp is a stateless widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Build method to create the widget tree
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Disable debug banner
      debugShowCheckedModeBanner: true,
      routerConfig: appRouter,
    ); // MaterialApp
  }
}
