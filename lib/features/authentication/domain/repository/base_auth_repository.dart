import 'package:bookmarks_wallet/features/authentication/domain/entities/register_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/basics/parameters/auth_parameters.dart';
import '../../../../core/error/failure.dart';
import '../entities/login_entity.dart';

abstract class BaseAuthRepository {

  Future<Either<Failure,LoginEntity>> login(AuthParameters parameters);
  Future<Either<Failure,RegisterEntity>> register(AuthParameters parameters);

}