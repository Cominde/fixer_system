// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../components/custom/box_decoration.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class AddNewCarScreen extends StatefulWidget {
  final List<String> allTypes;
  final String userId;
  const AddNewCarScreen({super.key,required this.allTypes,required this.userId,});

  @override
  State<AddNewCarScreen> createState() => _AddNewCarScreenState();
}

class _AddNewCarScreenState extends State<AddNewCarScreen> {

  final _formKey = GlobalKey<FormState>();

  var typesController = TextEditingController();

  var carNumberController = TextEditingController();

  var chassisNumberController = TextEditingController();

  var colorController = TextEditingController();

  var brandController = TextEditingController();

  var categoryController = TextEditingController();

  var modelController = TextEditingController();

  var nextRepairDateController = TextEditingController();

  var lastRepairDateController = TextEditingController();

  var periodicRepairsController = TextEditingController();

  var nonPeriodicRepairsController = TextEditingController();


  var distanceController= TextEditingController();

  var motorNumberController = TextEditingController();

  var codeController = TextEditingController();

  bool automatic=true;

  String nextCode='';

  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    carNumberController = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('carNumberController'));
    colorController = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('colorController'));
    brandController = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('brandController'));
    categoryController = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('categoryController'));
    modelController = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('modelController'));
    distanceController = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('distanceController'));
    chassisNumberController = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('chassisNumberController'));
    nextRepairDateController  = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('nextRepairDateController'));
    lastRepairDateController  = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('lastRepairDateController'));
    periodicRepairsController  = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('periodicRepairsController').isEmpty ? '0' : AppCubit.get(context).loadAddCarOldValues('periodicRepairsController'));
    nonPeriodicRepairsController  = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('nonPeriodicRepairsController').isEmpty ? '0' : AppCubit.get(context).loadAddCarOldValues('nonPeriodicRepairsController'));
    motorNumberController  = TextEditingController(text: AppCubit.get(context).loadAddCarOldValues('motorNumberController'));

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return AlertDialog(
          alignment: Alignment.topCenter,
          surfaceTintColor: FlutterFlowTheme.of(context).primaryBackground,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          title: const Text(
            'Add Car',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          icon:IconButton(
            onPressed: () {

              /*carNumberController = TextEditingController();

              chassisNumberController = TextEditingController();

              colorController = TextEditingController();

              brandController = TextEditingController();

              categoryController = TextEditingController();


              nextRepairDateController = TextEditingController();

              lastRepairDateController = TextEditingController();

              periodicRepairsController = TextEditingController();

              nonPeriodicRepairsController = TextEditingController();

              distanceController = TextEditingController();

              motorNumberController = TextEditingController();*/

              AppCubit.get(context).saveAddCarOldValues(
                  carNumberController: carNumberController.text,
                  colorController: colorController.text,
                  brandController: brandController.text,
                  categoryController: categoryController.text,
                  modelController: modelController.text,
                  distanceController: distanceController.text,
                  chassisNumberController: chassisNumberController.text,
                  nextRepairDateController: nextRepairDateController.text,
                  lastRepairDateController: lastRepairDateController.text,
                  periodicRepairsController: periodicRepairsController.text,
                  nonPeriodicRepairsController: nonPeriodicRepairsController.text,
                  motorNumberController: motorNumberController.text
              );

              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close,color: FlutterFlowTheme.of(context).error,),
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            alignment: Alignment.centerRight,
          ),
          actions: [
            ConditionalBuilder(
              condition: state is AppAddCarLoadingState,
              builder: (context) =>  const Center(
                child: Padding(padding: EdgeInsets.all(40.0),
                  child: CircularProgressIndicator(),
                ),),


              fallback: (context) => FFButtonWidget(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AppCubit.get(context).addCar(context,
                      id: widget.userId,
                      carNumber: carNumberController.text,
                      color: colorController.text,
                      brand: brandController.text,
                      category: categoryController.text,
                      model: modelController.text,
                      distance:distanceController.text,
                      chassisNumber: chassisNumberController.text,
                      nextRepairDate: nextRepairDateController.text,
                      lastRepairDate: lastRepairDateController.text,
                      periodicRepairs: periodicRepairsController.text,
                      nonPeriodicRepairs: nonPeriodicRepairsController.text,
                      motorNumber: motorNumberController.text,
                      type: typesController.text,
                      manually:automatic?'False':'True',
                      carCode:codeController.text,
                    );
                  }
                },
                text: 'Add Car',
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
          content: Focus(
            onKey: (node, event) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              bool isTextFieldFocused = currentFocus.focusedChild is Focus && currentFocus.focusedChild!.context?.widget is EditableText;
              if (event is RawKeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.arrowUp && !isTextFieldFocused) {
                  _controller.animateTo(_controller.offset - 50, duration: const Duration(milliseconds: 300), curve: Curves.ease);
                  return KeyEventResult.handled;
                } else if (event.logicalKey == LogicalKeyboardKey.arrowDown && !isTextFieldFocused) {
                  _controller.animateTo(_controller.offset + 50, duration: const Duration(milliseconds: 300), curve: Curves.ease);
                  return KeyEventResult.handled;
                }
              }
              return KeyEventResult.ignored;
            },
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              width: MediaQuery.sizeOf(context).width * 0.43,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text('Required Car Info',style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonFormField<String>(
                                    items: widget.allTypes.map<DropdownMenuItem<String>>(
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
                                      if (value== null ||value.isEmpty) {
                                        return 'please enter the type';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) async {
                                      typesController.text = value!;
                                      codeController.text=await AppCubit.get(context).getTheNextClientCode(value);

                                      //print(typesController.text);
                                    },
                                    autofocus: false,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  Switch(
                                    value: automatic,
                                    onChanged: (value) {
                                      setState(() {
                                        automatic = value;
                                        //print(automatic);// Toggle the mode
                                      });
                                    },
                                    activeColor: Colors.black, // Background for dark mode
                                    activeTrackColor: Colors.orange, // Toggle track for dark mode
                                    inactiveThumbColor: Colors.black, // Background for light mode
                                    inactiveTrackColor: Colors.grey, // Toggle track for light mode
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Visibility(
                                    visible: !automatic,
                                    replacement: Text('Code assigned automatically',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                                    child: TextFormField(

                                      controller: codeController,
                                      obscureText: false,

                                      decoration:CustomInputDecoration.customInputDecoration(context, 'Code',pref: Text(typesController.text)),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(

                                        fontFamily: 'Outfit',
                                        color:
                                        FlutterFlowTheme.of(context).primaryText,

                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter the code';
                                        }
                                        return null;
                                      },


                                    ),
                                  ),
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
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Color',),
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
                                  TextFormField(
                                    controller: modelController,
                                    obscureText: false,
                                    decoration:CustomInputDecoration.customInputDecoration(context, 'Model'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the model';
                                      }
                                      return null;
                                    },
                                  ),
                                  /*YearPickerFormField(
                                    firstDate: DateTime(1970),
                                    lastDate: DateTime.now(),
                                    selectedDate: DateTime(2020),
                                    onChanged: (value) {
                                      AppCubit.get(context).changDatePicker(value);
                                      // Handle year change here
                                    },
                                  ),*/
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              width: MediaQuery.sizeOf(context).width * 0.43,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
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
                                            '${value.year.toString()}-${value.month.toString()}-${value.day.toString()}';
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
                                        firstDate: DateTime(2021),
                                        lastDate: DateTime(2999),
                                        initialDate: DateTime.now(),
                                      ).then((value) {
                                        setState(() {
                                          if (value!=null) {
                                            lastRepairDateController.text =
                                            '${value.year.toString()}-${value.month.toString()}-${value.day.toString()}';
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
          ),
        );
      },
    );
  }
}

