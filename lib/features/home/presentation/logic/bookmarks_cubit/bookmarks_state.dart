part of 'bookmarks_cubit.dart';

abstract class BookmarksState extends Equatable {
  const BookmarksState();
}

class BookmarksInitial extends BookmarksState {
  @override
  List<Object> get props => [];
}

class BookmarksFetchSuccess extends BookmarksState {
  @override
  List<Object> get props => [];
}
