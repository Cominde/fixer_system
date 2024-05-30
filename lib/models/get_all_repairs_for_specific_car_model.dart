import 'get_specific_car_model.dart';

class GetAllRepairsForSpecificCarModel{
  GetAllRepairsForSpecificCarModel();
  List<RepairData>repairs=[];
  GetAllRepairsForSpecificCarModel.fromJson(Map<String,dynamic>?json)
  {
      json?['data'].forEach((element){
        if (element!=null) {
        repairs.add(RepairData.fromJson(element));
      }
    });
  }

}