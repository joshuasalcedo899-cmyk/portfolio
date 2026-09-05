import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/modals/apple_dialog_scaffold.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppleDialogScaffold(
      title: 'My Skills',
      child: Text(
        'Hi! I am a Software Developer...',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
