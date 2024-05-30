class GetSpecificUserModel{
  GetSpecificUserModel();
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  bool active=false;
  String? phoneNumber;
  List<SpecificUserCarData>cars=[];
  DateTime? createdAt;
  GetSpecificUserModel.fromJson(Map<String,dynamic>?json){
    json=json?['data'];
    id=json?['id'];
    name=json?['name'];
    email=json?['email'];
    password=json?['password'];
    role=json?['role'];
    active=json?['active'];
    phoneNumber=json?['phoneNumber'];
    createdAt=DateTime.tryParse(json?['createdAt']);
    json?['car'].forEach((element) {
      cars.add(SpecificUserCarData.fromJson(element));
    });
  }


}

class SpecificUserCarData {
  SpecificUserCarData();
  String ? id;
  String ? carCode;
  String ? carNumber;
  String ?brand;
  String ?category ;
  String ?model;
  SpecificUserCarData.fromJson(Map<String,dynamic>?json)
  {
    if (json?['id']!=null)
      {
        id=json?['id'];

      }else {
      id ??= json?['_id'];
    }

    if (json?['carCode']!=null) {
      carCode=json?['carCode'];
    }
    else {
      carCode=json?['generatedCode'];
    }

    carNumber=json?['carNumber'];
    brand=json?['brand'];
    category=json?['category'];
    model=json?['model'];
  }
}