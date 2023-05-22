import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_demo/bloc/registration_bloc.dart';
import 'package:registration_demo/bloc/registration_state.dart';

class DisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RegistrationState state = context.watch<RegistrationCubit>().state;

    if (state is RegistrationUpdatedState) {
      final String? firstName = state.firstName;
      final String? lastName = state.lastName;
      final String? email = state.email;
      final String? password = state.password;
      final Gender? selectedGender = state.selectedGender;
      String genderText = '';

      if (selectedGender == Gender.male) {
        genderText = 'Male';
      } else if (selectedGender == Gender.female) {
        genderText = 'Female';
      } else if (selectedGender == Gender.other) {
        genderText = 'Other';
      }

      return Scaffold(
        appBar: AppBar(
          title: const Text('Registration Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'First Name: $firstName',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Last Name: $lastName',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Email: $email',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Password: $password',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Gender: $genderText',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );
    }

    return Container(); // Placeholder or loading state if needed
  }
}
