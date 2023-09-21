import 'package:flutter/material.dart';

import 'widgets/loginbody.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginBody(),

    );
  }
}


