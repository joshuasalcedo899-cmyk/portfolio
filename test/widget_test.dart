// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/views/projects/project_details.dart';
import 'package:flutter_testing/views/projects/project_item_list.dart';

void main() {
  testWidgets('renders the project case-study content', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: ProjectDetailPage(project: myProjects.first)),
    );

    expect(find.text(myProjects.first.title), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Project Facts'), findsOneWidget);
    expect(find.byType(Image), findsWidgets);
  });
}
