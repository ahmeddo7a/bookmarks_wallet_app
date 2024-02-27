import 'package:dartz/dartz.dart';
import '../../../../core/basics/parameters/auth_parameters.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repository/base_auth_repository.dart';
import '../data_source/auth_data_source.dart';

class AuthRepository extends BaseAuthRepository{
  BaseAuthDataSource baseAuthDataSource;
  AuthRepository(this.baseAuthDataSource);

  @override
  Future<Either<Failure, LoginEntity>> login(AuthParameters parameters) async{
    try {
      final result =  await baseAuthDataSource.login(parameters);
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
  Future<Either<Failure, RegisterEntity>> register(AuthParameters parameters) async{
    try {
      final result =  await baseAuthDataSource.register(parameters);
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