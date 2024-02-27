import 'package:dartz/dartz.dart';
import '../../../../core/basics/base_use_case.dart';
import '../../../../core/basics/parameters/auth_parameters.dart';
import '../../../../core/error/failure.dart';
import '../entities/register_entity.dart';
import '../repository/base_auth_repository.dart';

class RegisterUseCase extends BaseUseCase<RegisterEntity,AuthParameters>{
  BaseAuthRepository baseAuthRepository;
  RegisterUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, RegisterEntity>> call(AuthParameters parameters) async{
    return await baseAuthRepository.register(parameters);
  }

}