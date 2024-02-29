import 'package:bookmarks_wallet/core/basics/base_use_case.dart';
import 'package:bookmarks_wallet/core/components.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/categories_entity.dart';
import '../../../domain/use_case/get_all_categories_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  HomeCubit(this.getAllCategoriesUseCase) : super(HomeInitial());


  static HomeCubit get(context) => BlocProvider.of(context);


  List<CategoriesEntity> categories = [
    const CategoriesEntity(
        id: 0, description: 'For All Python Resources', title: 'Python'),
    const CategoriesEntity(
        id: 1, description: 'For All Java Resources', title: 'Java'),
    const CategoriesEntity(
        id: 2, description: 'For All Flutter Resources', title: 'Flutter'),
    const CategoriesEntity(
        id: 2, description: 'For All PHP Resources', title: 'PHP'),
  ];
  void getAllCategories() async{
      emit(HomeInitial());
      final result = await getAllCategoriesUseCase(const NoParameters());
      result.fold((l) {
        showToast(text: l.message, type: ToastTypes.ERROR);
      }, (r) {
        categories = r;
        emit(HomeGetCategoriesSuccess());
      });
  }

}
