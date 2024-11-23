import 'package:final_project/features/users/presentation/views/widgets/user_list_item.dart';
import 'package:final_project/features/users/presentation/views/widgets/user_model.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات المستخدمين التجريبية
    final List<UserModel> users = List.generate(
      7,
      (index) => UserModel(
        name: "User $index",
        email: "user$index@gmail.com",
        imageUrl: "http://via.placeholder.com/350x150",
        joinDate: "2024-2-${index + 1}",
      ),
    );

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserListItem(user: users[index]);
      },
    );
  }
}
