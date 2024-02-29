import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components.dart';
import '../../../domain/entities/bookmarks_entity.dart';
import '../../../domain/use_case/get_all_bookmarks_use_case.dart';

part 'bookmarks_state.dart';

class BookmarksCubit extends Cubit<BookmarksState> {
  GetAllBookmarksUseCase getAllBookmarksUseCase;
  BookmarksCubit(this.getAllBookmarksUseCase) : super(BookmarksInitial());


  static BookmarksCubit get(context) => BlocProvider.of(context);

  List<BookmarksEntity> bookmarks = [
    const BookmarksEntity(
        id: 1,
        url: 'url',
        body: 'body',
        title: 'title',
        createdAt: 'created at',
        priority: 'Average'),
    const BookmarksEntity(
        id: 1,
        url: 'url',
        body: 'body',
        title: 'title',
        createdAt: 'created at',
        priority: 'Average'),
    const BookmarksEntity(
        id: 1,
        url: 'url',
        body: 'body',
        title: 'title',
        createdAt: 'created at',
        priority: 'Average'),
    const BookmarksEntity(
        id: 1,
        url: 'url',
        body: 'body',
        title: 'title',
        createdAt: 'created at',
        priority: 'Average'),
    const BookmarksEntity(
        id: 1,
        url: 'url',
        body: 'body',
        title: 'title',
        createdAt: 'created at',
        priority: 'Average'),
  ];
  void getAllBookmarks({required int categoryId}) async{
    emit(BookmarksInitial());
    final result = await getAllBookmarksUseCase(categoryId);
    result.fold((l) => showToast(type: ToastTypes.ERROR, text: l.message), (r) {
      bookmarks = r;
      emit(BookmarksFetchSuccess());
    });
  }

}
