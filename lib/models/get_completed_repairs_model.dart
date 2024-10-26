
class GetCompletedRepairsModel {
  GetCompletedRepairsModel();
  int ?results;
  List<CompletedRepairData>completedRepairs=[];
  int pages = 1;
  int current = 1;
  GetCompletedRepairsModel.fromJson(Map<String,dynamic>?json)
  {
    results = json?['results'];
    pages=json?['paginationResult']['numberOfPages'];
    json?['data'].forEach((element){
      completedRepairs.add(CompletedRepairData.fromJson(element));
    });
  }


}

class CompletedRepairData {
  CompletedRepairData();
  String? id;
  String? brand;
  String? category;
  String? model;
  double? priceAfterDiscount;
  String? carCode;
  DateTime? paidOn;
  String? client;

  CompletedRepairData.fromJson(Map<String, dynamic>? json) {
    id = json?["id"];
    brand = json?["brand"];
    category = json?["category"];
    model = json?["model"];
    if (json?["priceAfterDiscount"] != null) {
      priceAfterDiscount = json?["priceAfterDiscount"]*1.0;
    }
    carCode = json?["carCode"];
    paidOn = DateTime.tryParse(json?['paidOn']);
    client = json?["client"];

  }
}
