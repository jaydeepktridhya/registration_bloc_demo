import 'package:registration_demo/bloc/registration_bloc.dart';

abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationUpdatedState extends RegistrationState {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final Gender? selectedGender;

  RegistrationUpdatedState({this.firstName, this.lastName, this.email, this.password, this.selectedGender});
}