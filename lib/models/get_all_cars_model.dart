class GetCarsModel{
  GetCarsModel();
  int ? results;
  List<CarData>data=[];
  int pages = 1;
  int current = 1;
  GetCarsModel.fromJson(Map<String,dynamic>?json){
    results=json?['results'];
    pages=json?['paginationResult']['numberOfPages'];
    json?['data'].forEach((element) {
      data.add(CarData.fromJson(element));
    });
  }
}

class CarData{
  CarData();

  String? id;
  String? ownerName;
  String? carNumber;
  String? phoneNumber;
  String? email;
  String? carIdNumber;
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
  //var componentState;
  DateTime?nextRepairDate;
  double?repairingPercentage;

  CarData.fromJson(Map<String,dynamic>?json)
  {

    state=json?['State'];

    id=json?['_id'];
    //print(json?['_id']);
    //print (id);
    ownerName=json?['ownerName'];
    carNumber=json?['carNumber'];
    phoneNumber=json?['phoneNumber'];
    email=json?['email'];
    carIdNumber=json?['carIdNumber'];
    color=json?['color'];
    state=json?['state'];
    brand=json?['brand'];
    category=json?['category'];
    model=json?['model'];
    generatedCode=json?['generatedCode'];
    generatedPassword=json?['generatedPassword'];
    periodicRepairs=json?['periodicRepairs'];
    nonPeriodicRepairs=json?['nonPeriodicRepairs'];
    repairing=json?['repairing'];
    // componentState=(json?['componentState']);
    distance=json?['distances'];
    motorNumber=json?['motorNumber'];
    if (json?['nextRepairDate']!=null) {
      nextRepairDate=DateTime.tryParse(json?['nextRepairDate']);
    }





  }


}