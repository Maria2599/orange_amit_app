import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/cubit/states.dart';
import 'package:graduation_project/models/CategoryProductModel.dart';
import 'package:graduation_project/models/categoriesModel.dart';
import 'package:graduation_project/models/dio.dart';
import 'package:graduation_project/models/productModel.dart';
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
  // List products = [];
  // List categories = [];

  Product? productModel;

  void getProducts() {
    emit(GetProductDataLoadingState());
    DioHelper.getData(url: 'products')
        .then((value) => {
              productModel = Product.fromJson(value.data),
              // products = value.data['products'],
              print(value.data),
              emit(getProductsState(productModel!)),
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  // Map<String, dynamic> product_details = {};
  ProductModel? productModelDetails;

  void getDetailedItem({required product_id}) {
    emit(GetProductDetailsDataLoadingState());
    DioHelper.getData(url: 'products/$product_id')
        .then((value) => {
              // product_details = value.data['product'],
              productModelDetails =
                  ProductModel.fromJson(value.data['product']),
              print(value.data),
              emit(getDetailedState(product_id1: product_id)),
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  Categories? categories;

  void getCategories() {
    emit(GetCategoryDataLoadingState());
    DioHelper.getData(url: 'categories')
        .then((value) => {
              // categories = value.data['categories'],
              categories = Categories.fromJson(value.data),
              print(value.data),
              emit(getCategoriesState())
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

//  Map<String, dynamic> category_details = {};
CategoryProductModel? categoryProductModel;
  void getCategoryId({required category_id}) {
    DioHelper.getData(url: 'categories/$category_id')
        .then((value) => {
              //category_details = value.data['category'],
      categoryProductModel= CategoryProductModel.fromJson(value.data['category']),
      print(value.data),
              emit(getCategoryIdState(category_id1: category_id)),
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  List CartItem = [];

  void addToCart() {
    for (dynamic item in productModel!.products) {
      CartItem.add(item);
    }
    print(CartItem);
    emit(CartItemState());
  }
}
