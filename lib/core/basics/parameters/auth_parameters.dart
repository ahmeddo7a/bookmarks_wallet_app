import 'package:equatable/equatable.dart';

class AuthParameters extends Equatable{
  final Map<String,dynamic> authData;

  const AuthParameters({required this.authData});

  @override
  // TODO: implement props
  List<Object?> get props => [authData];
}