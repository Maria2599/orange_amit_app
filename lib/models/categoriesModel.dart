class Categories{
  List <CategoriesModel> categories=[];
  Categories.fromJson(Map<String,dynamic> json){
    json['categories'].forEach((value){
      categories.add(CategoriesModel.fromJson(value));
    });
  }
}

class CategoriesModel{
  int? id;
  String? name;
  String? image;

  CategoriesModel.fromJson(Map<String ,dynamic> json){
    id=json['id'];
    name= json['name'];
    image= json['avatar'];


  }
}