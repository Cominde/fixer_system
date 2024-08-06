import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/screens/client_profile_page/add_car_screen.dart';
import 'package:fixer_system/services/email_faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../components/custom/box_decoration.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

final _formKey = GlobalKey<FormState>();

  var typesController = TextEditingController();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var carNumberController = TextEditingController();

  var phoneNumberController = TextEditingController();


  var colorController = TextEditingController();

  var brandController = TextEditingController();

  var categoryController = TextEditingController();



  var distanceController = TextEditingController();

  var chassisNumberController = TextEditingController();
  var nextRepairDateController  = TextEditingController();
  var lastRepairDateController  = TextEditingController();
  var periodicRepairsController  = TextEditingController(text: '0');
  var nonPeriodicRepairsController  = TextEditingController(text: '0');
  var motorNumberController  = TextEditingController();
Widget addNewClientScreen(context, List<String> allTypes) {

  return StatefulBuilder(

    builder: (context, setState) {

      return BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return AlertDialog(

            alignment: Alignment.topCenter,
            surfaceTintColor: FlutterFlowTheme.of(context).primaryBackground,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            title: const Text(
              'Add Client',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            icon: IconButton(
              onPressed: () {

                nameController = TextEditingController();

                emailController = TextEditingController();

                carNumberController = TextEditingController();

                phoneNumberController = TextEditingController();


                colorController = TextEditingController();

                brandController = TextEditingController();

                categoryController = TextEditingController();



                distanceController = TextEditingController();
                chassisNumberController = TextEditingController();
                nextRepairDateController  = TextEditingController();
                lastRepairDateController  = TextEditingController();
                periodicRepairsController  = TextEditingController(text: '0');
                nonPeriodicRepairsController  = TextEditingController(text: '0');
                motorNumberController  = TextEditingController();

                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close,color: FlutterFlowTheme.of(context).error,),
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              alignment: Alignment.centerRight,
            ),
            actions: [
              ConditionalBuilder(
                condition: state is AppAddClientLoadingState,
                builder: (context) =>  const Center(
                  child: Padding(padding: EdgeInsets.all(40.0),
                    child: CircularProgressIndicator(),
                  ),),


                fallback: (context) => FFButtonWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AppCubit.get(context).addClient(
                        context,
                        name: nameController.text,
                        email: emailController.text.isNotEmpty?emailController.text:EmailFaker.generateUniqueEmail(nameController.text),
                        type: typesController.text,
                        carNumber: carNumberController.text,
                        phoneNumber: phoneNumberController.text,
                        color: colorController.text,
                        brand: brandController.text,
                        category: categoryController.text,
                        distance: distanceController.text,
                        chassisNumber:chassisNumberController.text,
                        nextRepairDate:nextRepairDateController.text,
                        lastRepairDate:lastRepairDateController.text,
                        periodicRepairs:nonPeriodicRepairsController.text,
                        nonPeriodicRepairs:nonPeriodicRepairsController.text,
                        motorNumber:motorNumberController.text,
                      );
                    }
                  },
                  text: 'Add Client',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.20,
                    height: MediaQuery.sizeOf(context).height * 0.065,
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: const Color(0xFFF68B1E),
                    textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 3,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
            content: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              width: MediaQuery.sizeOf(context).width * 0.45,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text('Required User Info',style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonFormField<String>(
                                    items: allTypes.map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Type'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the type';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      typesController.text = value!;
                                      print(typesController.text);
                                    },
                                    autofocus: false,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: nameController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Name'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the name';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: phoneNumberController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Phone Number'),

                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the phone number';
                                      } else if (value.length < 10) {
                                        return 'The phone number is to short';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Required Car Info',style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: carNumberController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Car Number'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the Car number';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: chassisNumberController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Chassis Number'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the chassis number';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: motorNumberController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Motor Number'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the motor number';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: colorController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Color'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the color';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: brandController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Brand'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the brand';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: categoryController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Category'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the category';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    height: MediaQuery.sizeOf(context).height * 0.2,
                                    width: 350,
                                    child: YearPicker(
                                      firstDate: DateTime(1970),
                                      lastDate: DateTime.now(),
                                      selectedDate: AppCubit.get(context).time,
                                      onChanged: (value) {
                                        AppCubit.get(context).changDatePicker(value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              width: MediaQuery.sizeOf(context).width * 0.45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Text('Optional User Info',style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Email'),

                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('Optional Car Info',style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: distanceController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Distance'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      /*if (value!.isEmpty) {
                                    return 'please enter the distance';
                                  }*/
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text('For Old Clients',style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    onTap: (){
                                      showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2999),
                                        initialDate: DateTime.now(),
                                      ).then((value) {
                                        setState(() {
                                          if (value!=null) {
                                            nextRepairDateController.text =
                                            '${value.day.toString()}/${value.month.toString()}/${value.year.toString()}';
                                          }
                                        });
                                      });
                                    },

                                    controller: nextRepairDateController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Next Repair Date'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    onTap: (){
                                      showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2999),
                                        initialDate: DateTime.now(),
                                      ).then((value) {
                                        setState(() {
                                          if (value!=null) {
                                            lastRepairDateController.text =
                                            '${value.day.toString()}/${value.month.toString()}/${value.year.toString()}';
                                          }
                                        });
                                      });
                                    },
                                    controller: lastRepairDateController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Last Repair Date'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: periodicRepairsController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Periodic Repairs'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: nonPeriodicRepairsController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Non Periodic Repairs'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

  );
}