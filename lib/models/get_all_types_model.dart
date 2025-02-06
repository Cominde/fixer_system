
class GetTypesModel{
  GetTypesModel();
  int? results;
  List<Type>types=[];
  int pages = 1;
  int current = 1;
  GetTypesModel.fromJson(Map<String,dynamic>?json){
    results=json?['results'];
    pages=json?['paginationResult']['numberOfPages'];
    current=json?['paginationResult']['currentPage'];
    json?['data'].forEach((element) {
      types.add(Type.fromJson(element));
    });
  }
}

class GetAllTypesModel {
  GetAllTypesModel();
  List<String> types=[];
  int? results;
  GetAllTypesModel.fromJson(Map<String,dynamic>?json){
    json?['data'].forEach((element) {
      types.add(element);
    });
    if(json?['data'] != null) {
      results = types.length;
    }
  }
}

class Type {
  Type();
  String? id;
  String ?category;
  String? code;


  String?createdAt;
  String?updatedAt;
  //
  Type.fromJson(Map<String, dynamic>?json)
  {
    id = json?['_id'];

    category = json?['category'];
    code=json?['code'];
    createdAt=(json?['createdAt']) ;
    updatedAt=json?['updatedAt'];

  }
}