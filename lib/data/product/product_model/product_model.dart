class DataModel {
  String? category_id;
  String? created_at;
  String? id;
  String? image;
  String? name;
  String? price;
  String? status;
  String? updated_at;

  DataModel(
      {
      this.category_id,
      this.name,
      this.id,
      this.image,
      this.created_at,
      this.price,
      this.status,
      this.updated_at});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
      category_id: json["category_id"],
      name: json["name"],
      id: json["id"],
      image: json["image"],
      created_at: json["created_at"],
      price: json["price"],
      status: json["status"],
      updated_at: json["updated_at"]);
}

class ProductModel {
  List<DataModel>? data;
  String? message;
  bool? status;

  ProductModel({this.status,this.data,this.message});
  factory ProductModel.fromJson(Map<String,dynamic>json)
  {
    List<DataModel>mData=[];
    for(Map<String,dynamic> eachData in json["data"]){
      mData.add(DataModel.fromJson(eachData));
    }
    return ProductModel(
      status:json["status"],
      message: json["message"],
      data: mData
    );
  }
}
