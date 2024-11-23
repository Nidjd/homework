import 'package:final_project/core/cubits/language_cubit/languages_cubit.dart';
import 'package:final_project/features/show_groups/presentation/views/widgets/group_model.dart';
import 'package:final_project/features/show_groups/presentation/views/widgets/group_tile.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/core/cubits/theme_cubit/theme_cubit.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  List<GroupModel> groups = [
    GroupModel(groupName: "Flutter Enthusiasts", groupOwner: "John Doe", membersCount: 15),
    GroupModel(groupName: "Dart Developers", groupOwner: "Jane Smith", membersCount: 10),
    GroupModel(groupName: "Mobile App Gurus", groupOwner: "Alice Johnson", membersCount: 25),
    GroupModel(groupName: "Tech Innovators", groupOwner: "Michael Brown", membersCount: 8),
    GroupModel(groupName: "Open Source Coders", groupOwner: "Emily Davis", membersCount: 20),
  ];

  Future<void> _refreshGroups() async {
    // قم بتحديث القائمة هنا
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).group),
        actions: [
          // زر لتغيير اللغة
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (value) {
              context.read<LanguageCubit>().changeLanguage(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'en',
                child: Text(S.of(context).english),
              ),
              PopupMenuItem(
                value: 'ar',
                child: Text(S.of(context).arabic),
              ),
            ],
          ),
          // زر لتغيير الوضع الليلي
          IconButton(
            icon: Icon(
              context.read<ThemeCubit>().state == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              bool isDarkMode = context.read<ThemeCubit>().state == ThemeMode.light;
              context.read<ThemeCubit>().toggleTheme(isDarkMode);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshGroups,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: groups.isEmpty
              ? Center(
                  child: Text(S.of(context).noGroupsAvailable),
                )
              : ListView.builder(
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    return GroupTile(
                      group: groups[index],
                      onJoin: () {
                        // تنفيذ الانضمام إلى المجموعة
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}
