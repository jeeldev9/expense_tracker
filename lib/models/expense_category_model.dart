class ExpenseCategoryModel {
  int id;
  String createdAt;
  String categoryName;
  String categoryImage;

  ExpenseCategoryModel({this.id, this.categoryName, this.categoryImage,this.createdAt});

  ExpenseCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt=json['created_at'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    return data;
  }
}