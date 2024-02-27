import 'package:dartz/dartz.dart';

import '../../../../core/basics/base_use_case.dart';
import '../../../../core/basics/parameters/auth_parameters.dart';
import '../../../../core/error/failure.dart';
import '../entities/login_entity.dart';
import '../repository/base_auth_repository.dart';

class LoginUseCase extends BaseUseCase<LoginEntity,AuthParameters>{
  BaseAuthRepository baseAuthRepository;
  LoginUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(AuthParameters parameters) async{
    return await baseAuthRepository.login(parameters);
  }

}