import 'package:bookmarks_wallet/core/components/resources/color_manager.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/bookmarks_entity.dart';
import 'package:bookmarks_wallet/features/home/presentation/logic/bookmarks_cubit/bookmarks_cubit.dart';
import 'package:bookmarks_wallet/features/home/presentation/screens/add_bookmark_screen.dart';
import 'package:bookmarks_wallet/features/home/presentation/widgets/bookmarks_card_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';

class BookmarksScreen extends StatelessWidget {
  final int categoryId;

  const BookmarksScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => sl<BookmarksCubit>(),
      child: BlocBuilder<BookmarksCubit, BookmarksState>(
        builder: (context, state) {
          final cubit = BookmarksCubit.get(context);
          final List<BookmarksEntity> bookmarks = cubit.bookmarks;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Bookmarks'),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => BookmarksCardBuilder(
                              bookmarksEntity: bookmarks[index]),
                          separatorBuilder: (context, index) => SizedBox(
                                height: myHeight * 0.01,
                              ),
                          itemCount: bookmarks.length))
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddBookmarkScreen(categoryId: categoryId),));
              },
              child: const Icon(
                Icons.add,
                color: ColorManager.mainColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
