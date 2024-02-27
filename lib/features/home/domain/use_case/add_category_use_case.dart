import 'package:bookmarks_wallet/core/basics/parameters/map_parameters.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/categories_entity.dart';
import 'package:bookmarks_wallet/features/home/domain/repository/base_categories_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/basics/base_use_case.dart';
import '../../../../core/error/failure.dart';

class AddCategoryUseCase extends BaseUseCase<CategoriesEntity,MapParameters>{
  BaseCategoriesRepository baseCategoriesRepository;
  AddCategoryUseCase(this.baseCategoriesRepository);

  @override
  Future<Either<Failure, CategoriesEntity>> call(MapParameters parameters) async{
    return await baseCategoriesRepository.addCategory(parameters);
  }

}