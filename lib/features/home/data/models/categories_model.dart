import 'package:bookmarks_wallet/features/home/domain/entities/categories_entity.dart';

class CategoriesModel extends CategoriesEntity {
  const CategoriesModel(
      {required super.id, required super.description, required super.title});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
          id: json['id'],
          description: json['description'],
          title: json['title']);
}
