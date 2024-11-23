import 'package:final_project/core/widgets/custom_text_form_field.dart';
import 'package:final_project/features/add_group/presentation/views/widgets/add_group_button.dart';
import 'package:final_project/features/add_group/presentation/views/widgets/user_list_view.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({super.key});

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();

  final List<int> selectedUsers = [];

  final List<Map<String, String>> users = [
    {"id": "1", "name": "User 1", "email": "user1@example.com"},
    {"id": "2", "name": "User 2", "email": "user2@example.com"},
    {"id": "3", "name": "User 3", "email": "user3@example.com"},
  ];

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CustomTextFormField(
              validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).groupNameRequired;
            }
            return "";
        },
              controller: _groupNameController,
              label: S.of(context).groupName,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: UserListView(
                users: users,
                selectedUsers: selectedUsers,
                onSelectUser: (userId) {
                  if (selectedUsers.contains(int.parse(userId))) {
                    selectedUsers.remove(int.parse(userId));
                  } else {
                    selectedUsers.add(int.parse(userId));
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            AddGroupButton(onAddGroup: () {
              // منطق الإضافة هنا
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).add)),
              );
            }),
          ],
        ),
      ),
    );
  }
}
