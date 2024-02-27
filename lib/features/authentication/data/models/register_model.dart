
import '../../domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({required super.message});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      RegisterModel(message: json['message']);
}