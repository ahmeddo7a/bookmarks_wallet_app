import 'package:bookmarks_wallet/core/components/resources/color_manager.dart';
import 'package:bookmarks_wallet/core/components/widgets/custom_button.dart';
import 'package:bookmarks_wallet/core/components/widgets/custom_form_field.dart';
import 'package:bookmarks_wallet/features/home/presentation/logic/add_categories_cubit/add_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;

    return BlocProvider(
      create: (context) => sl<AddCategoriesCubit>(),
      child: BlocBuilder<AddCategoriesCubit, AddCategoriesState>(
        builder: (context, state) {
          final cubit = AddCategoriesCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Add Categories",
              ),
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category Details',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: myHeight * 0.05,
                  ),
                  CustomFormField(
                    customFieldType: CustomFieldType.custom,
                    label: 'Category Title',
                    myStyle: Theme.of(context).textTheme.bodyMedium,
                    onChange: (dynamic value) {
                      cubit.categoryData.addAll({'title': value});
                    },
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                  CustomFormField(
                    customFieldType: CustomFieldType.custom,
                    label: 'Short Description',
                    myStyle: Theme.of(context).textTheme.bodyMedium,
                    onChange: (dynamic value) {
                      cubit.categoryData.addAll({'description': value});
                    },
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Public?",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(
                        width: myWidth * 0.02,
                      ),
                      Checkbox(
                        value: cubit.isCheckBox,
                        onChanged: (value) {
                          cubit.changeCheckBox();
                        },
                        checkColor: ColorManager.mainColor,
                        fillColor: MaterialStateProperty.all(Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    height: myHeight * 0.03,
                  ),
                  CustomButton(
                      onPressed: () {
                        cubit.addCategory(context: context);
                      },
                      widget: const Text('Submit'))
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
