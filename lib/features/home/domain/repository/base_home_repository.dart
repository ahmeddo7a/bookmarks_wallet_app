import 'package:bookmarks_wallet/core/basics/parameters/map_parameters.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/bookmarks_entity.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/categories_entity.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/success_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class BaseHomeRepository {

  Future<Either<Failure,List<CategoriesEntity>>> getCategories();
  Future<Either<Failure,SuccessEntity>> addCategory(MapParameters parameters);
  Future<Either<Failure,List<BookmarksEntity>>> getAllBookmarks(int parameters);
  Future<Either<Failure,SuccessEntity>> addBookmarks(MapParameters parameters);



}