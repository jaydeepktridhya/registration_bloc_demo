import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_demo/bloc/registration_bloc.dart';

class LastNamePage extends StatelessWidget {
  final TextEditingController _lastNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final RegistrationCubit cubit = context.read<RegistrationCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Last Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final String lastName = _lastNameController.text;
                  cubit.submitLastName(lastName);
                  Navigator.pushNamed(context, '/email');
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
