
import 'package:bookmarks_wallet/core/basics/parameters/map_parameters.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components.dart';
import '../../../../../core/components/resources/route_manager.dart';
import '../../../domain/use_case/add_category_use_case.dart';

part 'add_categories_state.dart';

class AddCategoriesCubit extends Cubit<AddCategoriesState> {
  AddCategoryUseCase addCategoryUseCase;

  AddCategoriesCubit(this.addCategoryUseCase) : super(AddCategoriesInitial());

  static AddCategoriesCubit get(context) => BlocProvider.of(context);


  bool isCheckBox = false;
  void changeCheckBox(){
    if(isCheckBox){
      isCheckBox = false;
      categoryData.addAll({"is_public":isCheckBox});
      emit(AddCategoriesFalseCheckBox());
    }else {
      isCheckBox = true;
      categoryData.addAll({"is_public":isCheckBox});
      emit(AddCategoriesTrueCheckBox());
    }
  }

  Map<String, dynamic> categoryData = {};

  void addCategory({required BuildContext context}) async {
    emit(AddCategoriesInitial());
    MapParameters myMap = MapParameters(params: categoryData);
    final result = await addCategoryUseCase(myMap);
    result.fold(
        (l) => showToast(text: l.message, type: ToastTypes.ERROR), (r) {
          showToast(text: r.message, type: ToastTypes.SUCCESS);
          Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute,(route) => false,);
          emit(AddCategoriesSuccess());
    });
  }
}
