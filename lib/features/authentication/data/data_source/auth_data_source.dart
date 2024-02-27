import 'dart:convert';

import 'package:bookmarks_wallet/features/authentication/domain/entities/login_entity.dart';
import 'package:bookmarks_wallet/features/authentication/domain/entities/register_entity.dart';
import 'package:dio/dio.dart';

import '../../../../core/basics/parameters/auth_parameters.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network_strings.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';

abstract class BaseAuthDataSource {
  Future<LoginEntity> login(AuthParameters parameters);
  Future<RegisterEntity> register(AuthParameters parameters);
}


class AuthDataSource extends BaseAuthDataSource{
  @override
  Future<LoginModel> login(parameters) async{
    var loginParam = jsonEncode(parameters.authData);
    try {
      final response = await Dio().post(
        NetworkStrings.loginPath,
        data: loginParam,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
      } else {
        throw ServerException(
            errorMessageModel:
            ErrorMessageModel.fromJson(const {'name': 'Server Error'}));
      }
    }
    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(const {'name': 'Error'}));
  }

  @override
  Future<RegisterModel> register(parameters) async{
    var registerParams = jsonEncode(parameters.authData);
    try {
      final response = await Dio().post(
        NetworkStrings.registerPath,
        data: registerParams,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
      } else {
        throw ServerException(
            errorMessageModel:
            ErrorMessageModel.fromJson(const {'name': 'Server Error'}));
      }
    }
    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(const {'name': 'Error'}));
  }

}