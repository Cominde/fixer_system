class GetListOfInventoryComponentsModel{
  GetListOfInventoryComponentsModel();
  int ?results;
  List<InventoryComponentData>data=[];
  int pages = 1;
  int current = 1;
  GetListOfInventoryComponentsModel.fromJson(Map<String,dynamic>?json, {bool search = false})
  {
    if(!search) {
      results=json?['results'];
      pages=json?['paginationResult']['numberOfPages'];
    }
    json?['data'].forEach((element) {
      data.add(InventoryComponentData.fromJson(element));
    });
  }

}
class InventoryComponentData{
  InventoryComponentData();
  String? id;
  String?name;
  int? quantity;
  double ?price;
  DateTime?createdAt;
  DateTime?updatedAt;
  InventoryComponentData.fromJson(Map<String,dynamic>?json)
  {
    id=json?['_id'];
    name=json?['name'];
    quantity=json?['quantity'];
    price=(json?['price']*1.0);
    createdAt=DateTime.tryParse(json?['createdAt']);
    updatedAt=DateTime.tryParse(json?['updatedAt']);
  }
}