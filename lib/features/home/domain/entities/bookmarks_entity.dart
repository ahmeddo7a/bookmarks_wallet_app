import 'package:equatable/equatable.dart';

class BookmarksEntity extends Equatable{
  final int id;
  final String url;
  final String title;
  final String body;
  final String createdAt;
  final String priority;

  const BookmarksEntity({required this.id,required this.url,required this.body,required this.title,required this.createdAt,required this.priority});

  @override
  List<Object?> get props => [id,url,body,title,createdAt,priority];
}