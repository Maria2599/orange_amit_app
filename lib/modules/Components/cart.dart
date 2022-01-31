import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/modules/DioComponents/SingleItemDio.dart';

@override
Widget buildCartItem(List list) {
  return Column(children: <Widget>[
    Expanded(
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          //haid5ol 3la List task w ymsk l index l 2ola 0 w ba3d kda 1
          itemBuilder: (context, index) => CartItem(list[index], context),
          separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 0,
                color: Colors.grey,
              ),
          itemCount: list.length),
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
  ]);
}

Widget CartItem(products, context) {
  return BlocConsumer<AppCubit, States>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        AppCubit cubit = BlocProvider.of(context);
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ////to make image circular
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: products["avatar"] != null
                    ? Image(
                        image: NetworkImage(
                          products['avatar'],
                        ),
                        width: 100,
                        height: 100,
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
                width: 10,
              ),

              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SingleItem(product_id: products['id'])));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        products['title'] != null
                            ? Text(
                                products['title'],
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            : Text(
                                "No Title",
                                style: TextStyle(fontSize: 17),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        products['description'] != null
                            ? Text(
                                products['description'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color.fromARGB(154, 0, 0, 0)),
                              )
                            : Text(
                                "No Description",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                        Row(children: [
                          "${products['price']}" != null
                              ? Text(
                                  "${products['price'] * cubit.count}",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.blue),
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
                              cubit.add(product_id: products['id']);
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
                              cubit.minus(product_id: products['id']);
                              if (cubit.count <= 0) {
                                cubit.count = 0;
                              }
                            },
                            icon: Icon(Icons.remove),
                            color: Colors.black,
                          ),
                        ]),
                      ]),
                ),
              )
            ]),
          ),
        );
      });
}
