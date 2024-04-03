import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/app_style.dart';
import '../constants/colors.dart';
import '../features/authentication/presentation/provider/sign_up_provider.dart';

class TekPasswordField extends ConsumerWidget {
  const TekPasswordField({
    Key? key,
    required this.hintText,
    this.height,
    this.width,
    this.prefix,
    this.validator,
    this.onChanged,
    this.controller,
    this.autofillHints,
    this.borderRadius,
  }) : super(key: key);

  final String hintText;
  final double? width;
  final double? height;
  final Widget? prefix;

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final List<String>? autofillHints;
  final double? borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var hidePassword = ref.watch(hidePasswordProvider);
    return TextFormField(
      obscureText: hidePassword,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        prefix: prefix,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        suffix: InkWell(
          onTap: () {
            ref.read(hidePasswordProvider.notifier).state =
                !ref.read(hidePasswordProvider.notifier).state;
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: hidePassword
                ? const Icon(Icons.visibility, color: Colors.grey)
                : const Icon(Icons.visibility_off, color: Colors.grey),
          ),
        ),
        hintStyle: AppStyle.kRegular16.copyWith(
          color: Colors.black.withOpacity(0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: kBlue),
        ),
      ),
    );
  }
}
