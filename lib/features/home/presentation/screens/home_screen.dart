import 'package:bookmarks_wallet/core/components/resources/color_manager.dart';
import 'package:bookmarks_wallet/core/components/resources/route_manager.dart';
import 'package:bookmarks_wallet/features/home/domain/entities/categories_entity.dart';
import 'package:bookmarks_wallet/features/home/presentation/logic/home_cubit/home_cubit.dart';
import 'package:bookmarks_wallet/features/home/presentation/widgets/categories_card_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          final List<CategoriesEntity> categoriesEntity = cubit.categories;
          return Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => CategoriesCardBuilder(
                            categoriesEntity: categoriesEntity[index]),
                        separatorBuilder: (context, index) => SizedBox(
                              height: myHeight * 0.01,
                            ),
                        itemCount: categoriesEntity.length),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.addCategoryRoute);
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
