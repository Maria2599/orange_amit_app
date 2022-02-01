import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/CategoryProductModel.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/modules/Components/components.dart';

class CategoryProduct extends StatelessWidget {
  final int category_id;

  CategoryProduct({required this.category_id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            AppCubit()..getCategoryId(category_id: category_id),
        child: BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              CategoryProductModel? categoryProduct =
                  AppCubit.get(context).categoryProductModel;

              return ConditionalBuilder(
                  condition: categoryProduct != null,
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                  builder: (context) => Scaffold(
                        body: Column(children: [
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Container(
                                color: Color.fromARGB(13, 7, 0, 0),
                                child: GridView.count(
                                  //by default 1/1 : width/height --3shan at7km fe tool l item
                                  childAspectRatio: 1 / 1.67,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 1,
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: List.generate(
                                      categoryProduct!.products.length,
                                      (index) => ProductItem(
                                          categoryProduct.products[index],
                                          context)),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ));
            }));
  }
}
