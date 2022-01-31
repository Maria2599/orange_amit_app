import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/models/productModel.dart';
import 'package:graduation_project/modules/Components/components.dart';

class CartDio extends StatelessWidget {
  const CartDio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getProducts(),
        child: BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              Product? Products = AppCubit.get(context).productModel;

              var cubit = AppCubit.get(context);
              print(cubit.CartItem);

              return ConditionalBuilder(
                  condition: Products != null,
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                  builder: (context) =>Column(children: <Widget>[
                    Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          //haid5ol 3la List task w ymsk l index l 2ola 0 w ba3d kda 1
                          itemBuilder: (context, index) => CartItem(Products!.products[index], context),
                          separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 0,
                            color: Colors.grey,
                          ),
                          itemCount: Products!.products.length),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "   Clear Cart   ",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Color.fromARGB(210, 255, 255, 255)),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            " Go to CheckOut ",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Color.fromARGB(158, 5, 92, 92)),
                          ),
                        ),
                      ]),
                    ),
                  ]));
            }));
  }
}
