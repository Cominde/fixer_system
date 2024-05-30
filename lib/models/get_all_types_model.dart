
class GetTypesModel{
  GetTypesModel();
  int? results=null;
  List<Type>types=[];
  int pages = 1;
  int current = 1;
  GetTypesModel.fromJson(Map<String,dynamic>?json){
    results=json?['results'];
    pages=json?['paginationResult']['numberOfPages'];
    json?['data'].forEach((element) {
      types.add(Type.fromJson(element));
    });
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