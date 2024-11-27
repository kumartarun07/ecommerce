class DataModel{
  String? created_at;
  String? id;
  String? name;
  String? status;
  String? updated_at;

  DataModel({this.status,this.updated_at,this.created_at,this.id,this.name,});

  factory DataModel.fromJson(Map<String,dynamic>json)=>
      DataModel(
        id: json["id"],
        created_at: json["created_at"],
        name: json["name"],
        status: json["status"],
        updated_at: json["updated_at"],
      );
}


class CategoryModel{
  List<DataModel>?data;
  String? message;
  bool? status;
  CategoryModel({this.status,this.data,this.message});

  factory CategoryModel.fromJson(Map<String,dynamic>json){
    List<DataModel>mData=[];
    for(Map<String,dynamic>eachData in json["data"]){
      mData.add(DataModel.fromJson(eachData));
    }
    return CategoryModel(
      data: mData,
      message: json["message"],
      status: json["status"],
    );
  }
}