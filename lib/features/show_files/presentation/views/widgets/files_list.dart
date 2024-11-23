import 'package:final_project/features/show_files/presentation/views/widgets/file_list_item.dart';
import 'package:final_project/features/show_files/presentation/views/widgets/file_model.dart';
import 'package:flutter/material.dart';

class FilesList extends StatelessWidget {
  const FilesList({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات الملفات التجريبية
    final List<FileModel> files = List.generate(
      7,
      (index) => FileModel(
        fileName: "File ${index + 1}",
        createdBy: "user${index + 1}",
        id: index + 1,
      ),
    );

    return ListView.builder(
      itemCount: files.length,
      itemBuilder: (context, index) {
        return FileListItem(file: files[index]);
      },
    );
  }
}
