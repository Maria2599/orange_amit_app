import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/modules/DioComponents/FashionDio.dart';
import 'package:graduation_project/modules/DioComponents/babyProductsDio.dart';
import 'package:graduation_project/modules/DioComponents/electronicsDio.dart';
import 'package:graduation_project/modules/DioComponents/healthAndBeautyDio.dart';
import 'package:graduation_project/modules/DioComponents/phonesDio.dart';
import 'package:graduation_project/modules/DioComponents/superMarketDio.dart';

Widget buildCategoryItems(List list) {
  return Scaffold(
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          //haid5ol 3la List task w ymsk l index l 2ola 0 w ba3d kda 1
          itemBuilder: (context, index) => CategoryItem(list[index], context),
          separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 0,
                color: Colors.grey,
              ),
          itemCount: list.length));
}

Widget CategoryItem(categories, context) => BlocConsumer<AppCubit, States>(
    listener: (BuildContext context, state) {},
    builder: (BuildContext context, Object? state) {
      AppCubit cubit = BlocProvider.of(context);
      return ConditionalBuilder(
          condition: cubit.categories != null,
          fallback: (context) => Center(child: CircularProgressIndicator()),
          builder: (context) => ElevatedButton(
                onPressed: () {
                  if (categories['id'] == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FashioDio()));
                  } else if (categories['id'] == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ElectronicsDio()));
                  } else if (categories['id'] == 3) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BabyDio()));
                  } else if (categories['id'] == 4) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BeautyDio()));
                  } else if (categories['id'] == 5) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PhoneDio()));
                  } else if (categories['id'] == 6) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuperMarketDio()));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 150,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        ////to make image circular
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: Image(
                            image: NetworkImage(categories["avatar"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.transparent
                                ])),
                      ),
                      Center(
                        child: Text(categories["name"],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ));
    });
