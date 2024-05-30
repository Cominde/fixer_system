




class GetSpecificCarModel{
  GetSpecificCarModel();

SpecificCarData ?carData;
RepairData?repaired=RepairData();
RepairData?currentRepair=RepairData();

GetSpecificCarModel.fromJson(Map<String,dynamic>?json)
{
  json=json?['data'];
   carData=SpecificCarData.fromJson(json?['car']);
   repaired=RepairData.fromJson(json?['repairing']);
   currentRepair=RepairData.fromJson(json?['currentRepair']);
}




}

class SpecificCarData{

  String? id;
  String? ownerName;
  String? carNumber;
  int? phoneNumber;
  String? email;
  String? chassisNumber;
  String? color;
  String? state;
  String? brand;
  String? category;
  String? model;
  String? generatedCode;
  String? generatedPassword;
  int? periodicRepairs;
  int? nonPeriodicRepairs;
  bool? repairing;
  int? distance;
  String?motorNumber;
  var componentState=[];
  DateTime?nextRepairDate;
  DateTime?lastRepairDate;
  double?repairingPercentage;


  SpecificCarData.fromJson(Map<String,dynamic>?json)

  {
    state = json?['State'];
    id = json?['_id'];
    ownerName = json?['ownerName'];
    carNumber = json?['carNumber'];
    phoneNumber = json?['phoneNumber'];
    email = json?['email'];
    chassisNumber = json?['chassisNumber'];
    color = json?['color'];
    brand = json?['brand'];
    category = json?['category'];
    model = json?['model'];
    generatedCode = json?['generatedCode'];
    generatedPassword = json?['generatedPassword'];
    periodicRepairs = json?['periodicRepairs'];
    nonPeriodicRepairs = json?['nonPeriodicRepairs'];
    repairing = json?['repairing'];
    componentState.addAll(json?['componentState']);
    distance = json?['distances'];
    motorNumber = json?['motorNumber'];
    if (json?['nextRepairDate']!=null) {
      nextRepairDate=DateTime.tryParse(json?['nextRepairDate']);
    }
    if (json?['lastRepairDate']!=null) {
      lastRepairDate=DateTime.tryParse(json?['lastRepairDate']);
    }
    repairingPercentage=json?['repairingPercentage'];

  }
  }

class RepairData {
  RepairData();

  String? id;
  String? client;
  String? brand;
  String? category;
  String? model;
  int ? discount;
  String? totalPrice;
  String? carNumber;
  String? type;
  DateTime? expectedDate;
  List<Service>services = [];
  List<Addition>additions = [];
  List<Component>components = [];
  int ?priceAfterDiscount;
  bool? complete;
  var  completedServicesRatio;
  DateTime? createdAt;
  DateTime? updatedAt;


  RepairData.fromJson(Map<String, dynamic>?json)
  {
   id = json?["_id"];
   client= json?["client"];
   brand= json?["brand"];
   category= json?["category"];
   model= json?["model"];
   discount= json?["discount"];
   totalPrice= json?["totalPrice"];
   carNumber= json?["carNumber"];
   type= json?["type"];
   if (json?["expectedDate"]!=null) {
     expectedDate= DateTime.tryParse(json?["expectedDate"]);
   }
   json?["Services"].forEach((element){
     if (element!=null) {
        services.add(Service.fromJson(element));
      }
    });
    json?["additions"].forEach((element){
     if (element!=null) {
       additions.add(Addition.fromJson(element));
     }
    });

      json?["component"].forEach((element) {
     if (element!=null) {
       components.add(Component.fromJson(element));
     }
      });

   priceAfterDiscount= json?["priceAfterDiscount"];
   complete= json?["complete"];
   completedServicesRatio= json?["completedServicesRatio"];
   if(json?["createdAt"]!=null) {
     createdAt= DateTime.tryParse(json?["createdAt"]);
   }
   if(json?["updatedAt"]!=null) {
     updatedAt= DateTime.tryParse(json?["updatedAt"]);
   }
  }
}

class Service{
  String? name;
  double?price;
  String?state;
  String?id;
  Service.fromJson(Map<String,dynamic>?json)
  {
    name=json?['name'];
    price=json?['price']*1.0;
    state=json?['state'];
    id=json?['_id'];
  }
}


class Addition{
  String? name;
  double?price;
  String?id;
  Addition.fromJson(Map<String,dynamic>?json)
  {
    name=json?['name'];
    price=json?['price']*1.0;
    id=json?['_id'];
  }
}



class Component{
  String? name;
  double?price;
  String?id;
  int?quantity;
  Component.fromJson(Map<String,dynamic>?json)
  {
    name=json?['name'];
    price=json?['price']*1.0;
    id=json?['_id'];
    quantity=json?['quantity'];
  }
}
