part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSchoolChanged extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginShowPassword extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginWaiting extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginFailed extends LoginState {
  @override
  List<Object> get props => [];
}