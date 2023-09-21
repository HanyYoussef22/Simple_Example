import 'package:api/Features/auth/prsentation/view/register/widgets/registerbody.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: RegisterBody(),
    );
  }
}
