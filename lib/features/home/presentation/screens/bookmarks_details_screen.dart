import 'package:bookmarks_wallet/core/components/resources/color_manager.dart';
import 'package:bookmarks_wallet/core/components/resources/font_manager.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/bookmarks_entity.dart';
import 'package:flutter/material.dart';

class BookmarksDetailsScreen extends StatelessWidget {
  final BookmarksEntity bookmarksEntity;

  const BookmarksDetailsScreen({super.key, required this.bookmarksEntity});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(bookmarksEntity.title),
        elevation: 0,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: myWidth * 0.05, vertical: myHeight * 0.02),

        child: Card(
          elevation: 8,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: SizedBox(
            width: myWidth,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: myWidth*0.05,vertical: myHeight*0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeightManager.medium,color: ColorManager.secondaryColor),
                      children: [
                        TextSpan(
                            text: 'URL: ',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 19)
                        ),
                        TextSpan(
                            text: bookmarksEntity.url
                        )
                      ]
                  )),
                  SizedBox(height: myHeight*0.02,),
                  RichText(text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeightManager.medium,color: ColorManager.secondaryColor),
                    children: [
                      TextSpan(
                        text: 'Description: ',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 19)
                      ),
                      TextSpan(
                        text: bookmarksEntity.body
                      )
                    ]
                  )),

                  SizedBox(height: myHeight*0.02,),
                  RichText(text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeightManager.medium,color: ColorManager.secondaryColor),
                      children: [
                        TextSpan(
                            text: 'Created At: ',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 19)
                        ),
                        TextSpan(
                            text: bookmarksEntity.createdAt,
                        )
                      ]
                  )),
                  SizedBox(height: myHeight*0.02,),
                  RichText(text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeightManager.medium,color: ColorManager.secondaryColor),
                      children: [
                        TextSpan(
                            text: 'Priority: ',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorManager.cautionColor,fontSize: 19)
                        ),
                        TextSpan(
                          text: bookmarksEntity.priority,
                        )
                      ]
                  )),
                  SizedBox(height: myHeight*0.02,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
