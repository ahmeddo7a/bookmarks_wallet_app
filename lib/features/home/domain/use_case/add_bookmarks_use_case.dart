import 'package:dartz/dartz.dart';

import '../../../../core/basics/base_use_case.dart';
import '../../../../core/basics/parameters/map_parameters.dart';
import '../../../../core/error/failure.dart';
import '../entities/success_entity.dart';
import '../repository/base_home_repository.dart';

class AddBookmarksUseCase extends BaseUseCase<SuccessEntity,MapParameters>{
  BaseHomeRepository baseHomeRepository;
  AddBookmarksUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, SuccessEntity>> call(MapParameters parameters) async{
    return await baseHomeRepository.addBookmarks(parameters);
  }

}