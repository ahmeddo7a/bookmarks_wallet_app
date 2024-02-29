import 'package:bookmarks_wallet/core/basics/parameters/map_parameters.dart';
import 'package:bookmarks_wallet/features/home/domain/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/basics/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../entities/success_entity.dart';

class AddCategoryUseCase extends BaseUseCase<SuccessEntity,MapParameters>{
  BaseHomeRepository baseHomeRepository;
  AddCategoryUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, SuccessEntity>> call(MapParameters parameters) async{
    return await baseHomeRepository.addCategory(parameters);
  }

}