import 'package:bookmarks_wallet/core/components/widgets/custom_button.dart';
import 'package:bookmarks_wallet/core/components/widgets/custom_form_field.dart';
import 'package:bookmarks_wallet/features/home/presentation/logic/add_bookmarks_cubit/add_bookmarks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/basics/models/basic_models.dart';
import '../../../../core/services/service_locator.dart';

class AddBookmarkScreen extends StatelessWidget {
  final int categoryId;
  const AddBookmarkScreen({super.key,required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final myHeight = MediaQuery.sizeOf(context).height;
    final myWidth = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => sl<AddBookmarksCubit>(),
      child: BlocBuilder<AddBookmarksCubit, AddBookmarksState>(
        builder: (context, state) {
          final cubit = AddBookmarksCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Add New Bookmark'),
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bookmark Details",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: myHeight * 0.05,
                  ),
                  CustomFormField(
                    customFieldType: CustomFieldType.custom,
                    label: 'Bookmark Title',
                    myStyle: Theme.of(context).textTheme.bodyMedium,
                    onChange: (dynamic value) {
                      cubit.bookmarkData.addAll({"title": value});
                    },
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                  CustomFormField(
                    customFieldType: CustomFieldType.custom,
                    label: 'Bookmark Description',
                    myStyle: Theme.of(context).textTheme.bodyMedium,
                    onChange: (dynamic value) {
                      cubit.bookmarkData.addAll({"body": value});
                    },
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                  CustomFormField(
                    customFieldType: CustomFieldType.custom,
                    label: 'Bookmark Url',
                    myStyle: Theme.of(context).textTheme.bodyMedium,
                    onChange: (dynamic value) {
                      cubit.bookmarkData.addAll({"url": value});
                    },
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                        decoration:
                            const InputDecoration(label: Text('Priority')),
                        hint: const Text("Priority Level"),
                        items: priorityModel
                            .map<DropdownMenuItem>((currentStatus) {
                          return DropdownMenuItem(
                            value: currentStatus['value'],
                            child: Text(currentStatus['name'].toString()),
                          );
                        }).toList(),
                        onChanged: (dynamic value) {
                          cubit.bookmarkData.addAll({"piriority": value});
                        }),
                  ),
                  SizedBox(
                    height: myHeight * 0.04,
                  ),
                  CustomButton(
                      onPressed: () {
                        cubit.addBookmark(context: context,categoryId: categoryId);
                      },
                      widget: const Text('Add Bookmark'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
