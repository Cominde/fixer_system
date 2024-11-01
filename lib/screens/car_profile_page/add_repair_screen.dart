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

class AddRepairScreen extends StatefulWidget {
  final String carNumber;
  final String carId;
  const AddRepairScreen(this.carNumber,this.carId, {super.key});

  @override
  State<AddRepairScreen> createState() => _AddRepairScreenState();
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

class _AddRepairScreenState extends State<AddRepairScreen> {

  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> components = [
    {'id': '', 'quantity': 0, 'name':''}
  ];
  List<TextEditingController> componentsControllers = [TextEditingController()];
  List<FocusNode> componentsFocusNodes = [FocusNode()];
  List<Map<String, dynamic>> services = [
    {'name': '', 'price': 0, 'state': 'repairing'}
  ];
  List<Map<String, dynamic>> additions = [
    {'name': '', 'price': 0}
  ];
  String serviceType = 'nonPeriodic';
  String serviceState = 'repairing';
  String searchValue = '';


  double discount = 0;
  int daysItTake = 0;
  String nextPerDate = '';
  var nextRepairDateController = TextEditingController();




  var idController = TextEditingController();


  var note1Controller = TextEditingController();
  var note2Controller = TextEditingController();

  bool automatic=true;

  String nextCode='';



  var distanceController=TextEditingController();
  var nextRepairDistanceController = TextEditingController();

  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();


  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {
          if (state is AppAddRepairSuccessState)
            {
              AppCubit.get(context).getAllRepairsForSpecificCar(carId: widget.carId);
              Navigator.pop(context);
            }
        },
        builder: (context, state) {
          return Focus(
            onKey: (node, event) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              bool isTextFieldFocused = currentFocus.focusedChild is Focus && currentFocus.focusedChild!.context?.widget is EditableText;
              if (event is RawKeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.arrowUp && !isTextFieldFocused) {
                  _controller.animateTo(_controller.offset - 200, duration: const Duration(milliseconds: 30), curve: Curves.ease);
                  return KeyEventResult.handled;
                } else if (event.logicalKey == LogicalKeyboardKey.arrowDown && !isTextFieldFocused) {
                  _controller.animateTo(_controller.offset + 200, duration: const Duration(milliseconds: 30), curve: Curves.ease);
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
                  'Add Repair',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              floatingActionButton: ConditionalBuilder(
                condition: state is AppAddRepairLoadingState,
                builder: (context) => const CircularProgressIndicator(),
                fallback: (context) => FFButtonWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AppCubit.get(context).addRepair(
                        context,
                        carNumber: widget.carNumber,
                        additions: additions,
                        components: components,
                        daysItTake: daysItTake,
                        discount: discount,
                        services: services,
                        type: serviceType,
                        manually:!automatic,
                        id: idController.text,
                        note1: note1Controller.text,
                        note2: note2Controller.text,
                        distance:distanceController.text,
                        nextRepairDate: nextRepairDateController.text,
                        nextRepairDistance: nextRepairDistanceController.text,
                      );
                    }
                  },
                  text: 'Add Repair',
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
                                      widget.carNumber,
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
                        const SizedBox(height: 16.0),


                        const SizedBox(
                          height: 10,
                        ),
                        Switch(
                          value: automatic,
                          onChanged: (value) async {
                            if (value==true) {
                          idController.text = await AppCubit.get(context)
                              .getTheNextRepairCode();
                        }
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
                          replacement: const Text('ID assigned automatically',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold),),

                          child: TextFormField(
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
                                          //print(searchQuery);
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
                                            //print(components[i]);
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
                                            //print(components[i]);
                                            setState(() {
                                              componentsControllers[i] = TextEditingController(text: AppCubit.get(context).searchListOfInventoryComponentsModel!.data[index].name!);
                                              componentsFocusNodes[i].unfocus();
                                            });
                                          } else {
                                            components[i]['id']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data.first.id;
                                            components[i]['name']=AppCubit.get(context).searchListOfInventoryComponentsModel?.data.first.name;
                                            //print(components[i]);
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
                                            //print(components[i]);
                                            setState(() {
                                              componentsControllers[i] = TextEditingController(text: AppCubit.get(context).searchListOfInventoryComponentsModel!.data[index].name!);
                                              componentsFocusNodes[i].unfocus();
                                            });
                                          } else {
                                            components[i]['id']='';
                                            components[i]['name']='';
                                            //print(components[i]);
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
                                    initialValue: services[index]['name'],
                                    onChanged: (value) {
                                      setState(() {
                                        services[index]['name'] = value;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: TextFormField(
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
                                    initialValue:
                                        services[index]['price'].toString(),
                                    onChanged: (value) {
                                      setState(() {
                                        services[index]['price'] =
                                            int.parse(value);
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16.0),
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
                                      services.removeAt(index);
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
                                    initialValue: additions[index]['name'],
                                    onChanged: (value) {
                                      setState(() {
                                        additions[index]['name'] = value;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: TextFormField(
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
                                    initialValue:
                                        additions[index]['price'].toString(),
                                    onChanged: (value) {
                                      setState(() {
                                        additions[index]['price'] =
                                            int.parse(value);
                                      });
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
                                      additions.removeAt(index);
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please fill this field';
                                  }
                                  return null;
                                },
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
                                  setState(() {
                                    discount = double.parse(value);
                                  });
                                },
                              ),
                            ),

                            const SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please fill this field';
                                  }
                                  return null;
                                },
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please fill this field';
                                  }
                                  return null;
                                },
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please fill this field';
                                  }
                                  return null;
                                },
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
