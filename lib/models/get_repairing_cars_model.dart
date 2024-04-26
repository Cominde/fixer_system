
class GetRepairingCarsModel{
  GetRepairingCarsModel();
  int ? results;
  int ? page;
  List<repairingCarData>data=[];
  GetRepairingCarsModel.fromJson(Map<String,dynamic>?json){
    results=json?['result'];
    page=json?['page'];
    json?['data'].forEach((element) {
      data.add(repairingCarData.fromJson(element));
    });
  }
}
class repairingCarData{
  String? id;
  String? ownerName;
  String? carNumber;
  String? chassisNumber;
  String? color;
  String? state;
  String? brand;
  String? category;
  String? model;
  String? generatedCode;
  String? nextRepairDate;
  String? lastRepairDate;
  int? periodicRepairs;
  int? nonPeriodicRepairs;
  List<dynamic> componentState=[];
  bool?repairing;
  int?distances ;
  String? motorNumber;
  var completedServicesRatio;

  repairingCarData.fromJson(Map<String,dynamic>?json)
  {
     id=json?['_id'];
     ownerName=json?['ownerName'];
     carNumber=json?['carNumber'];
     chassisNumber=json?['chassisNumber'];
     color=json?['color'];
     state=json?['State'];
     brand=json?['brand'];
    category=json?['category'];
     model=json?['model'];
     generatedCode=json?['generatedCode'];
     nextRepairDate=json?['nextRepairDate'];
     lastRepairDate=json?['lastRepairDate'];
     periodicRepairs=json?['periodicRepairs'];
     nonPeriodicRepairs=json?['nonPeriodicRepairs'];
     componentState.addAll(json?['componentState']);
    repairing=json?['repairing'];
    distances =json?['distances'];
     motorNumber=json?['motorNumber'];
     completedServicesRatio=json?['completedServicesRatio'];
  }
}