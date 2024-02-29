import 'package:bookmarks_wallet/features/home/domain/entities/categories_entity.dart';
import 'package:bookmarks_wallet/features/home/domain/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/basics/base_use_case.dart';
import '../../../../core/error/failure.dart';

class GetAllCategoriesUseCase extends BaseUseCase<List<CategoriesEntity>,NoParameters>{
  BaseHomeRepository baseHomeRepository;
  GetAllCategoriesUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<CategoriesEntity>>> call(NoParameters parameters) async{
    return await baseHomeRepository.getCategories();
  }

}