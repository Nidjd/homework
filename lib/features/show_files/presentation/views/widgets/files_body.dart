
import 'package:final_project/features/show_files/presentation/views/widgets/files_list.dart';
import 'package:flutter/material.dart';

class FilesBody extends StatelessWidget {
  const FilesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: FilesList(),
    );
  }
}
