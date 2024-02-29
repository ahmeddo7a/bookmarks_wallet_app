import 'package:bookmarks_wallet/features/home/domain/entities/success_entity.dart';

class SuccessModel extends SuccessEntity {
  const SuccessModel({required super.message});

  factory SuccessModel.fromJson(Map<String, dynamic> json) =>
      SuccessModel(message: json['message']);
}
