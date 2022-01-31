class Product{
  List<ProductModel> products=[];

  Product.fromJson(Map<String,dynamic> json){
    json['products'].forEach((value){
      products.add(ProductModel.fromJson(value));
    });
  }
}

class ProductModel{
  int? id;
  String? name;
  String? title;
  String? description;
  int? price;
  int? discount;
  String? discountType;
  int? inStock;
  String? image;
  String? priceFinalText;

  ProductModel.fromJson(Map<String,dynamic> json){
    id= json['id'];
    name = json['name'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    discountType = json['discount_type'];
    inStock = json['in_stock'];
    image = json['avatar'];
    priceFinalText = json['price_final_text'];
  }
}