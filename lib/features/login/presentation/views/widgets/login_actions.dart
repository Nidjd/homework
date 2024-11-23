import 'package:flutter/material.dart';
import 'package:final_project/core/utils/styles.dart';
import 'package:final_project/generated/l10n.dart';

class LoginActions extends StatelessWidget {
  final Function() onPressed;
  const LoginActions({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          onPressed: onPressed,
          color: Theme.of(context)
              .elevatedButtonTheme
              .style
              ?.backgroundColor
              ?.resolve({}),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
          minWidth: 120,
          child: Text(
            S.of(context).login,
            style: Styles.textStyleButtonSecondary.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).or,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
