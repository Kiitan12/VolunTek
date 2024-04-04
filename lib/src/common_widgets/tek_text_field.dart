import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volun_tek/src/constants/colors.dart';

class TekTextField extends StatelessWidget {
  const TekTextField({
    super.key,
    this.inputController,
    this.hint,
    this.keyboardType,
    this.onChanged,
    this.maxLines,
    this.validator,
    this.enabled,
    this.obscureText = false,
    this.onPressedSuffixIcon,
    this.focusNode,
    this.initialValue,
  });

  final TextEditingController? inputController;
  final String? hint;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool? enabled;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;
  final VoidCallback? onPressedSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      focusNode: focusNode,
      keyboardType: keyboardType,
      controller: inputController,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines ?? 1,
      enabled: enabled,
      obscureText: obscureText,
      inputFormatters: [
        // FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
        FilteringTextInputFormatter.deny(RegExp('\t')),
      ],
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        suffixIcon: keyboardType == TextInputType.visiblePassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: kBlue,
                ),
                onPressed: onPressedSuffixIcon,
              )
            : const SizedBox.shrink(),
        hintText: hint,
        filled: true,
        fillColor: kGray85,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            width: 2.12,
            color: kBlue,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            width: 0,
            color: kPaleBlue,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            width: 0,
            color: kBlue,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            width: 2.12,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(
            width: 2.12,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
