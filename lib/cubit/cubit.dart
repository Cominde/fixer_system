import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:fixer_system/models/get_completed_repairs_model.dart';
import 'package:fixer_system/models/get_specific_user_model.dart';
import 'package:fixer_system/models/get_users_model.dart';
import 'package:fixer_system/models/get_workers_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:http/http.dart';

import '../components/show_toast_function/show_toast_function.dart';
import '../end_points.dart';
import '../models/get_all_cars_model.dart';
import '../models/get_all_repairs_for_specific_car_model.dart';
import '../models/get_list_of_inventory_components_model.dart';
import '../models/get_month_work_model.dart';
import '../models/get_repairing_cars_model.dart';
import '../models/monthly_report_model.dart';
import 'package:fixer_system/models/get_specific_car_model.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);


  GetUsersModel? getUsersModel = GetUsersModel();
  GetWorkersModel? getWorkersModel = GetWorkersModel();
  GetCarsModel? getCarsModel = GetCarsModel();
  GetRepairingCarsModel? getRepairingCarsModel = GetRepairingCarsModel();
  GetListOfInventoryComponentsModel? getListOfInventoryComponentsModel =GetListOfInventoryComponentsModel();
  GetSpecificUserModel? getSpecificUserModel = GetSpecificUserModel();
  GetSpecificCarModel? getSpecificCarModel = GetSpecificCarModel();
  GetAllRepairsForSpecificCarModel? getAllRepairsForSpecificCarModel =GetAllRepairsForSpecificCarModel();
  MainPramsModel? mainPramsModel = MainPramsModel();
  GetCompletedRepairsModel? getCompletedRepairsModel =GetCompletedRepairsModel();
  GetMonthWorkModel? getMonthWorkModel = GetMonthWorkModel();
  GetListOfInventoryComponentsModel? searchListOfInventoryComponentsModel =GetListOfInventoryComponentsModel();

  var time = DateTime.now();
  void changDatePicker(value) {
    time = value;
    emit(AppDatePickerChangeState());
  }

  void login(
    context, {
    required String email,
    required String password,
  }) {
    emit(AppLoginLoadingState());

    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    post(Uri.parse(LOGIN),
            headers: {
              'Content-Type': 'application/json',
            },
            body: body)
        .then((response) {
      if (response.statusCode == 200) {
        if (email=="admin"&&password=="admin")
          {
            emit(AppLoginFirstTimeState());
          }
        else if (jsonDecode(response.body)['message'] != null) {
          showToast(context, jsonDecode(response.body)['message']);
          emit(AppLoginVerifyState());
        } else {
          headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${jsonDecode(response.body)['token']}',
          };
          print(jsonDecode(response.body)['token']);
          emit(AppLoginSuccessState());
        }
      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppLoginErrorState());
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(AppLoginErrorState());
    });
  }


  void setFirstTime(
      context, {
        required String email,
        required String password,
      }) {
    emit(AppSetFirstTimeLoadingState());

    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    post(Uri.parse(FIRSTTIME),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body)
        .then((response) {
      if (response.statusCode == 200) {


          showToast(context, jsonDecode(response.body)['message']);
          emit(AppSetFirstTimeSuccessState());


        }
       else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppSetFirstTimeErrorState());
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(AppSetFirstTimeErrorState());
    });
  }



  void forgetPassword(
      context, {
        required String email,
      }) {
    emit(AppForgetPasswordLoadingState());

    final body = jsonEncode({
      'email': email,
    });

    post(Uri.parse(FORGETPASSWORD),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body)
        .then((response) {
      if (response.statusCode == 200) {
          showToast(context, jsonDecode(response.body)['message']);

          emit(AppForgetPasswordSuccessState());

      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppForgetPasswordErrorState());
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(AppForgetPasswordErrorState());
    });
  }



  void resetPassword(
      context, {
        required String email,
        required String otp,
        required String password
      }) {
    emit(AppResetPasswordLoadingState());

    final body = jsonEncode({
      'email': email,
      'otp':otp,
      'newPassword':password,
    });

    post(Uri.parse(RESETPASSWORD),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body)
        .then((response) {
      if (response.statusCode == 200) {
        showToast(context, jsonDecode(response.body)['message']);

        emit(AppResetPasswordSuccessState());

      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppResetPasswordErrorState());
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(AppResetPasswordErrorState());
    });
  }


  void addClient(
    context, {
    required String name,
    required String email,
    required String carNumber,
    required String phoneNumber,
    required String color,
    required String brand,
    required String category,
    required String distance,
    required String chassisNumber,
    required String nextRepairDate,
    required String lastRepairDate,
    required String periodicRepairs,
    required String nonPeriodicRepairs,
    required String motorNumber,
  }) {
    emit(AppAddClientLoadingState());

    final body = jsonEncode({
      'name': name,
      'email': email,
      'carNumber': carNumber,
      'phoneNumber': phoneNumber,
      'color': color,
      'brand': brand,
      'category': category,
      'model': time.year.toString(),
      "role": "user",
      'distances': distance,
      'chassisNumber': chassisNumber,
      'nextRepairDate': nextRepairDate,
      'lastRepairDate': lastRepairDate,
      'periodicRepairs': periodicRepairs,
      'nonPeriodicRepairs': nonPeriodicRepairs,
      'motorNumber': motorNumber,
      "State": "good",
    });

    post(Uri.parse(ADDCLIENT), headers: headers, body: body).then((response) {
      if (response.statusCode == 201) {
        showToast(context, "User added successfully");
        getUsersModel?.users
            .add(User.fromJson(jsonDecode(response.body)['data']));

        emit(AppAddClientSuccessState());
      } else {
        showToast(context, response.body);
        emit(AppAddClientErrorState());
      }
    });
  }

  void getUsers() {
    emit(AppGetUsersLoadingState());
    read(
      Uri.parse(GETUSERS),
      headers: headers,
    ).then((value) {
      getUsersModel = GetUsersModel.fromJson(jsonDecode(value));
      if (getUsersModel?.results != null) {
        emit(AppGetUsersSuccessState());
      } else {
        emit(AppGetUsersErrorState());
      }
    });
  }

  void changeServiceState(
    context, {
    required String serviceId,
    required String state,
  }) {
    emit(AppChangeServiceStateLoadingState());
    final body = jsonEncode({
      'newState': state,
    });
    put(Uri.parse(CHANGESERVICE + serviceId), headers: headers, body: body)
        .then((response) {
      if (response.statusCode == 200) {
        showToast(context, 'Service state changed successfully');
        emit(AppChangeServiceStateSuccessState());
      } else {
        emit(AppChangeServiceStateErrorState(''));
        showToast(context, response.body);
      }
    }).catchError((error) {
      print(error.toString());
      emit(AppChangeServiceStateErrorState(error.toString()));
    });
  }

  void getWorkers() {
    emit(AppGetWorkersLoadingState());
    read(
      Uri.parse(GETWORKERS),
      headers: headers,
    ).then((value) {
      getWorkersModel = GetWorkersModel.fromJson(jsonDecode(value));
      if (getWorkersModel?.results != null) {
        emit(AppGetWorkersSuccessState());
      } else {
        emit(AppGetWorkersErrorState());
      }
    });
  }

  void addWorker(
    context, {
    required String name,
    required String phoneNumber,
    required String jobTitle,
    required String salary,
    required String IDNumber,
  }) {
    emit(AppAddWorkerLoadingState());
    final body = jsonEncode({
      'name': name,
      'phoneNumber': phoneNumber,
      'jobTitle': jobTitle,
      'salary': salary,
      'IdNumber': IDNumber,
    });

    post(Uri.parse(ADDWORKER), headers: headers, body: body).then((response) {
      if (response.statusCode == 201) {
        showToast(context, 'Worker Added Successfully');
        getWorkersModel?.workers
            .add(Worker.fromJson(jsonDecode(response.body)['data']));
        emit(AppAddWorkerSuccessState());
      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppAddWorkerErrorState());
      }
    });
  }

  void getCars() {
    emit(AppGetAllCarsLoadingState());
    read(
      Uri.parse(GETCARS),
      headers: headers,
    ).then((value) {
      getCarsModel = GetCarsModel.fromJson(jsonDecode(value));

      if (getCarsModel?.results != null) {
        emit(AppGetAllCarsSuccessState());
      } else {
        emit(AppGetAllCarsErrorState());
      }
    });
  }

  void getRepairingCars() {
    emit(AppGetRepairingCarsLoadingState());

    read(
      Uri.parse(GETREPAIRINGCARS),
      headers: headers,
    ).then((value) {

      getRepairingCarsModel = GetRepairingCarsModel.fromJson(jsonDecode(value));
      emit(AppGetRepairingCarsSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AppGetRepairingCarsErrorState());
    });
  }

  void searchWorkers({
    required String word,
  }) {
    getWorkersModel?.workers = [];

    emit(AppSearchWorkersLoadingState());
    read(
      Uri.parse(SEARCHWORKERS + word),
      headers: headers,
    ).then((value) {
      getWorkersModel = GetWorkersModel.fromJson(jsonDecode(value));
      if (getWorkersModel?.results != null) {
        emit(AppSearchWorkersSuccessState());
      } else {
        emit(AppSearchWorkersErrorState());
      }
    }).catchError((error) {
      emit(AppSearchWorkersErrorState());
    });
  }

  void searchCars({
    required String word,
  }) {
    getCarsModel?.data = [];

    emit(AppSearchCarsLoadingState());
    read(
      Uri.parse(SEARCHCARS + word),
      headers: headers,
    ).then((value) {
      getCarsModel = GetCarsModel.fromJson(jsonDecode(value));
      if (getCarsModel?.results != null) {
        emit(AppSearchCarsSuccessState());
      } else {
        emit(AppSearchCarsErrorState());
      }
    }).catchError((error) {
      emit(AppSearchCarsErrorState());
    });
  }

  void searchUsers({
    required String word,
  }) {
    getUsersModel?.users = [];

    emit(AppSearchUsersLoadingState());
    read(
      Uri.parse(SEARCHUSERS+word),
      headers: headers,
    ).then((value) {
      getUsersModel = GetUsersModel.fromJson(jsonDecode(value));
      if (getUsersModel?.results != null) {
        emit(AppSearchUsersSuccessState());
      } else {
        emit(AppSearchUsersErrorState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(AppSearchUsersErrorState());
    });
  }

  void getListOfComponents() {
    emit(AppGetListOfComponentsLoadingState());
    read(
      Uri.parse(GETLISTOFCOMPONETS),
      headers: headers,
    ).then((value) {
      getListOfInventoryComponentsModel =
          GetListOfInventoryComponentsModel.fromJson(jsonDecode(value));
      if (getListOfInventoryComponentsModel?.results != null) {
        emit(AppGetListOfComponentsSuccessState());
      } else {
        emit(AppGetListOfComponentsErrorState());
      }
    }).catchError((error) {
      emit(AppGetListOfComponentsErrorState());
    });
  }

  void addComponent(
    context, {
    required String name,
    required String quantity,
    required String price,
  }) {
    emit(AppAddComponentLoadingState());

    final body = jsonEncode({
      'name': name,
      'quantity': quantity,
      'price': price,
    });

    post(Uri.parse(ADDCOMPONENT), headers: headers, body: body)
        .then((response) {
      if (response.statusCode == 201) {
        getListOfInventoryComponentsModel?.data.add(
            InventoryComponentData.fromJson(jsonDecode(response.body)['data']));
        showToast(context, "Component added successfully");
        emit(AppAddComponentSuccessState());
      } else {
        showToast(context, response.body);
        emit(AppAddComponentErrorState());
      }
    });
  }

  void searchRepairingCars({
    required String word,
  }) {
    getRepairingCarsModel?.data = [];

    emit(AppSearchRepairingCarsLoadingState());
    read(
      Uri.parse(SEARCHREPAIRINGCARS + word),
      headers: headers,
    ).then((value) {
      getRepairingCarsModel = GetRepairingCarsModel.fromJson(jsonDecode(value));
      if (getRepairingCarsModel?.results != null) {
        emit(AppSearchRepairingCarsSuccessState());
      } else {
        emit(AppSearchRepairingCarsErrorState());
      }
    }).catchError((error) {
      emit(AppSearchRepairingCarsErrorState());
    });
  }

  void editComponent(
    context, {
    required String name,
    required String quantity,
    required String price,
    required String id,
  }) {
    emit(AppEditComponentLoadingState());
    final body = jsonEncode({
      'name': name,
      'quantity': quantity,
      'price': price,
    });

    put(Uri.parse(EDITCOMPONET + id), headers: headers, body: body)
        .then((response) {
      if (response.statusCode == 200) {
        showToast(context, "Component edited successfully");
        emit(AppEditComponentSuccessState());
      } else {
        showToast(context, response.body);
        emit(AppEditComponentErrorState());
      }
    });
  }

  void getSpecificUser({
    required String userId,
  }) {
    emit(AppGetSpecificUserLoadingState());

    read(
      Uri.parse(GETSPECIFICUSER + userId),
      headers: headers,
    ).then((value) {
      getSpecificUserModel = GetSpecificUserModel.fromJson(jsonDecode(value));
      if (getSpecificUserModel?.name != null) {
        emit(AppGetSpecificUserSuccessState());
      } else {
        emit(AppGetSpecificUserErrorState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(AppGetSpecificUserErrorState());
    });
  }

  void addCar(
    context, {
    required String id,
    required String carNumber,
    required String color,
    required String brand,
    required String category,
    required String distance,
    required String chassisNumber,
    required String nextRepairDate,
    required String lastRepairDate,
    required String periodicRepairs,
    required String nonPeriodicRepairs,
    required String motorNumber,
  }) {
    emit(AppAddCarLoadingState());

    final body = jsonEncode({
      'carNumber': carNumber,
      'chassisNumber': chassisNumber,
      'nextRepairDate': nextRepairDate,
      'lastRepairDate': lastRepairDate,
      'color': color,
      'brand': brand,
      'category': category,
      'model': time.year.toString(),
      'distance': distance,
      'motorNumber': motorNumber,
      'repairing': false,
      "periodicRepairs": 0,
      "nonPeriodicRepairs": 0,
    });

    post(Uri.parse(ADDCAR + id), headers: headers, body: body).then((response) {
      if (response.statusCode == 201) {
        showToast(context, "Car added successfully");

        getSpecificUserModel?.cars.add(SpecificUserCarData.fromJson(
            jsonDecode(response.body)['data']['newCar']));

        emit(AppAddCarSuccessState());
      } else {
        showToast(context, response.body);

        emit(AppAddCarErrorState());
      }
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  void updateUser(
    context, {
    required String id,
    required String email,
    required String name,
    required String phone,
  }) {
    emit(AppUpdateUsersLoadingState());
    final body = jsonEncode({
      'name': name,
      'email': email,
      'phoneNumber': phone,
    });
    put(Uri.parse(UPDATEUSER + id), headers: headers, body: body).then((value) {
      if (value.statusCode == 200) {
        showToast(context, 'user updated successfully');
        emit(AppUpdateUsersSuccessState());
      } else {
        emit(AppUpdateUsersErrorState());
      }
    }).catchError((error) {
      emit(AppUpdateUsersErrorState());
    });
  }

  void getSpecificCarById({
    required String carId,
  }) {
    getAllRepairsForSpecificCarModel?.repairs = [];
    emit(AppGetSpecificCarLoadingState());

    read(
      Uri.parse(GETSPECIFICCARBYID + carId),
      headers: headers,
    ).then((value) {
      getSpecificCarModel = GetSpecificCarModel.fromJson(jsonDecode(value));
      if (getSpecificCarModel?.carData?.id != null) {
        emit(AppGetSpecificCarSuccessState());
        getAllRepairsForSpecificCar(carId: carId);
      } else {
        emit(AppGetSpecificCarSuccessState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(AppGetSpecificCarErrorState());
    });
  }

  void addRepair(
    context, {
    required String carNumber,
    required List<Map<String, dynamic>> components,
    required List<Map<String, dynamic>> services,
    required List<Map<String, dynamic>> additions,
    required String type,
    required double discount,
    required int daysItTake,
  }) {
    emit(AppAddRepairLoadingState());
    final body = jsonEncode({
      'components': components,
      'services': services,
      'additions': additions,
      'carNumber': carNumber,
      'type': type,
      'discount': discount,
      'daysItTake': daysItTake,
    });

    post(Uri.parse(ADDREPAIR), headers: headers, body: body).then((response) {
      if (response.statusCode == 200) {
        showToast(context, "Repair added successfully");
        emit(AppAddRepairSuccessState());
      } else {
        showToast(context, response.body);
        emit(AppAddRepairErrorState());
      }
      // if (forgetPasswordModel!.status != 'fail') {
      //   emit(AppForgetPasswordSuccessState());
      //   showToast('password sent to your email');
      // } else {
      //   emit(AppForgetPasswordErrorState(forgetPasswordModel?.message ?? ''));
      // }
    });
  }

  void getAllRepairsForSpecificCar({
    required String carId,
  }) {
    emit(AppGetAllRepairsForSpecificCarLoadingState());

    read(
      Uri.parse(GETALLREPAIRSFORSPECIFICAR+carId),
      headers: headers,
    ).then((value) {
      getAllRepairsForSpecificCarModel =
          GetAllRepairsForSpecificCarModel.fromJson(jsonDecode(value));
      if (getAllRepairsForSpecificCarModel?.repairs != null) {
        emit(AppGetAllRepairsForSpecificCarSuccessState());
      } else {
        emit(AppGetAllRepairsForSpecificCarErrorState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(AppGetAllRepairsForSpecificCarErrorState());
    });
  }

  void updateCar(
    context, {
    required String carNumber,
    required String color,
    required String state,
    required String brand,
    required String category,
    required String model,
    required String periodicRepairs,
    required String nonPeriodicRepairs,
    required String repairing,
    required String distance,
    required String motorNumber,
    DateTime? nextRepair,
    required String carId,
    DateTime? lastRepair,
  }) {
    emit(AppUpdateCarLoadingState());
    final body = jsonEncode({
      '_id': carId,
      "carNumber": carNumber,
      "color": color,
      "State": state,
      "brand": brand,
      "category": category,
      "model": model,
      "nextRepairDate": nextRepair.toString(),
      "lastRepairDate": lastRepair.toString(),
      "periodicRepairs": periodicRepairs,
      "nonPeriodicRepairs": nonPeriodicRepairs,
      "repairing": repairing,
      "distances": distance,
      "motorNumber": motorNumber,
      // "componentState": [
      //   {
      //     "_id": "661d425cf5cfc07996163c99"
      //   },
      //   {
      //     "_id": "661d425cf5cfc07996163c9a"
      //   }
      // ],
    });
    put(Uri.parse(UPDATECAR + carId), headers: headers, body: body)
        .then((value) {
      if (value.statusCode == 200) {
        showToast(context, 'car updated successfully');
        emit(AppUpdateCarSuccessState());
      } else {
        emit(AppUpdateCarErrorState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(AppUpdateCarErrorState());
    });
  }

  void getMainPrams({
    required String year,
    required String month,
  }) {
    mainPramsModel = MainPramsModel();
    emit(AppGetMainPramsLoadingState());

    var body=jsonEncode({
      "year": year,
      "month": month,
    });
    post(
      Uri.parse('$GETMAINPRAMS'),
      headers: headers,
      body: body,
    ).then((value) {
      mainPramsModel = MainPramsModel.fromJson(jsonDecode(value.body));
      if (value.statusCode==201) {
        emit(AppGetMainPramsSuccessState());
      } else {
        emit(AppGetMainPramsErrorState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(AppGetMainPramsErrorState());
    });
  }

  void updateWorker(
    context, {
    required String id,
    required String? name,
    required String? phoneNumber,
    required String? jobTitle,
    required String? salary,
    required String? IDNumber,
  }) {
    emit(AppUpdateWorkerLoadingState());
    final body = jsonEncode({
      'name': name,
      'phoneNumber': phoneNumber,
      'jobTitle': jobTitle,
      'salary': salary,
      'IdNumber': IDNumber,
    });
    put(Uri.parse(UPDATEWORKER + id), headers: headers, body: body)
        .then((value) {
      if (value.statusCode == 200) {
        showToast(context, 'Worker updated successfully');
        emit(AppUpdateWorkerSuccessState());
      } else {
        emit(AppUpdateWorkerErrorState());
      }
    }).catchError((error) {
      emit(AppUpdateUsersErrorState());
    });
  }

  void getCompletedRepairs() {
    getCompletedRepairsModel = GetCompletedRepairsModel();
    emit(AppGetCompletedRepairsLoadingState());

    read(
      Uri.parse(GETCOMPLETEDREPAIRS),
      headers: headers,
    ).then((value) {
      getCompletedRepairsModel =
          GetCompletedRepairsModel.fromJson(jsonDecode(value));
      if (getCompletedRepairsModel?.results != null) {
        emit(AppGetCompletedRepairsSuccessState());
      } else {
        emit(AppGetCompletedRepairsErrorState());
      }
    }).catchError((error) {
      print( error.toString());
      emit(AppGetCompletedRepairsErrorState());
    });
  }

  void getMonthWork({
    required String year,
    required String month,
  }) {
    getMonthWorkModel = GetMonthWorkModel();

    emit(AppGetMonthWorkLoadingState());
    read(
      Uri.parse('$GETMONTHWORK${year}_$month'),
      headers: headers,
    ).then((value) {
      getMonthWorkModel = GetMonthWorkModel.fromJson(jsonDecode(value));
      emit(AppGetMonthWorkSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetMonthWorkErrorState());
    });
  }

  void searchComponents({
    required String word,
  }) {
    searchListOfInventoryComponentsModel?.data = [];

    emit(AppSearchComponentsLoadingState());
    read(
      Uri.parse(SEARCHCOMPONENTS + word),
      headers: headers,
    ).then((value) {
      searchListOfInventoryComponentsModel =
          GetListOfInventoryComponentsModel.fromJson(jsonDecode(value));
      if (searchListOfInventoryComponentsModel?.results != null) {
        emit(AppSearchComponentsSuccessState());
      } else {
        emit(AppSearchComponentsErrorState());
      }
    }).catchError((error) {
      emit(AppSearchComponentsErrorState());
    });
  }

  void addThing(
    context, {
    required String title,
    required int price,
    required bool plus,
        required String date,
  }) {
    if (plus==false)
      {
        price =price*-1;
      }
    emit(AppAddThingLoadingState());
    final body = jsonEncode({
      'title': title,
      'date':date,//'${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
      'price':  price,
    });

    post(Uri.parse(ADDTHING), headers: headers, body: body).then((response) {
      if (response.statusCode == 200) {
        showToast(context, 'Thing Added Successfully');
        emit(AppAddThingSuccessState());
      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppAddThingErrorState());
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(AppAddThingErrorState());
    });
  }

  void deleteWorker(
      context, {
        required String id,
      }) {
    emit(AppDeleteWorkerLoadingState());


    delete(Uri.parse(DELETEWORKER+id), headers: headers,).then((response) {
      if (response.statusCode == 204) {
        showToast(context, 'Worker Deleted Successfully');
        emit(AppDeleteWorkerSuccessState());
        getWorkers();
      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppDeleteWorkerErrorState());
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(AppDeleteWorkerErrorState());
    });
  }

  void addRewardOrLoans(context,{
    required String id,
    required String type,
    required int amount,
}){
    emit(AppAddRewardOrLoansLoadingState());

    if (type=="loans"||type=="penalty")
      {
        amount*=-1;
      }
    var body=jsonEncode(
        {
      '$type': amount,
    });
    print(body);
    post(Uri.parse(ADDREWARDORLOANS+id),headers: headers,body: body).then((value){
      if (value.statusCode==201)
      {
        showToast(context, '$type added successfully');
        emit(AppAddRepairSuccessState());
      }
      else{
        showToast(context,'Failed to add $type');

        emit(AppAddRepairErrorState());
      }
    }).catchError((onError){
      emit(AppAddRepairLoadingState());
    });

  }



  void putConstant(
      context, {
        required String title,
        required int amount,
        required String year,
        required String month,
      }) {

    emit(AppAddConstantLoadingState());
    var body = jsonEncode({
      title: amount,
    });
    put(Uri.parse('$ADDCONSTANT${year}_$month'), headers: headers, body: body).then((response) {
      if (response.statusCode == 201) {
        showToast(context, '$title added successfully');
        emit(AppAddConstantSuccessState());
      } else {
        showToast(context, 'Failed to add $title');
        emit(AppAddConstantErrorState());
      }
    }).catchError((onError) {
      print(onError.toString());
      emit(AppAddConstantErrorState());
    });
  }



}
