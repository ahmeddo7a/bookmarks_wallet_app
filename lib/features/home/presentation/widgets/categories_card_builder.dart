import 'package:bookmarks_wallet/core/components/resources/font_manager.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/categories_entity.dart';
import 'package:bookmarks_wallet/features/home/presentation/screens/bookmarks_screen.dart';
import 'package:flutter/material.dart';

class CategoriesCardBuilder extends StatelessWidget {
  final CategoriesEntity categoriesEntity;
  const CategoriesCardBuilder({super.key,required this.categoriesEntity});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookmarksScreen(categoryId: categoriesEntity.id),));
      },
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(categoriesEntity.title,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeightManager.semiBold),),
                SizedBox(
                  height: myHeight*0.015,
                ),
                Padding(
                  padding: EdgeInsets.only(left: myWidth*0.02),
                  child: Text(categoriesEntity.description, style: Theme.of(context).textTheme.bodySmall,),
                )
              ],
            ),
        ),
      ),
    );
  }
}
