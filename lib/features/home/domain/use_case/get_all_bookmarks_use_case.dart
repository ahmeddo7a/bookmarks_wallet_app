import 'package:bookmarks_wallet/features/home/domain/entities/bookmarks_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/basics/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_home_repository.dart';

class GetAllBookmarksUseCase extends BaseUseCase<List<BookmarksEntity>,int>{
  BaseHomeRepository baseHomeRepository;
  GetAllBookmarksUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<BookmarksEntity>>> call(int parameters) async{
    return await baseHomeRepository.getAllBookmarks(parameters);
  }

}