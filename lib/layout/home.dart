import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
              AppCubit cubit = BlocProvider.of(context);
              return ConditionalBuilder(
                  condition: cubit.products != null,
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                  builder: (context) => Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.white,
                          title: Center(
                              child: Text(
                            "Shop App",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        body: cubit.Screens[cubit.Index],
                        bottomNavigationBar: BottomNavigationBar(
                          selectedItemColor: Colors.blue,
                          unselectedItemColor: Colors.grey,
                          currentIndex: AppCubit.get(context).Index,
                          onTap: (index) =>
                              AppCubit.get(context).changeIndex(index),
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(Icons.home), label: 'Home'),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.category),
                                label: 'Categories'),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.shopping_cart), label: 'Cart'),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.menu), label: 'Menu'),
                          ],
                        ),
                      ));
            }));
  }
}
