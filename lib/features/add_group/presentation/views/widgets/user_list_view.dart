import 'package:final_project/features/add_group/presentation/views/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class UserListView extends StatelessWidget {
  final List<Map<String, String>> users;
  final List<int> selectedUsers;
  final Function(String userId) onSelectUser;

  const UserListView({
    super.key,
    required this.users,
    required this.selectedUsers,
    required this.onSelectUser,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        final isSelected = selectedUsers.contains(int.parse(user["id"]!));

        return GestureDetector(
          onLongPress: () => onSelectUser(user["id"]!),
          onTap: () => onSelectUser(user["id"]!),
          child: UserTile(
            user: user,
            isSelected: isSelected,
          ),
        );
      },
    );
  }
}
