import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_demo/bloc/registration_state.dart';

enum Gender { male, female, other }

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  Gender? selectedGender;

  void submitFirstName(String firstName) {
    this.firstName = firstName;
  }

  void submitLastName(String lastName) {
    this.lastName = lastName;
  }

  void submitEmail(String email){
    this.email = email;
  }

  void submitPassword(String password){
    this.password = password;
  }

  void selectGender(Gender gender) {
    selectedGender = gender;
    emit(RegistrationUpdatedState(firstName: firstName, lastName: lastName, email: email, password: password, selectedGender: gender));
  }
}
