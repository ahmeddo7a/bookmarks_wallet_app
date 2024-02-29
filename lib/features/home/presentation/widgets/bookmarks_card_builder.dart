import 'package:bookmarks_wallet/core/components/resources/color_manager.dart';
import 'package:bookmarks_wallet/core/components/resources/font_manager.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/bookmarks_entity.dart';
import 'package:bookmarks_wallet/features/home/presentation/screens/bookmarks_details_screen.dart';
import 'package:flutter/material.dart';

class BookmarksCardBuilder extends StatelessWidget {
  final BookmarksEntity bookmarksEntity;

  const BookmarksCardBuilder({super.key, required this.bookmarksEntity});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookmarksDetailsScreen(bookmarksEntity: bookmarksEntity),));
      },
      child: Card(
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookmarksEntity.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
                    ),
                    SizedBox(
                      height: myHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: myWidth * 0.02),
                      child: Text(
                        bookmarksEntity.body,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.circle,color: (bookmarksEntity.priority.toLowerCase() == 'vip')?Colors.red : (bookmarksEntity.priority.toLowerCase() =='average')? Colors.amber:ColorManager.mainColor,),
                    SizedBox(width: myWidth*0.02,),
                    Text(bookmarksEntity.priority,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeightManager.medium),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
