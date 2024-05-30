class MainPramsModel {
  MainPramsModel();
  String? id;
  var income;
  var totalGain;
  var outCome;
  DateTime? createdAt;
  DateTime? updatedAt;

  MainPramsModel.fromJson(Map<String,dynamic>?json){
    json=json?['data'];
   id=json?["_id"];
    totalGain=json?["totalGain"];
    income=json?['encome'];
    outCome=json?['outCome'];
    createdAt=DateTime.tryParse(json?["createdAt"]);
    updatedAt=DateTime.tryParse(json?["updatedAt"]);

  }
}
