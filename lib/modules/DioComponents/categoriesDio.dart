import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/models/categoriesModel.dart';
import 'package:graduation_project/modules/Components/components.dart';

class CategoriesDio extends StatelessWidget {
  CategoriesDio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getCategories(),
        child: BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              Categories? categories = AppCubit.get(context).categories;

              return ConditionalBuilder(
                  condition: state is! GetCategoryDataLoadingState &&
                      Categories != null,
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                  builder: (context) => Scaffold(
                      body: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          //haid5ol 3la List task w ymsk l index l 2ola 0 w ba3d kda 1
                          itemBuilder: (context, index) => CategoryItem(
                              context,
                              categories!.categories[index].image!,
                              categories.categories[index].name!,
                              categories.categories[index].id),
                          separatorBuilder: (context, index) => Container(
                                width: double.infinity,
                                height: 0,
                                color: Colors.grey,
                              ),
                          itemCount: categories!.categories.length)));
            }));
  }
}
