import 'package:bookmarks_wallet/features/home/domain/entities/categories_entity.dart';
import 'package:bookmarks_wallet/features/home/domain/repository/base_categories_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/basics/base_use_case.dart';
import '../../../../core/basics/parameters/auth_parameters.dart';
import '../../../../core/error/failure.dart';

class GetAllCategoriesUseCase extends BaseUseCase<List<CategoriesEntity>,NoParameters>{
  BaseCategoriesRepository baseCategoriesRepository;
  GetAllCategoriesUseCase(this.baseCategoriesRepository);

  @override
  Future<Either<Failure, List<CategoriesEntity>>> call(NoParameters parameters) async{
    return await baseCategoriesRepository.getCategories();
  }

}