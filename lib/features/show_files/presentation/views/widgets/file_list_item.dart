import 'package:final_project/core/utils/app_router.dart';
import 'package:final_project/features/show_files/data/models/get_files_model/datum.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FileListItem extends StatelessWidget {
  final Datum file;
  final int id;
  final bool isSelected;
  final Function(int id) onSelect;

  const FileListItem({
    required this.file,
    required this.isSelected,
    required this.onSelect,
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => file.id != null ? onSelect(file.id!) : null,
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.2)
              : Theme.of(context).cardColor,
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
              file.id?.toString() ?? "N/A",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          title: Text(
            file.name ?? "No Name",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          subtitle: Text(
            "${S.of(context).status} ${file.status ?? "Unknown"}",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.color
                      ?.withOpacity(0.7),
                ),
          ),
          trailing: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                  child: const Text("Checkout"),
                  onPressed: () => GoRouter.of(context)
                      .push(AppRouter.kCheckOutPage, extra: id),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context)
                        .push(AppRouter.kgetChangedScreen, extra: id);
                  },
                  child: const Text('Get Changed'),
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kBacupFilesScreen,extra: id);
                  },
                  child: const Text('Backup'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
