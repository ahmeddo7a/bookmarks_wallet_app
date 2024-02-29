import 'package:bookmarks_wallet/features/home/domain/entities/bookmarks_entity.dart';

class BookmarksModel extends BookmarksEntity {
  const BookmarksModel(
      {required super.id, required super.url, required super.body, required super.title, required super.createdAt, required super.priority});

  factory BookmarksModel.fromJson(Map<String, dynamic> json) =>
      BookmarksModel(id: json['id'], url: json['url'], body: json['body'], title: json['title'],createdAt: json['created_at'],priority: json['piriority']);
}
