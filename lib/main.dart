import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_demo/pages/email_page.dart';
import 'package:registration_demo/pages/gender_page.dart';
import 'package:registration_demo/pages/password_page.dart';
import 'package:registration_demo/bloc/registration_bloc.dart';

import 'pages/first_name_page.dart';
import 'pages/last_name_page.dart';
import 'pages/display_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RegistrationCubit cubit = RegistrationCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Registration App',
      initialRoute: '/',
      routes: {
        '/': (_) => BlocProvider<RegistrationCubit>(
          create: (_) => cubit,
          child: FirstNamePage(),
        ),
        '/last-name': (_) => BlocProvider.value(
          value: cubit,
          child: LastNamePage(),
        ),
        '/email': (_) => BlocProvider.value(
          value: cubit,
          child: EmailPage(),
        ),
        '/password': (_) => BlocProvider.value(
          value: cubit,
          child: PasswordPage(),
        ),
        '/gender': (_) => BlocProvider.value(
          value: cubit,
          child: GenderPage(),
        ),
        '/display': (_) => BlocProvider.value(
          value: cubit,
          child: DisplayPage(),
        ),
      },
    );
  }
}
