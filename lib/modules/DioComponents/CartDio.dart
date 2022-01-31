import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/modules/Components/cart.dart';

class CartDio extends StatelessWidget {
  const CartDio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getProducts(),
        child: BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              var Cart = AppCubit.get(context).products;
              var cubit = AppCubit.get(context);
              print(cubit.CartItem);

              return ConditionalBuilder(
                  condition: cubit.products != null,
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                  builder: (context) => buildCartItem(Cart));
            }));
  }
}
