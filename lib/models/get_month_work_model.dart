class GetMonthWorkModel{
  GetMonthWorkModel();
  List<MonthRepair>monthRepairs=[];
  List<MonthWorker>monthWorker=[];
  List<MonthAddition>monthAddition=[];

  GetMonthWorkModel.fromJson(Map<String,dynamic>?json)
  {
    json=json?['data'];
    json?['sortedRepairs'].forEach((element){
      monthRepairs.add(MonthRepair.fromJson(element));
    });
    json?['sortedWorkers'].forEach((element){
      monthWorker.add(MonthWorker.fromJson(element));
    });
    json?['sortedAdditions'].forEach((element){
      monthAddition.add(MonthAddition.fromJson(element));
    });
  }


}
class MonthRepair{
  MonthRepair();
  String ?id;
  String ?client;
  String ?brand;
  String ?category;
  String ?model;
  int?priceAfterDiscount;
  DateTime?createdAt;
  MonthRepair.fromJson(Map<String,dynamic>?json)
  {
   id=json?["_id"];
   client=json?["client"];
   brand=json?["brand"];
   category=json?["category"];
   model=json?["model"];
   priceAfterDiscount=json?["priceAfterDiscount"];
   if (json?["createdAt"]!=null) {
     createdAt=DateTime.tryParse(json?["createdAt"]);
   }

  }
}
class MonthWorker{
  MonthWorker();
  String ?id;
  String ?name;
  var salary;
  MonthWorker.fromJson(Map<String,dynamic>?json)
  {
    id=json?["_id"];
    name=json?["name"];
    salary=json?["salary"];
  }

}
class MonthAddition{
  MonthAddition();
  String ?id;
  String ?title;
  var price;
  DateTime?date;
  MonthAddition.fromJson(Map<String,dynamic>?json)
  {
    id=json?["_id"];
    title=json?["title"];
    price=json?["price"];
    if (json?["date"]!=null) {
      date=DateTime.tryParse(json?["date"]);
    }

  }

}
