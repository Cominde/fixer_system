
class GetCompletedRepairDetailsModel {
  GetCompletedRepairDetailsModel();
  Visit? visit;
  String? name;
  String? phone;
  String? carNumber;
  String? chassisNumber;
  String? category;
  String? color;
  int? distances;
  String? model;
  String? clientCode;
  String? brand;
  GetCompletedRepairDetailsModel.fromJson(Map<String,dynamic>?json)
  {
    visit = Visit.fromJson(json?['repair']);

    name = json?['data']['name'];
    phone = json?['data']['phone'];
    carNumber = json?['data']['carNumber'];
    chassisNumber = json?['data']['chassisNumber'];
    category = json?['data']['category'];
    color = json?['data']['color'];
    distances = json?['data']['distances'];
    model = json?['data']['model'];
    clientCode = json?['data']['clientCode'];
    brand = json?['data']['brand'];
  }


}

class Visit{
  Visit();
  String ? id;
  String ? invoiceID;
  int ?discount;
  String? carNumber;
  String?type;
  DateTime?expectedDate;
  List<Service> services=[];
  List<Addition> additions=[];
  List<Component> components=[];
  int? priceAfterDiscount;
  bool?complete;
  double?completedServicesRatio;
  String? state;
  String? note1;
  String? note2;
  int? distance;
  DateTime?createdAt;
  DateTime?updatedAt;

  Visit.fromJson(Map<String,dynamic>?json)
  {
    id=json?['_id'];
    invoiceID=json?['genId'];
    discount=json?['discount'];
    carNumber=json?['carNumber'];
    type=json?['type'];
    expectedDate=DateTime.parse(json?['expectedDate']);
    json?['Services'].forEach((element){
      services.add(Service.fromJson(element));
    });
    json?['additions'].forEach((element){
      additions.add(Addition.fromJson(element));
    });
    json?['component'].forEach((element){
      components.add(Component.fromJson(element));
    });
    priceAfterDiscount=json?['priceAfterDiscount'];
    complete=json?['complete'];
    if (json?['completedServicesRatio']!=null) {
      completedServicesRatio=double.parse(json!['completedServicesRatio'].toString());
    }
    state=json?['State'];
    note1=json?['note1'];
    note2=json?['note2'];
    distance=json?['distance'];
    createdAt=DateTime.parse(json?['createdAt']);
    updatedAt=DateTime.parse(json?['updatedAt']);

  }

}
class Service{
  Service();
  String?state;
  String?name;
  int ?price;
  String?id;
  Service.fromJson(Map<String,dynamic>?json)
  {
    state=json?['state'];
    name=json?['name'];
    price=json?['price'];
    id=json?['_id'];
  }
}
class Addition{
  Addition();
  String?name;
  int?price;
  String?id;
  Addition.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    price=json['price'];
    id=json['_id'];
  }
}
class Component{
  Component();
  String?name;
  int?quantity;
  int?price;
  String?id;
  Component.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    price=json['price'];
    id=json['_id'];
    quantity=json['quantity'];
  }

}
