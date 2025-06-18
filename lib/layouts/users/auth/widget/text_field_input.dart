import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/controller/shared/validation/text_direction_validation_bloc.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required this.controller,
    this.focusNode,
    this.action = TextInputAction.done,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.prefix,
    this.inputFormatters,
    this.keyboardType,
    this.readOnly = false,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.autoCorrect = true,
    this.enableSuggestions = true,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputAction action;
  final IconButton? suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final Function(String value)? onChanged;
  final String? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool readOnly;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool autoCorrect;
  final bool enableSuggestions;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => TextDirectionValidationBloc(context),
      child: BlocBuilder<TextDirectionValidationBloc, TextDirectionState>(
        builder: (context, state) => TextFormField(
          controller: controller,
          maxLength: maxLength,
          keyboardType: keyboardType,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isDarkMode ? Colors.white : AppColors.secondaryTextGray,
              ),
          autocorrect: autoCorrect,
          enableSuggestions: enableSuggestions,
          maxLines: maxLines,
          onChanged: (text) {
            context
                .read<TextDirectionValidationBloc>()
                .updateTextDirection(text);
            onChanged?.call(text);
          },
          readOnly: readOnly,
          textAlign: state.textAlign,
          textDirection: state.textDirection,
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            filled: true,
            prefixText: prefix,
            prefixStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: isDarkMode ? Colors.white : AppColors.deepPurpleBlack,
                ),
            contentPadding: const EdgeInsets.all(15.0),
            helperStyle:
                TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            fillColor:
                isDarkMode ? AppColors.inputFieldDarkBackground : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffixIcon,
          ),
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          validator: validator,
          textInputAction: action,
          minLines: minLines,
        ),
      ),
    );
  }
}
