import 'package:flutter/material.dart';

import '../../../../../../core/custem/custem_text_formFiled.dart';
import '../../../../../../core/utils/style/clors.dart';
import '../../../../../../core/utils/style/styles.dart';
import '../../login/widgets/textTitel.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: IntrinsicHeight(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height*0.07,
                  ),
                  const TitelScreen(
                    Text1: 'Register',
                    Text2: 'Welcome back to the app',
                  ),
                  SizedBox(
                    height: height*0.05,
                  ),
                  const Text(
                    'Email Address',
                    style: Styles.titleStyle18N,
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  customField(
                    name: "hello@example.com",
                    controller: emailController,
                    fillColor: WhiteColor,
                    validate: EmailValidate,
                  ),
                  SizedBox(
                    height: height*0.03,
                  ),
                  const Text(
                    'Password',
                    style: Styles.titleStyle18N,
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  customField(
                      name: '..........',
                      controller: passController,

                      fillColor: WhiteColor,

                      validate: PassValidate
                  ),
                  SizedBox(
                    height: height*0.04,
                  ),
                  submitButton(submitText: 'Register ', onTap: ()
                      {
                        formKey.currentState!.validate();
                      }),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? EmailValidate (text) {
  if (text!.isEmpty || text.trim().isEmpty) {
    return 'Pleas Enter Your Email';
  }
  bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(text);
  if (!emailValid) {
    return 'Email not Valid';
  }
  return null;
}
String? PassValidate (text) {
  if (text!.isEmpty ||
      text.trim().isEmpty) {
    return 'You must write Your Password';
  }
  if (text.length < 6) {
    return 'Password Enter Valid ';
  }
  return null;
}