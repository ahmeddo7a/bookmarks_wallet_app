import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable{
  final String title;
  final String description;
  final int id;

  const CategoriesEntity({required this.id,required this.description,required this.title});

  @override
  // TODO: implement props
  List<Object?> get props => [title,description,id];
}