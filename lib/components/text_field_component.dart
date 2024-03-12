import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isMulti;
  final bool? autofocus;
  final bool? enabled;
  final Widget? suffix;
  final Widget? prefix;
  final TextStyle? labelTextStyle;
  final String? hint;
  final String? title;
  final TextInputAction? textInputAction;
  final int maxLines;
  const TextFieldComponent({
    Key? key,
    this.controller,
    this.labelTextStyle,
    this.validator,
    this.title,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.obsecure = false,
    this.onTap,
    this.isMulti = false,
    this.readOnly = false,
    this.autofocus = false,
    this.suffix,
    this.prefix,
    this.hint,
    this.enabled = true,
    this.onEditingCompleted,
    this.textInputAction,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      onEditingComplete: onEditingCompleted,
      onTap: onTap,
      enabled: enabled,
      readOnly: readOnly,
      obscureText: obsecure,
      keyboardType: keyboardType,
      controller: controller,
      minLines: maxLines,
      maxLines: isMulti ? 5 : maxLines,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        errorMaxLines: 2,
        hintText: hint,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
    );
  }
}
