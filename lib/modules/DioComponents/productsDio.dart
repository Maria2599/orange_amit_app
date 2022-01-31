import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/modules/Components/components.dart';

class ProductsDio extends StatelessWidget {
  const ProductsDio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getProducts(),
        child: BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              Product? Products = AppCubit.get(context).productModel;
              var cubit = AppCubit.get(context);
              return ConditionalBuilder(
                  condition: state is! GetProductDataLoadingState && Products != null,
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                  builder: (context) => Column(children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          color: Color.fromARGB(13, 7, 0, 0),
                          child: GridView.count(
                            //by default 1/1 : width/height --3shan at7km fe tool l item
                            childAspectRatio: 1 / 1.67,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 2,
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: List.generate(Products!.products.length,
                                    (index) => ProductItem(Products.products[index], context)),
                          ),
                        ),
                      ),
                    ),
                  ]),
              );
            }));
  }
}
