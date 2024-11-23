import 'package:final_project/features/show_files/presentation/views/widgets/files_body.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).files,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
      body: const FilesBody(),
    );
  }
}
