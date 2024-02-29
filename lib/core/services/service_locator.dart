import 'package:bookmarks_wallet/features/authentication/domain/use_case/login_use_case.dart';
import 'package:bookmarks_wallet/features/authentication/domain/use_case/register_use_case.dart';
import 'package:bookmarks_wallet/features/authentication/presentation/logic/register_cubit/register_cubit.dart';
import 'package:bookmarks_wallet/features/home/data/data_source/home_data_source.dart';
import 'package:bookmarks_wallet/features/home/data/repository/home_repository.dart';
import 'package:bookmarks_wallet/features/home/domain/repository/base_home_repository.dart';
import 'package:bookmarks_wallet/features/home/domain/use_case/add_bookmarks_use_case.dart';
import 'package:bookmarks_wallet/features/home/domain/use_case/add_category_use_case.dart';
import 'package:bookmarks_wallet/features/home/domain/use_case/get_all_bookmarks_use_case.dart';
import 'package:bookmarks_wallet/features/home/domain/use_case/get_all_categories_use_case.dart';
import 'package:bookmarks_wallet/features/home/presentation/logic/add_categories_cubit/add_categories_cubit.dart';
import 'package:bookmarks_wallet/features/home/presentation/logic/bookmarks_cubit/bookmarks_cubit.dart';
import 'package:bookmarks_wallet/features/home/presentation/logic/home_cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/authentication/data/data_source/auth_data_source.dart';
import '../../features/authentication/data/repository/auth_repository.dart';
import '../../features/authentication/domain/repository/base_auth_repository.dart';
import '../../features/authentication/presentation/logic/login_cubit/login_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init(){


      // CUBITS

    sl.registerFactory(() => LoginCubit(sl()));
    sl.registerFactory(() => RegisterCubit(sl()));
    sl.registerFactory(() => HomeCubit(sl()));
    sl.registerFactory(() => AddCategoriesCubit(sl()));
    sl.registerFactory(() => BookmarksCubit(sl()));








    // USE CASES
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton(() => GetAllCategoriesUseCase(sl()));
    sl.registerLazySingleton(() => AddCategoryUseCase(sl()));
    sl.registerLazySingleton(() => AddBookmarksUseCase(sl()));
    sl.registerLazySingleton(() => GetAllBookmarksUseCase(sl()));







    // REPOSITORY
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));




    // DATA SOURCE
    sl.registerLazySingleton<BaseAuthDataSource>(() => AuthDataSource());
    sl.registerLazySingleton<BaseHomeDataSource>(() => HomeDataSource());

  }
}