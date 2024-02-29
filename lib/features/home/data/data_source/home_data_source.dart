import 'dart:convert';
import 'dart:io';

import 'package:bookmarks_wallet/core/basics/parameters/map_parameters.dart';
import 'package:bookmarks_wallet/features/home/data/models/bookmarks_model.dart';
import 'package:bookmarks_wallet/features/home/data/models/categories_model.dart';
import 'package:bookmarks_wallet/features/home/data/models/success_model.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/bookmarks_entity.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/categories_entity.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/error_model.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network_strings.dart';
import '../../../../core/services/cache_helper.dart';
import '../../domain/entities/success_entity.dart';

abstract class BaseHomeDataSource {
  Future<List<CategoriesEntity>> getCategories();
  Future<SuccessEntity> addCategories(MapParameters parameters);
  Future<SuccessEntity> addBookmarks(MapParameters parameters);
  Future<List<BookmarksEntity>> getBookmarks(int parameters);


}


class HomeDataSource extends BaseHomeDataSource{
  final String? token = CacheHelper.getData(key: 'access_token');

  @override
  Future<SuccessEntity> addCategories(MapParameters parameters) async{
    try {
      Map<String,dynamic> finalResponse = parameters.params;
      var homeWorkData = jsonEncode(finalResponse);
      final response = await Dio()
          .post(NetworkStrings.categoriesPath,
          data: homeWorkData,options: Options(headers: {HttpHeaders.authorizationHeader:token}));
      if (response.statusCode == 201) {
        return SuccessModel.fromJson(response.data);
      }
    }
    on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerException(
            simpleErrorMessage: SimpleErrorMessage.fromJson(e.response!.data));
      } else {
        throw ServerException(
            errorMessageModel:
            ErrorMessageModel.fromJson(const {'name': 'Server Error'}));
      }
    }
    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(const {'name': 'null'}));
  }

  @override
  Future<List<CategoriesEntity>> getCategories() async{
    try {
      final response = await Dio().get(
          NetworkStrings.categoriesPath,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: token}
          )
      );
      if (response.statusCode == 200) {
        return List<CategoriesModel>.from(
            (response.data['data'] as List)
                .map((e) => CategoriesModel.fromJson(e)));
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
  Future<SuccessEntity> addBookmarks(MapParameters parameters) async{
    try {
      Map<String,dynamic> finalResponse = parameters.params;
      var homeWorkData = jsonEncode(finalResponse);
      final response = await Dio()
          .post(NetworkStrings.bookmarksPath,
          data: homeWorkData,options: Options(headers: {HttpHeaders.authorizationHeader:token}));
      if (response.statusCode == 201) {
        return SuccessModel.fromJson(response.data);
      }
    }
    on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerException(
            simpleErrorMessage: SimpleErrorMessage.fromJson(e.response!.data));
      } else {
        throw ServerException(
            errorMessageModel:
            ErrorMessageModel.fromJson(const {'name': 'Server Error'}));
      }
    }
    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(const {'name': 'null'}));
  }

  @override
  Future<List<BookmarksEntity>> getBookmarks(int parameters) async{
    try {
      final response = await Dio().get(
          NetworkStrings.bookmarksPath,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: token}
          ),
        queryParameters: {"category_id":parameters}
      );
      if (response.statusCode == 200) {
        return List<BookmarksModel>.from(
            (response.data['data'] as List)
                .map((e) => BookmarksModel.fromJson(e)));
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