import 'package:bookmarks_wallet/core/basics/parameters/map_parameters.dart';
import 'package:bookmarks_wallet/core/error/failure.dart';
import 'package:bookmarks_wallet/features/home/data/data_source/home_data_source.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/bookmarks_entity.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/categories_entity.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/success_entity.dart';
import 'package:bookmarks_wallet/features/home/domain/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';

class HomeRepository extends BaseHomeRepository{
  BaseHomeDataSource baseHomeDataSource;
  HomeRepository(this.baseHomeDataSource);

  @override
  Future<Either<Failure, SuccessEntity>> addCategory(MapParameters parameters) async{
    try {
      final result =  await baseHomeDataSource.addCategories(parameters);
      return Right(result);
    } on ServerException catch(failure){
      String finalResponse = '';
      for (var element in failure.errorMessageModel!.response.entries) {
        if(element.value is List){
          String value = element.value.join(',')   ;
          finalResponse += '$value\n';
        }else{
          finalResponse += '${element.value}\n';
        }
      }
      return Left(ServerFailure(finalResponse.trim()));
    }
  }

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getCategories() async{
    try {
      final result =  await baseHomeDataSource.getCategories();
      return Right(result);
    } on ServerException catch(failure){
      String finalResponse = '';
      for (var element in failure.errorMessageModel!.response.entries) {
        if(element.value is List){
          String value = element.value.join(',')   ;
          finalResponse += '$value\n';
        }else{
          finalResponse += '${element.value}\n';
        }
      }
      return Left(ServerFailure(finalResponse.trim()));
    }
  }

  @override
  Future<Either<Failure, SuccessEntity>> addBookmarks(MapParameters parameters) async{
    try {
      final result =  await baseHomeDataSource.addBookmarks(parameters);
      return Right(result);
    } on ServerException catch(failure){
      String finalResponse = '';
      for (var element in failure.errorMessageModel!.response.entries) {
        if(element.value is List){
          String value = element.value.join(',')   ;
          finalResponse += '$value\n';
        }else{
          finalResponse += '${element.value}\n';
        }
      }
      return Left(ServerFailure(finalResponse.trim()));
    }
  }

  @override
  Future<Either<Failure, List<BookmarksEntity>>> getAllBookmarks(int parameters) async{
    try {
      final result =  await baseHomeDataSource.getBookmarks(parameters);
      return Right(result);
    } on ServerException catch(failure){
      String finalResponse = '';
      for (var element in failure.errorMessageModel!.response.entries) {
        if(element.value is List){
          String value = element.value.join(',')   ;
          finalResponse += '$value\n';
        }else{
          finalResponse += '${element.value}\n';
        }
      }
      return Left(ServerFailure(finalResponse.trim()));
    }
  }
}