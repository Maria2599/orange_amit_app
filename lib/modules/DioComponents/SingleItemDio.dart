import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/modules/Components/singleItem.dart';

class SingleItem extends StatelessWidget {
  int product_id;

  SingleItem({required this.product_id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            AppCubit()..getDetailedItem(product_id: product_id),
        child: BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              var cubit = AppCubit.get(context);
              return ConditionalBuilder(
                  condition: cubit.product_details != null,
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                  builder: (context) => buildSingleItem(context));
            }));
  }
}
