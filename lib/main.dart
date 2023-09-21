import 'package:api/Features/HomeTest/Data/repo/homeRepoImplem.dart';
import 'package:api/Features/HomeTest/prsentation/view_model/user_cubit.dart';
import 'package:api/core/utils/api_servise/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/HomeTest/prsentation/view/display.dart';
import 'Features/auth/prsentation/view/login/login_screen.dart';
import 'Features/auth/prsentation/view/register/register_screen.dart';
import 'Features/auth/prsentation/view_model/cubit/PasswordVisibilityCubit.dart';
import 'core/injection.dart';

void main() {
  initGitIT();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(
        create: (context) => PasswordVisibilityCubit(),),
        BlocProvider(
          create: (context) => getIt.get<UserCubit>(),
        )
      ],
      child: MaterialApp(

        home: UserProfileScreen(),
      ),
    );
  }
}
