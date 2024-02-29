import 'package:bookmarks_wallet/core/basics/parameters/map_parameters.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components.dart';
import '../../../../../core/components/resources/route_manager.dart';
import '../../../domain/use_case/add_bookmarks_use_case.dart';

part 'add_bookmarks_state.dart';

class AddBookmarksCubit extends Cubit<AddBookmarksState> {
  AddBookmarksUseCase addBookmarksUseCase;
  AddBookmarksCubit(this.addBookmarksUseCase) : super(AddBookmarksInitial());

  static AddBookmarksCubit get(context) => BlocProvider.of(context);

  Map<String,dynamic> bookmarkData = {};

  void addBookmark({required BuildContext context,required int categoryId}) async{
    emit(AddBookmarksInitial());
    bookmarkData.addAll({"category_id":categoryId});
    MapParameters mapParameters = MapParameters(params: bookmarkData);
    final result = await addBookmarksUseCase(mapParameters);
    result.fold((l) => showToast(text: l.message, type: ToastTypes.ERROR), (r) {
     showToast(text: r.message, type: ToastTypes.SUCCESS);
     Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute,(route) => false,);
     emit(AddBookmarksSuccess());
    });

  }

}
