import 'package:equatable/equatable.dart';

class MapParameters extends Equatable{
  final Map<String,dynamic> authData;

  const MapParameters({required this.authData});

  @override
  // TODO: implement props
  List<Object?> get props => [authData];
}