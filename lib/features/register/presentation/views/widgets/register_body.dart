import 'package:final_project/core/widgets/center_logo.dart';
import 'package:final_project/features/register/presentation/views/widgets/login_prompt.dart';
import 'package:final_project/features/register/presentation/views/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            CenterLogo(),
            SizedBox(height: 30),
            LoginPrompt(),
            SizedBox(height: 20),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
