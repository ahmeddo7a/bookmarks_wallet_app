part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}
class RegisterWaiting extends RegisterState {
  @override
  List<Object> get props => [];
}
class RegisterSchoolChanged extends RegisterState {
  @override
  List<Object> get props => [];
}
class RegisterShowPassword extends RegisterState {
  @override
  List<Object> get props => [];
}
class RegisterGetSchoolsSuccess extends RegisterState {
  @override
  List<Object> get props => [];
}
class ShowStudentNumberSuccess extends RegisterState {
  @override
  List<Object> get props => [];
}
class HideStudentNumberSuccess extends RegisterState {
  @override
  List<Object> get props => [];
}
class RegisterFailed extends RegisterState {
  @override
  List<Object> get props => [];
}
