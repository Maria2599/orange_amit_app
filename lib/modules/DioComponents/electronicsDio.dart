import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/Components/electronics.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';

class ElectronicsDio extends StatelessWidget {
  const ElectronicsDio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getProducts(),
        child: BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              var Products = AppCubit.get(context).products;
              var cubit = AppCubit.get(context);

              return ConditionalBuilder(
                  condition: cubit.products != null,
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                  builder: (context) => buildElectronicsItems(Products));
            }));
  }
}
