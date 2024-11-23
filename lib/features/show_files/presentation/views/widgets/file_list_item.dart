import 'package:final_project/features/show_files/presentation/views/widgets/file_model.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class FileListItem extends StatelessWidget {
  final FileModel file;

  const FileListItem({required this.file, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Text(
            "${file.id}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        title: Text(
          file.fileName,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(
          "${S.of(context).created} ${file.createdBy}",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.color
                    ?.withOpacity(0.7),
              ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.archive,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            // تنفيذ إجراء الأرشفة
          },
        ),
      ),
    );
  }
}
