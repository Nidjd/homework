import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class GroupAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLogout;
  final VoidCallback onAddGroup;

  const GroupAppBar({
    super.key,
    required this.onLogout,
    required this.onAddGroup,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        S.of(context).group,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        onPressed: onLogout,
        icon: Icon(Icons.logout, color: Theme.of(context).iconTheme.color),
      ),
      actions: [
        IconButton(
          onPressed: onAddGroup,
          icon: Icon(Icons.add, color: Theme.of(context).iconTheme.color),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
