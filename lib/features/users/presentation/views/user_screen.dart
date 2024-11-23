import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'widgets/user_body.dart';


class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).members,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        centerTitle: true,
      ),
      body: const UserBody(),
    );
  }
}
