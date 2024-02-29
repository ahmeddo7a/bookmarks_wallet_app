import 'package:equatable/equatable.dart';

class MapParameters extends Equatable{
  final Map<String,dynamic> params;

  const MapParameters({required this.params});

  @override
  // TODO: implement props
  List<Object?> get props => [params];
}