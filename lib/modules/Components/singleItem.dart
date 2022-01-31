import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';

@override
Widget buildSingleItem(BuildContext context) {
  return BlocConsumer<AppCubit, States>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        AppCubit cubit = BlocProvider.of(context);
        var Products_details = AppCubit.get(context).product_details;
        return Scaffold(
                body: ConditionalBuilder(
              condition:state is! GetProductDetailsDataLoadingState && cubit.product_details != null,
              fallback: null,
              builder: (context) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
////to make image circul
                        ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Products_details["avatar"] != null
                              ? Image(
                                  image:
                                      NetworkImage(Products_details["avatar"]),
                                  fit: BoxFit.cover,
                                )
                              : Image(
                                  image: NetworkImage(
                                      'https://th.bing.com/th/id/R.5c2cd59a45fc00aa3d5de63eb949ebe9?rik=brY%2bR0aEUse1rw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_526949.png&ehk=Rt58Ja72hUDm3%2ftogOfh%2fvJstFcuZCV39CyQJj53Lb4%3d&risl=&pid=ImgRaw&r=0'),
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Products_details["title"] != null
                            ? Text(Products_details["title"],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(42, 42, 101, 1.0)))
                            : Text(
                                "No Title",
                                style: TextStyle(fontSize: 15),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                        Products_details["name"] != null
                            ? Text(Products_details["name"],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 21, color: Colors.black))
                            : Text(
                                "No Name",
                                style: TextStyle(fontSize: 15),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            "${Products_details['price']}" != null
                                ? Text(
                                    "${Products_details['price'] * cubit.count}",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : Text(
                                    "No Price",
                                    style: TextStyle(fontSize: 17),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                cubit.add(product_id: Products_details['id']);
                                print(cubit.count);
                              },
                              icon: Icon(Icons.add),
                              color: Colors.black,
                            ),
                            Text("${cubit.count}",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                            IconButton(
                              onPressed: () {
                                cubit.minus(product_id: Products_details['id']);

                                if (cubit.count <= 0) {
                                  cubit.count = 0;
                                }
                              },
                              icon: Icon(Icons.remove),
                              color: Colors.black,
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Products_details["description"] != null
                            ? Text(Products_details["description"],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 49, 49, 102)))
                            : Text(
                                "No Description",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 49, 49, 102)),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                        Spacer(),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              " Go to CheckOut ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(
                                      49, 49, 173, 0.788235294117647)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),));
      });
}
