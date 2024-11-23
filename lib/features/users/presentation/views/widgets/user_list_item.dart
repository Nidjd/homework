import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/features/users/presentation/views/widgets/user_model.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final UserModel user;

  const UserListItem({required this.user, super.key});

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
          child: CachedNetworkImage(
            imageUrl: user.imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
            errorWidget: (context, url, error) =>
                Icon(Icons.error, color: Theme.of(context).colorScheme.error),
          ),
        ),
        title: Text(
          user.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(
          user.email,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.color
                    ?.withOpacity(0.7),
              ),
        ),
        trailing: Text(
          "${S.of(context).historyOfJoin} ${user.joinDate}",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
