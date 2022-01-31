import 'package:graduation_project/models/productModel.dart';

abstract class States {}

class appInitStates extends States {}

class changeIndexNow extends States {}

class getProductsState extends States {
  final Product productModel;
  getProductsState(this.productModel);
}

class GetProductDataLoadingState extends States{}

class GetCategoryDataLoadingState extends States{}

class GetProductDetailsDataLoadingState extends States{}

class getCategoriesState extends States {}

class getDetailedState extends States {
  int product_id1;

  getDetailedState({required this.product_id1});
}

class getCategoryIdState extends States {
  int category_id1;

  getCategoryIdState({required this.category_id1});
}

class addState extends States {
  int counter;

  addState({required this.counter});
}

class minusState extends States {
  int counter;

  minusState({required this.counter});
}

class CartItemState extends States {}
