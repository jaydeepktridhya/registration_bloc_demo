import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_demo/bloc/registration_bloc.dart';

class GenderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RegistrationCubit cubit = context.read<RegistrationCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your gender:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildGenderButton(context, cubit, Gender.male, 'Male'),
                _buildGenderButton(context, cubit, Gender.female, 'Female'),
                _buildGenderButton(context, cubit, Gender.other, 'Other'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGenderButton(BuildContext context, RegistrationCubit cubit,
      Gender gender, String text) {
    final selectedGender = cubit.selectedGender;

    return ElevatedButton(
      onPressed: () {
        cubit.selectGender(gender);
        Navigator.pushNamed(context, '/display');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          gender == selectedGender ? Colors.blue : Colors.grey,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: gender == selectedGender ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
