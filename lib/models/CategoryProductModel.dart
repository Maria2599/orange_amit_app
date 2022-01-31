import 'package:graduation_project/models/productModel.dart';

class CategoryProductModel{
  int? id;
  String? name;
  String? image;
  
  List<ProductModel> products=[];
  
  CategoryProductModel.fromJson(Map<String,dynamic> json){
    id= json['id'];
    name=json['name'];
    image= json['avatar'];
    
    json['products'].forEach((value){
      products.add(ProductModel.fromJson(value));
    });
  }
  
}