import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volun_tek/src/common_widgets/tek_password_field.dart';

import '../../../../common_widgets/tek_elevated_button.dart';
import '../../../../common_widgets/tek_text_field.dart';
import '../../../../constants/app_style.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/validation_helper.dart';
import '../controller/sign_up_controller.dart';
import '../provider/sign_up_provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    super.key,
    required this.validationHelper,
    required this.controller,
  });

  final ValidationHelper validationHelper;
  final SignUpController controller;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: AppStyle.kHeading1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28, bottom: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/signup.png',
                    height: 198,
                    alignment: Alignment.center,
                  ),
                ),
                const SizedBox(height: 12),
                Text('Name', style: AppStyle.kRegular20),
                const SizedBox(height: 4),
                TekTextField(
                  controller: name,
                  validator: (value) {
                    return widget.validationHelper.validateField(value!);
                  },
                ),
                const SizedBox(height: 20),
                Text('Email', style: AppStyle.kRegular20),
                const SizedBox(height: 4),
                TekTextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return widget.validationHelper.validateEmail(value!);
                  },
                ),
                const SizedBox(height: 20),
                Text('Password', style: AppStyle.kRegular20),
                const SizedBox(height: 4),
                Consumer(builder: (context, ref, child) {
                  return TekPasswordField(
                    hintText: '********',
                    controller: password,
                    validator: (value) {
                      return widget.validationHelper.validatePassword(value!);
                    },
                    onChanged: (value) {
                      ref.read(passwordMismatchProvider.notifier).state = value;
                    },
                  );
                }),
                const SizedBox(height: 20),
                Text('Confirm Password', style: AppStyle.kRegular20),
                const SizedBox(height: 4),
                Consumer(builder: (context, ref, child) {
                  return TekPasswordField(
                    hintText: '********',
                    controller: password2,
                    validator: (value) => widget.validationHelper
                        .validatePassword2(
                            value!, ref.watch(passwordMismatchProvider)),
                  );
                }),
                const SizedBox(height: 32),
                Consumer(builder: (context, ref, child) {
                  return TekElevatedButton(
                    title: 'Sign Up',
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Sign Up2', style: AppStyle.kRegular16),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('Email: ${email.text.trim()}');
                        print('Non related');

                        print(email.text);
                        print(password.text);
                        print(name.text);
                        firebaseService.signUpWithEmailAndPassword(
                          email: email.text.trim(),
                          password: password.text.trim(),
                          name: name.text.trim(),
                        );
                      }
                    },
                  );
                }),
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Have an account? ',
                      style: AppStyle.kRegular12,
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: kBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
