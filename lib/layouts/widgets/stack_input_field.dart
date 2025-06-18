import 'package:flutter/material.dart';
import 'package:marrige_app/layouts/users/auth/widget/text_field_container.dart';

class StackInPutField extends StatelessWidget {
  const StackInPutField({super.key, required this.textField,});

  final Widget textField;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: textField,
          ),
          const PositionedDirectional(
            start: 20,
            child: TextFieldContainer(),
          ),
        ],
      ),
    );
  }
}