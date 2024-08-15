import 'dart:convert';

import 'package:fixer_system/cubit/states.dart';
import 'package:fixer_system/models/get_all_types_model.dart';
import 'package:fixer_system/models/get_completed_repair_details_model.dart';
import 'package:fixer_system/models/get_completed_repairs_model.dart';
import 'package:fixer_system/models/get_specific_user_model.dart';
import 'package:fixer_system/models/get_users_model.dart';
import 'package:fixer_system/models/get_workers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  GetCompletedRepairDetailsModel? getCompletedRepairDetailsModel = GetCompletedRepairDetailsModel();
  GetMonthWorkModel? getMonthWorkModel = GetMonthWorkModel();
  GetListOfInventoryComponentsModel? searchListOfInventoryComponentsModel =GetListOfInventoryComponentsModel();
  GetTypesModel? getTypesModel = GetTypesModel();
  GetAllTypesModel? getAllTypesModel = GetAllTypesModel();
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
      if (response.statusCode >= 200 && response.statusCode < 300) {
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
          emit(AppLoginSuccessState());
        }
      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppLoginErrorState());
      }
    }).catchError((onError) {
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
      if (response.statusCode >= 200 && response.statusCode < 300) {


          showToast(context, jsonDecode(response.body)['message']);
          emit(AppSetFirstTimeSuccessState());


        }
       else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppSetFirstTimeErrorState());
      }
    }).catchError((onError) {
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
      if (response.statusCode >= 200 && response.statusCode < 300) {
          showToast(context, jsonDecode(response.body)['message']);

          emit(AppForgetPasswordSuccessState());

      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppForgetPasswordErrorState());
      }
    }).catchError((onError) {
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
      if (response.statusCode >= 200 && response.statusCode < 300) {
        showToast(context, jsonDecode(response.body)['message']);

        emit(AppResetPasswordSuccessState());

      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppResetPasswordErrorState());
      }
    }).catchError((onError) {
      emit(AppResetPasswordErrorState());
    });
  }


  void addClient(
    context, {
    required String name,
    required String email,
    required String type,
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

    // print(type);
    final body = jsonEncode({
      'name': name,
      'email': email,
      'clientType': type,
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
      if (response.statusCode >= 200 && response.statusCode < 300) {
        showToast(context, "User added successfully");
        getUsersModel?.users
            .add(User.fromJson(jsonDecode(response.body)['data']));

        emit(AppAddClientSuccessState());
        Navigator.pop(context);
      } else {
        showToast(context, response.body);
        emit(AppAddClientErrorState());
      }
    });
  }

  void getUsers({int page = 1}) {
    emit(AppGetUsersLoadingState());
    read(
      Uri.parse(GETUSERS+page.toString()),
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
      if (response.statusCode >= 200 && response.statusCode < 300) {
        showToast(context, 'Service state changed successfully');
        emit(AppChangeServiceStateSuccessState());
      } else {
        emit(AppChangeServiceStateErrorState(''));
        showToast(context, response.body);
      }
    }).catchError((error) {
      emit(AppChangeServiceStateErrorState(error.toString()));
    });
  }

  void getWorkers({int page = 1}) {
    emit(AppGetWorkersLoadingState());
    read(
      Uri.parse(GETWORKERS+page.toString()),
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
    required String idNumber,
  }) {
    emit(AppAddWorkerLoadingState());
    final body = jsonEncode({
      'name': name,
      'phoneNumber': phoneNumber,
      'jobTitle': jobTitle,
      'salary': salary,
      'IdNumber': idNumber,
    });

    post(Uri.parse(ADDWORKER), headers: headers, body: body).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        showToast(context, 'Worker Added Successfully');
        getWorkersModel?.workers
            .add(Worker.fromJson(jsonDecode(response.body)['data']));
        emit(AppAddWorkerSuccessState());
        Navigator.pop(context);
      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppAddWorkerErrorState());
      }
    });
  }

  void getCars({int page = 1}) {
    emit(AppGetAllCarsLoadingState());
    read(
      Uri.parse(GETCARS+page.toString()),
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

  void getRepairingCars({int page = 1}) {
    emit(AppGetRepairingCarsLoadingState());

    read(
      Uri.parse(GETREPAIRINGCARS+page.toString()),
      headers: headers,
    ).then((value) {

      getRepairingCarsModel = GetRepairingCarsModel.fromJson(jsonDecode(value));
      emit(AppGetRepairingCarsSuccessState());
    }).catchError((onError) {
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
      emit(AppSearchUsersErrorState());
    });
  }

  void getListOfComponents({int page = 1}) {
    emit(AppGetListOfComponentsLoadingState());
    read(
      Uri.parse(GETLISTOFCOMPONETS+page.toString()),
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
      if (response.statusCode >= 200 && response.statusCode < 300) {
        getListOfInventoryComponentsModel?.data.add(
            InventoryComponentData.fromJson(jsonDecode(response.body)['data']));
        showToast(context, "Component added successfully");
        emit(AppAddComponentSuccessState());
        Navigator.pop(context);
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
      if (response.statusCode >= 200 && response.statusCode < 300) {
        showToast(context, "Component edited successfully");
        emit(AppEditComponentSuccessState());
        Navigator.pop(context);
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
      emit(AppGetSpecificUserErrorState());
    });
  }

  void addCar(
    context, {
    required String id,
    required String carNumber,
    required String type,
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
      'clientType': type,
    });

    post(Uri.parse(ADDCAR + id), headers: headers, body: body).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        showToast(context, "Car added successfully");

        getSpecificUserModel?.cars.add(SpecificUserCarData.fromJson(
            jsonDecode(response.body)['data']['newCar']));

        emit(AppAddCarSuccessState());
        Navigator.pop(context);
      } else {
        showToast(context, response.body);

        emit(AppAddCarErrorState());
      }
    }).catchError((onError) {
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
      if (value.statusCode >= 200 && value.statusCode < 300) {
        showToast(context, 'user updated successfully');
        emit(AppUpdateUsersSuccessState());
        Navigator.pop(context);
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
      emit(AppGetSpecificCarErrorState());
    });
  }

  String extractIdFromJson(String jsonString) {
    // Decode the JSON string
    Map<String, dynamic> decodedJson = json.decode(jsonString);

    // Extract the message from the decoded JSON
    String message = decodedJson['message'];

    // Regular expression to match the ID pattern
    RegExp regExp = RegExp(r'component with id ([a-zA-Z0-9]+)');

    // Find the first match
    RegExpMatch? match = regExp.firstMatch(message);

    // Return the ID if found, otherwise return an empty string
    if (match != null) {
      return match.group(1)??'';
    } else {
      return '';
    }
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
      if (response.statusCode >= 200 && response.statusCode < 300) {
        showToast(context, "Repair added successfully");
        emit(AppAddRepairSuccessState());
        Navigator.pop(context);
      } else {
        String id = extractIdFromJson(response.body);
        if(id.isNotEmpty) {
          int index =  components.indexWhere((element) => element['id'] == id);
          String name = components[index]['name'];
          showToast(context, 'Not enough $name.');
        } else {
          showToast(context, response.body);
        }
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
    // print('Updating');
    emit(AppUpdateCarLoadingState());
    String nr='';
    String lr='';

    if (nextRepair!=null)
      {
        nr=nextRepair.toString();
      }
    if (lastRepair!=null)
    {
      lr=lastRepair.toString();
    }

    final body = jsonEncode({
      "carNumber": carNumber,
      "color": color,
      "State": state,
      "brand": brand,
      "category": category,
      "model": model,
      "nextRepairDate": nr,
      "lastRepairDate": lr,
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
    // print (body);
    put(Uri.parse(UPDATECAR + carId), headers: headers, body: body)
        .then((value) {
          // print (value.body.toString());
      if (value.statusCode >= 200 && value.statusCode < 300) {
        showToast(context, 'car updated successfully');
        emit(AppUpdateCarSuccessState());
        Navigator.pop(context);
      } else {

        emit(AppUpdateCarErrorState());
      }
    }).catchError((error) {
      // print (error);
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
      Uri.parse(GETMAINPRAMS),
      headers: headers,
      body: body,
    ).then((value) {
      //print(value.body);
      mainPramsModel = MainPramsModel.fromJson(jsonDecode(value.body));
      //print(mainPramsModel!.income);
      if (value.statusCode>=201 && value.statusCode<300) {
        emit(AppGetMainPramsSuccessState());
      } else {
        emit(AppGetMainPramsErrorState());
      }
    }).catchError((error) {
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
    required String? idNumber,
  }) {
    emit(AppUpdateWorkerLoadingState());
    final body = jsonEncode({
      'name': name,
      'phoneNumber': phoneNumber,
      'jobTitle': jobTitle,
      'salary': salary,
      'IdNumber': idNumber,
    });
    put(Uri.parse(UPDATEWORKER + id), headers: headers, body: body)
        .then((value) {
      if (value.statusCode >= 200 && value.statusCode < 300) {
        showToast(context, 'Worker updated successfully');
        emit(AppUpdateWorkerSuccessState());
        Navigator.pop(context);
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
      emit(AppGetCompletedRepairsErrorState());
    });
  }

  void getCompletedRepairDetails({
    required String repairId,
  }) {
    emit(AppGetSpecificUserLoadingState());

    read(
      Uri.parse(GETCOMPLETEDREPAIRDETAILS + repairId),
      headers: headers,
    ).then((value) {
      getCompletedRepairDetailsModel = GetCompletedRepairDetailsModel.fromJson(jsonDecode(value));
      if (getCompletedRepairDetailsModel?.name != null) {
        emit(AppGetSpecificUserSuccessState());
      } else {
        emit(AppGetSpecificUserErrorState());
      }
    }).catchError((error) {
      emit(AppGetSpecificUserErrorState());
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
      //print(value);
      getMonthWorkModel = GetMonthWorkModel.fromJson(jsonDecode(value));
      emit(AppGetMonthWorkSuccessState());
    }).catchError((error) {
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
          GetListOfInventoryComponentsModel.fromJson(jsonDecode(value),search: true);
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
      if (response.statusCode >= 200 && response.statusCode < 300) {
        showToast(context, 'Thing Added Successfully');
        emit(AppAddThingSuccessState());
        Navigator.pop(context);
      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppAddThingErrorState());
      }
    }).catchError((onError) {
      emit(AppAddThingErrorState());
    });
  }

  void deleteWorker(
      context, {
        required String id,
      }) {
    emit(AppDeleteWorkerLoadingState());


    delete(Uri.parse(DELETEWORKER+id), headers: headers,).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        showToast(context, 'Worker Deleted Successfully');
        emit(AppDeleteWorkerSuccessState());
        getWorkers();
        Navigator.pop(context);
      } else {
        showToast(context, jsonDecode(response.body)['message']);
        emit(AppDeleteWorkerErrorState());
      }
    }).catchError((onError) {
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
      type: amount,
    });
    post(Uri.parse(ADDREWARDORLOANS+id),headers: headers,body: body).then((value){
      if (value.statusCode>=200 && value.statusCode<300)
      {
        showToast(context, '$type added successfully');
        emit(AppAddRepairSuccessState());
        Navigator.pop(context);
      }
      else{
        showToast(context,'Failed to add $type');

        emit(AppAddRepairErrorState());
      }
    }).catchError((onError){
      emit(AppAddRepairErrorState());
    });

  }



  void putConstant(
      context, {
        required String title,
        required var amount,
        required String year,
        required String month,
      }) {

    emit(AppAddConstantLoadingState());
    var body = jsonEncode({
      title: int.parse(amount),
    });
    put(Uri.parse('$ADDCONSTANT${year}_$month'), headers: headers, body: body).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        showToast(context, '$title added successfully');
        emit(AppAddConstantSuccessState());
        Navigator.pop(context);
      } else {
        showToast(context, 'Failed to add $title');
        emit(AppAddConstantErrorState());
      }
    }).catchError((onError) {
      emit(AppAddConstantErrorState());
    });
  }

  void createCode(context,{
      required String name,
      required String key,

  }){

    emit(AppCreateCodeLoadingState());
    var body=jsonEncode(
        {
          'category': name,
          'code':key,
        });
    post(Uri.parse(CREATECODE),headers: headers,body: body).then((value){
      if (value.statusCode>=200 && value.statusCode<300)
      {
        showToast(context, '$name added successfully');
        getTypesModel?.types.add(Type.fromJson(jsonDecode(value.body.toString())['data']));
        emit(AppCreateCodeSuccessState());
        Navigator.pop(context);
      }
      else{
        showToast(context,'Failed to add $name');

        emit(AppCreateCodeErrorState());
      }
    }).catchError((onError){
      emit(AppCreateCodeErrorState());
    });


  }


  void getTypes({int page = 1}) {
    emit(AppGetTypesLoadingState());
    read(
      Uri.parse(GETTYPES),
      headers: headers,
    ).then((value) {
      getTypesModel = GetTypesModel.fromJson(jsonDecode(value));
      if (getTypesModel?.results != null) {
        emit(AppGetTypesSuccessState());
      } else {
        emit(AppGetTypesErrorState());
      }
    });
  }


  void getAllTypes() {
    emit(AppGetAllTypesLoadingState());
    read(
      Uri.parse(GETALLTYPES),
      headers: headers,
    ).then((value) {
      getAllTypesModel = GetAllTypesModel.fromJson(jsonDecode(value));
      if (getAllTypesModel?.results != null) {
        emit(AppGetAllTypesSuccessState());
      } else {
        emit(AppGetAllTypesErrorState());
      }
    });
  }


  void updateType(
      context, {
        required String id,
        required String? category,
      }) {
    emit(AppUpdateTypeLoadingState());
    final body = jsonEncode({
      'category': category,
    });
    put(Uri.parse(UPDATETYPE + id), headers: headers, body: body)
        .then((value) {
      if (value.statusCode>= 200 && value.statusCode< 300) {
        showToast(context, 'Type updated successfully');
        emit(AppUpdateTypeSuccessState());
        Navigator.pop(context);
      } else {

        emit(AppUpdateTypeErrorState());
        showToast(context, 'Failed to update Type');

      }
    }).catchError((error) {
      emit(AppUpdateTypeErrorState());
    });
  }

  void searchTypes({
    required String word,
  }) {

    emit(AppSearchTypesLoadingState());
    getAllTypesModel = GetAllTypesModel();
    read(
      Uri.parse(SEARCHTYPE + word),
      headers: headers,
    ).then((value) {
      getTypesModel = GetTypesModel.fromJson(jsonDecode(value));
      if (getTypesModel?.results != null) {
        emit(AppSearchTypesSuccessState());
      } else {
        emit(AppSearchTypesErrorState());
      }
    }).catchError((error) {
      emit(AppSearchTypesErrorState());
    });
  }

}
