import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:searchfield/searchfield.dart';

import '../../components/custom/box_decoration.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../models/get_specific_car_model.dart';

class UpdateRepairScreen extends StatefulWidget {
  final RepairData? model;
  const UpdateRepairScreen(this.model, {super.key});

  @override
  State<UpdateRepairScreen> createState() => _UpdateRepairScreenState();
}


enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

class _UpdateRepairScreenState extends State<UpdateRepairScreen> {

  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> components = [
    {'id': '', 'quantity': 0, 'name':''}
  ];
  List<Map<String, dynamic>> removedComponents = [];
  List<TextEditingController> componentsControllers = [TextEditingController()];
  List<FocusNode> componentsFocusNodes = [FocusNode()];

  List<Map<String, dynamic>> services = [
    {'name': '', 'price': 0, 'state': 'repairing'}
  ];
  List<TextEditingController> servicesNameControllers = [TextEditingController()];
  List<FocusNode> servicesNameFocusNodes = [FocusNode()];
  List<TextEditingController> servicesPriceControllers = [TextEditingController()];
  List<FocusNode> servicesPriceFocusNodes = [FocusNode()];
  List<Map<String, dynamic>> removedServices = [];

  List<Map<String, dynamic>> additions = [
    {'name': '', 'price': 0}
  ];
  List<TextEditingController> additionsNameControllers = [TextEditingController()];
  List<FocusNode> additionsNameFocusNodes = [FocusNode()];
  List<TextEditingController> additionsPriceControllers = [TextEditingController()];
  List<FocusNode> additionsPriceFocusNodes = [FocusNode()];
  List<Map<String, dynamic>> removedAdditions = [];

  String serviceType = 'nonPeriodic';
  String serviceState = 'repairing';
  String searchValue = '';


  int discount = 0;
  int daysItTake = 0;
  String nextPerDate = '';
  var nextRepairDateController = TextEditingController();

  int totalBalance = 0;

  var idController = TextEditingController();


  var note1Controller = TextEditingController();
  var note2Controller = TextEditingController();

  bool automatic=true;

  String nextCode='';



  var distanceController=TextEditingController();
  var nextRepairDistanceController = TextEditingController();

  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();

  void calculateTotalBalance() {
    totalBalance = 0;
    for (var component in components) {
      totalBalance += ((component['quantity'] as int) * (component['price']*1.0 as double)).toInt();
    }
    for (var service in services) {

      totalBalance += (service['price']*1.0 as double).toInt();
    }
    for (var addition in additions) {
      totalBalance += (addition['price']*1.0 as double).toInt();
    }
    totalBalance -= (discount*1.0).toInt();
  }


  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    components=[];
    componentsControllers=[];
    componentsFocusNodes=[];
    for (var element in widget.model!.components) {
      components.add( {'id': element.id, 'quantity': element.quantity, 'name':element.name});
      componentsControllers.add(TextEditingController(text: element.name));
      componentsFocusNodes.add(FocusNode());
    }


    services=[];
    servicesNameControllers=[];
    servicesNameFocusNodes=[];
    servicesPriceControllers=[];
    servicesPriceFocusNodes=[];
    widget.model?.services.forEach((element) {
      services.add( {'name': element.name, 'price': element.price, 'state': element.state, 'id': element.id});
      servicesNameControllers.add(TextEditingController(text: element.name));
      servicesPriceControllers.add(TextEditingController(text: '${element.price!.toInt()}'));
      servicesNameFocusNodes.add(FocusNode());
      servicesPriceFocusNodes.add(FocusNode());
    },);


    additions=[];
    additionsNameControllers=[];
    additionsNameFocusNodes=[];
    additionsPriceControllers=[];
    additionsPriceFocusNodes=[];
    widget.model?.additions.forEach((element) {
      additions.add( {'name': element.name, 'price': element.price, 'id': element.id});
      additionsNameControllers.add(TextEditingController(text: element.name));
      additionsPriceControllers.add(TextEditingController(text: '${element.price!.toInt()}'));
      additionsNameFocusNodes.add(FocusNode());
      additionsPriceFocusNodes.add(FocusNode());
    },);


     serviceType = widget.model!.type!;


     discount = widget.model!.discount!;
     daysItTake = widget.model!.expectedDate!.difference(DateTime.now()).inDays;

     note1Controller.text=widget.model!.note1??'';
     note2Controller.text=widget.model!.note2??'';
     distanceController.text="${widget.model!.distance??''}";
    nextRepairDistanceController.text="${widget.model!.nextRepairDistance??''}";

    nextRepairDateController.text="${widget.model!.nextRepairDate??''}";

    idController.text="${widget.model!.genId}";

    calculateTotalBalance();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Focus(
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
            child: Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                title: const Text(
                  'Update Repair',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              floatingActionButton: ConditionalBuilder(
                condition: state is AppUpdateRepairLoadingState,
                builder: (context) => const CircularProgressIndicator(),
                fallback: (context) => FFButtonWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      List<Map<String, dynamic>> allComponents = [
                        ...components,
                        ...removedComponents,
                      ];
                      List<Map<String, dynamic>> allServices = [
                        ...services,
                        ...removedServices,
                      ];
                      List<Map<String, dynamic>> allAdditions = [
                        ...additions,
                        ...removedAdditions,
                      ];
                      AppCubit.get(context).updateRepair(
                        context,
                        additions: allAdditions,
                        components: allComponents,
                        daysItTake: daysItTake,
                        discount: discount,
                        services: allServices,
                        type: serviceType,
                        manually:!automatic,
                        id: widget.model!.id!,
                        genid: idController.text,
                        note1: note1Controller.text,
                        note2: note2Controller.text,
                        distance:distanceController.text,
                        nextRepairDate: nextRepairDateController.text,
                        nextRepairDistance: nextRepairDistanceController.text,
                      );
                    }
                  },
                  text: 'Update Repair',
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
              body: SingleChildScrollView(
                controller: _controller,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 250,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Text(
                                    "EGYPT           مصر",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                      color: Colors.black,

                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    width: 250,
                                    height: 71,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          widget.model!.carNumber!,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 2,
                                            color: Colors.black,

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Total Price',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  totalBalance.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    color: Color(0xFFF68B1E),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 16.0),


                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: idController,
                          obscureText: false,

                          decoration:CustomInputDecoration.customInputDecoration(context, 'code'),
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
                        const SizedBox(
                          height: 10,
                        ),


                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Components',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: components.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 15,),
                          itemBuilder: (context, i) {
                            //AppCubit.get(context).getListOfComponents();

                            return Row(
                              children: <Widget>[
                                Expanded(
                                    child: SearchField(
                                      onSearchTextChanged: (searchQuery) {
                                        AppCubit.get(context).searchComponents(word: searchQuery);
                                        return AppCubit.get(context).searchListOfInventoryComponentsModel!.data.map((e) => SearchFieldListItem(e.name!,item: e)).toList();
                                      },
                                      emptyWidget: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("No Results"),
                                      ),
                                      suggestions: AppCubit.get(context).searchListOfInventoryComponentsModel!.data.map((e) => SearchFieldListItem(e.name!,item: e)).toList(),
                                      onSuggestionTap: (searchItem) {
                                        int index = AppCubit.get(context).searchListOfInventoryComponentsModel?.data.indexOf(searchItem.item!)??-1;
                                        if(index != -1){
                                          components[i]['id']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data[index].id;
                                          components[i]['name']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data[index].name;
                                          setState(() {
                                            componentsControllers[i] = TextEditingController(text: AppCubit.get(context).searchListOfInventoryComponentsModel!.data[index].name!);
                                            componentsFocusNodes[i].unfocus();
                                          });
                                        }
                                      },
                                      onSubmit: (searchQuery) {
                                        int index = AppCubit.get(context).searchListOfInventoryComponentsModel?.data.indexWhere((element) => element.name == searchQuery)??-1;
                                        if(index != -1){
                                          components[i]['id']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data[index].id;
                                          components[i]['name']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data[index].name;
                                          setState(() {
                                            componentsControllers[i] = TextEditingController(text: AppCubit.get(context).searchListOfInventoryComponentsModel!.data[index].name!);
                                            componentsFocusNodes[i].unfocus();
                                          });
                                        } else {
                                          components[i]['id']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data.first.id;
                                          components[i]['name']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data.first.name;
                                          setState(() {
                                            componentsControllers[i] = TextEditingController(text: AppCubit.get(context).searchListOfInventoryComponentsModel!.data.first.name!);
                                            componentsFocusNodes[i].unfocus();
                                          });
                                        }
                                      },
                                      onTapOutside: (_) {
                                        int index = AppCubit.get(context).searchListOfInventoryComponentsModel?.data.indexWhere((element) => element.name == componentsControllers[i].text)??-1;
                                        if(index != -1){
                                          components[i]['id']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data[index].id;
                                          components[i]['name']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data[index].name;
                                          setState(() {
                                            componentsControllers[i] = TextEditingController(text: AppCubit.get(context).searchListOfInventoryComponentsModel!.data[index].name!);
                                            componentsFocusNodes[i].unfocus();
                                          });
                                        } else {
                                          components[i]['id']='';
                                          components[i]['name']='';
                                          setState(() {
                                            componentsControllers[i] = TextEditingController();
                                            componentsFocusNodes[i].unfocus();
                                          });
                                        }
                                      },
                                      controller: componentsControllers[i],
                                      searchInputDecoration: SearchInputDecoration(
                                        labelText: 'Search',
                                        labelStyle: FlutterFlowTheme
                                            .of(context)
                                            .bodySmall
                                            .override(
                                          fontFamily: 'Outfit',
                                          color: const Color(0xFFF68B1E),
                                        ),
                                        hintStyle:
                                        FlutterFlowTheme
                                            .of(context)
                                            .bodySmall,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme
                                                .of(context)
                                                .alternate,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFF68B1E),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        /*filled: true,*/
                                        /*fillColor: Colors.white,*/
                                        contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 0, 24),
                                      ),
                                      showEmpty: false,
                                      suggestionsDecoration: SuggestionDecoration(
                                        border: Border.all(color: FlutterFlowTheme.of(context).primaryText),
                                        borderRadius: BorderRadius.circular(8),
                                        padding: const EdgeInsets.all(8),
                                        hoverColor: Theme.of(context).hoverColor,
                                      ),
                                      focusNode: componentsFocusNodes[i],
                                    )
                                ),
                                const SizedBox(width: 16.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 12,
                                      buttonSize: 40,
                                      fillColor: Theme
                                          .of(context)
                                          .primaryColor,
                                      icon: const Icon(Icons.remove,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          if (components[i]['quantity'] > 1) {
                                            components[i]['quantity']--;
                                          }
                                        });
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          '${components[i]['quantity']}',
                                          style: const TextStyle(fontSize: 30)),
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 12,
                                      buttonSize: 40,
                                      fillColor: Theme
                                          .of(context)
                                          .primaryColor,
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          components[i]['quantity'] += 1;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16.0),
                                FlutterFlowIconButton(
                                  borderRadius: 12,
                                  buttonSize: 40,
                                  fillColor: Theme
                                      .of(context)
                                      .primaryColor,
                                  icon: const Icon(Icons.delete_forever_rounded,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      components[i]['quantity'] = 0;
                                      removedComponents.add(components[i]);
                                      components.removeAt(i);
                                      componentsFocusNodes.removeAt(i);
                                      componentsControllers.removeAt(i);
                                    });
                                  },
                                ),
                              ],


                            );
                          },
                        ),
                        if (components.isEmpty || components.last['id'].toString().isNotEmpty)Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (components.isEmpty || components.last['id'].toString().isNotEmpty) {
                                setState(() {
                                  components.add({'id': '', 'quantity': 0, 'name': ''});
                                  componentsControllers.add(TextEditingController());
                                  componentsFocusNodes.add(FocusNode());
                                });
                              }
                            },
                            child: const Text('Add Component'),
                          ),
                        ),
                        const SizedBox(height: 16.0),

                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Services',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: services.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: servicesNameControllers[index],
                                    focusNode: servicesNameFocusNodes[index],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'please fill this field';
                                      }
                                      return null;
                                    },
                                    decoration: CustomInputDecoration
                                        .customInputDecoration(context, 'Name'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        services[index]['name'] = servicesNameControllers[index].text;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: TextFormField(
                                    controller: servicesPriceControllers[index],
                                    focusNode: servicesPriceFocusNodes[index],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'please fill this field';
                                      }
                                      return null;
                                    },
                                    decoration: CustomInputDecoration
                                        .customInputDecoration(context, 'Price'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        setState(() {
                                          services[index]['price'] = 0;
                                          calculateTotalBalance();
                                        });
                                      } else {
                                        setState(() {
                                          services[index]['price'] = int.parse(value);
                                          calculateTotalBalance();
                                        });
                                      }
                                    },
                                  ),
                                ),
                                /*const SizedBox(width: 16.0),
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    decoration: CustomInputDecoration
                                        .customInputDecoration(context, 'State'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    value: services[index]['state'],
                                    onChanged: (value) {
                                      setState(() {
                                        services[index]['state'] = value!;
                                      });
                                    },
                                    items: ['completed', 'repairing']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                  ),
                                ),*/
                                const SizedBox(width: 16.0),
                                FlutterFlowIconButton(
                                  borderRadius: 12,
                                  buttonSize: 40,
                                  fillColor: Theme
                                      .of(context)
                                      .primaryColor,
                                  icon: const Icon(Icons.delete_forever_rounded,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      services[index]["remove"]=true;
                                      removedServices.add(services[index]);
                                      services.removeAt(index);
                                      servicesNameControllers.removeAt(index);
                                      servicesNameFocusNodes.removeAt(index);
                                      servicesPriceControllers.removeAt(index);
                                      servicesPriceFocusNodes.removeAt(index);
                                      calculateTotalBalance();
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 15,),

                        ),
                        if (services.isEmpty || services.last['name'].toString().isNotEmpty)Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (services.isEmpty || services.last['name'].toString().isNotEmpty) {
                                setState(() {
                                  services.add({
                                    'name': '',
                                    'price': 0,
                                    'state': 'repairing'
                                  });
                                  servicesNameControllers.add(TextEditingController());
                                  servicesNameFocusNodes.add(FocusNode());
                                  servicesPriceControllers.add(TextEditingController());
                                  servicesPriceFocusNodes.add(FocusNode());
                                  calculateTotalBalance();
                                });
                              }
                            },
                            child: const Text('Add Service'),
                          ),
                        ),
                        const SizedBox(height: 16.0),

                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Additions',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: additions.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 15,),

                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: additionsNameControllers[index],
                                    focusNode: additionsNameFocusNodes[index],
                                    /*validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'please fill this field';
                                      }
                                      return null;
                                    },*/
                                    decoration: CustomInputDecoration
                                        .customInputDecoration(context, 'Name'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        additions[index]['name'] = additionsNameControllers[index].text;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: TextFormField(
                                    controller: additionsPriceControllers[index],
                                    focusNode: additionsPriceFocusNodes[index],
                                    /*validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'please fill this field';
                                      }
                                      return null;
                                    },*/
                                    decoration: CustomInputDecoration
                                        .customInputDecoration(context, 'Price'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        setState(() {
                                          additions[index]['price'] = 0;
                                          calculateTotalBalance();
                                        });
                                      } else {
                                        setState(() {
                                          additions[index]['price'] = int.parse(value);
                                          calculateTotalBalance();
                                        });
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                FlutterFlowIconButton(
                                  borderRadius: 12,
                                  buttonSize: 40,
                                  fillColor: Theme
                                      .of(context)
                                      .primaryColor,
                                  icon: const Icon(Icons.delete_forever_rounded,
                                      color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      additions[index]["remove"]=true;
                                      removedAdditions.add(additions[index]);
                                      additions.removeAt(index);
                                      additionsNameControllers.removeAt(index);
                                      additionsNameFocusNodes.removeAt(index);
                                      additionsPriceControllers.removeAt(index);
                                      additionsPriceFocusNodes.removeAt(index);
                                      calculateTotalBalance();
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        if (additions.isEmpty || additions.last['name'].toString().isNotEmpty)Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (additions.isEmpty || additions.last['name'].toString().isNotEmpty) {
                                setState(() {
                                  additions.add({'name': '', 'price': 0});
                                  additionsNameControllers.add(TextEditingController());
                                  additionsNameFocusNodes.add(FocusNode());
                                  additionsPriceControllers.add(TextEditingController());
                                  additionsPriceFocusNodes.add(FocusNode());
                                  calculateTotalBalance();
                                });
                              }
                            },
                            child: const Text('Add Addition'),
                          ),
                        ),
                        const SizedBox(height: 16.0),

                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Properties',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                decoration: CustomInputDecoration
                                    .customInputDecoration(context, 'Type'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                ),
                                value: serviceType,
                                onChanged: (value) {
                                  setState(() {
                                    serviceType = value!;
                                  });
                                },
                                items: ['nonPeriodic', 'periodic']
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                /*validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please fill this field';
                                  }
                                  return null;
                                },*/
                                decoration: CustomInputDecoration
                                    .customInputDecoration(
                                    context, 'Discount'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                ),
                                initialValue: discount.toString(),
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    setState(() {
                                      discount = 0;
                                      calculateTotalBalance();
                                    });
                                  } else {
                                    setState(() {
                                      discount = int.parse(value);
                                      calculateTotalBalance();
                                    });
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                /*validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please fill this field';
                                  }
                                  return null;
                                },*/
                                decoration: CustomInputDecoration
                                    .customInputDecoration(
                                    context, 'Days It Takes'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                ),
                                initialValue: daysItTake.toString(),
                                onChanged: (value) {
                                  setState(() {
                                    daysItTake = int.parse(value);
                                  });
                                },
                              ),
                            ),

                            const SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                controller: distanceController,
                                /*validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please fill this field';
                                  }
                                  return null;
                                },*/
                                decoration: CustomInputDecoration
                                    .customInputDecoration(
                                    context, 'Distance'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                ),

                              ),
                            ),

                            const SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                controller: nextRepairDistanceController,
                                /*validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please fill this field';
                                  }
                                  return null;
                                },*/
                                decoration: CustomInputDecoration
                                    .customInputDecoration(
                                    context, 'Next Repair Distance'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                ),

                              ),
                            ),

                            const SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
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
                            ),
                          ],
                        ),

                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: note1Controller,
                          obscureText: false,
                          maxLines: 3,
                          minLines: 3,

                          decoration:CustomInputDecoration.customInputDecoration(context, 'Important Things'),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Outfit',
                            color:
                            FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),

                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: note2Controller,
                          obscureText: false,
                          maxLines: 3,
                          minLines: 3,

                          decoration:CustomInputDecoration.customInputDecoration(context, 'Notes'),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            fontFamily: 'Outfit',
                            color:
                            FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        const SizedBox(height: 80,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
