import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_demo/bloc/registration_bloc.dart';

class FirstNamePage extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final RegistrationCubit cubit = context.read<RegistrationCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final String firstName = _firstNameController.text;
                  cubit.submitFirstName(firstName);
                  Navigator.pushNamed(context, '/last-name');
                }
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
