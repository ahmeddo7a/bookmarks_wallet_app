import 'package:bookmarks_wallet/core/basics/parameters/map_parameters.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/categories_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class BaseCategoriesRepository {

  Future<Either<Failure,List<CategoriesEntity>>> getCategories();
  Future<Either<Failure,CategoriesEntity>> addCategory(MapParameters parameters);


}