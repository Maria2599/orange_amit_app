import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/models/dio.dart';
import 'package:graduation_project/modules/DioComponents/CartDio.dart';
import 'package:graduation_project/modules/DioComponents/categoriesDio.dart';
import 'package:graduation_project/modules/Components/menu.dart';
import 'package:graduation_project/modules/DioComponents/productsDio.dart';

class AppCubit extends Cubit<States> {
  AppCubit() : super(appInitStates());

  static AppCubit get(context) => BlocProvider.of(context);

  //for screens
  int Index = 0;
  List<Widget> Screens = [ProductsDio(), CategoriesDio(), CartDio(), Menu()];

  void changeIndex(int index) {
    Index = index;
    emit(changeIndexNow());
  }

  int count = 1;
  //+ and -
  void add({required product_id}) {
    count = count + 1;
    emit(addState(counter: count));
  }

  void minus({required product_id}) {
    count--;
    emit(minusState(counter: count));
  }

  //for dio
  List products = [];
  List categories = [];

  void getProducts() {
    DioHelper.getData(url: 'products')
        .then((value) => {
              products = value.data['products'],
              //print(products),
              emit(getProductsState()),
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  Map<String, dynamic> product_details = {};

  void getDetailedItem({required product_id}) {
    emit(GetProductDetailsDataLoadingState());
    DioHelper.getData(url: 'products/$product_id')
        .then((value) => {
              product_details = value.data['product'],
              print(product_details.toString()),
              emit(getDetailedState(product_id1: product_id)),
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  void getCategories() {
    categories = [];
    DioHelper.getData(url: 'categories')
        .then((value) => {
              categories = value.data['categories'],
              //   print(categories),
              emit(getCategoriesState())
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  List CartItem = [];

  void addToCart() {
    for (dynamic item in products) {
      CartItem.add(item);
    }
    print(CartItem);
    emit(CartItemState());
  }

// Map<String, dynamic> category_details = {};
// void getCategoryId({required category_id}) {
//
//   DioHelper.getData(url: 'categories/$category_id')
//       .then((value) => {
//     category_details = value.data['category'],
//     print(category_details['id']),
//     emit(getCategoryIdState(category_id1: category_id )),
//   })
//       .catchError((onError) {
//     print(onError.toString());
//   });
// }

}
