import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/cubit.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/modules/DioComponents/SingleItemDio.dart';

Widget buildPhoneItems(List list) {
  return BlocConsumer<AppCubit, States>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) => Scaffold(
            body: Column(children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    color: Color.fromARGB(13, 7, 0, 0),
                    child: list.isNotEmpty
                        ? GridView.count(
                            //by default 1/1 : width/height --3shan at7km fe tool l item
                            childAspectRatio: 1 / 1.67,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: List.generate(list.length,
                                (index) => PhoneItem(list[index], context)),
                          )
                        : null,
                  ),
                ),
              ),
            ]),
          ));
}

Widget PhoneItem(products, context) {
  return ConditionalBuilder(
    condition: products["category_id"] == 5,
    builder: (context) => Center(
        child: Container(
            child: ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleItem(product_id: products['id'])));
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          products["avatar"] != null
              ? Image(
                  image: NetworkImage(products['avatar']),
                  width: double.infinity,
                  height: 200,
                )
              : Image(
                  image: NetworkImage(
                      'https://th.bing.com/th/id/R.5c2cd59a45fc00aa3d5de63eb949ebe9?rik=brY%2bR0aEUse1rw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_526949.png&ehk=Rt58Ja72hUDm3%2ftogOfh%2fvJstFcuZCV39CyQJj53Lb4%3d&risl=&pid=ImgRaw&r=0'),
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              products['title'] != null
                  ? Text(
                      products['title'],
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : Text(
                      "No Title",
                      style: TextStyle(fontSize: 17),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
              products['description'] != null
                  ? Text(
                      products['description'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Color.fromARGB(154, 0, 0, 0)),
                    )
                  : Text(
                      "No Description",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromARGB(154, 0, 0, 0)),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
              Row(children: [
                "${products['price']}" != null
                    ? Text(
                        "${products['price']}",
                        style: TextStyle(fontSize: 17, color: Colors.blue),
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
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                    color: Colors.red)
              ]),
            ]),
          ),
        ],
      ),
    ))),
    fallback: null,
  );
}
