import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/screens/car_profile_page/add_repair_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../components/repair_item_builder.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../components/custom/box_decoration.dart';



class CarProfilePage extends StatefulWidget {
  const CarProfilePage(this.carId, {super.key});
  final String carId;
  @override
  State<CarProfilePage> createState() => _CarProfilePageState();
}

class _CarProfilePageState extends State<CarProfilePage> {

  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();

  TextEditingController idController = TextEditingController();

  TextEditingController carNumberController = TextEditingController();

  TextEditingController carChassisNumberController = TextEditingController();

  TextEditingController colorController = TextEditingController();

  TextEditingController stateController = TextEditingController();

  TextEditingController brandController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  TextEditingController modelController = TextEditingController();

  TextEditingController generatedCodeController = TextEditingController();

  TextEditingController periodicRepairsController = TextEditingController();

  TextEditingController nonPeriodicRepairsController = TextEditingController();

  TextEditingController repairingController = TextEditingController();

  TextEditingController distanceController = TextEditingController();

  TextEditingController motorNumberController = TextEditingController();

  TextEditingController nextRepairDateController = TextEditingController();

  TextEditingController lastRepairDateController = TextEditingController();

  bool readOnly = true;
  var formKey = GlobalKey<FormState>();
  DateTime? nextRepairDate;
  DateTime? lastRepairDate;

  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getSpecificCarById(carId: widget.carId);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    idController.dispose();
    carNumberController.dispose();
    carChassisNumberController.dispose();
    colorController.dispose();
    stateController.dispose();
    brandController.dispose();
    categoryController.dispose();
    modelController.dispose();
    generatedCodeController.dispose();
    periodicRepairsController.dispose();
    nonPeriodicRepairsController.dispose();
    repairingController.dispose();
    distanceController.dispose();
    motorNumberController.dispose();
    nextRepairDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {
          // print(state.toString());
      if (state is AppGetSpecificCarSuccessState) {
        idController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.id);
        carNumberController = TextEditingController(
            text:
                AppCubit.get(context).getSpecificCarModel?.carData?.carNumber);
        carChassisNumberController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.chassisNumber);
        colorController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.color);
        stateController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.state);
        brandController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.brand);
        categoryController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.category);
        modelController = TextEditingController(
            text: AppCubit.get(context).getSpecificCarModel?.carData?.model);
        generatedCodeController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.generatedCode);

        periodicRepairsController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.periodicRepairs
                ?.toString());
        nonPeriodicRepairsController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.nonPeriodicRepairs
                ?.toString());
        repairingController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.repairing
                ?.toString());
        distanceController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.distance
                ?.toString());
        motorNumberController = TextEditingController(
            text: AppCubit.get(context)
                .getSpecificCarModel
                ?.carData
                ?.motorNumber);
        nextRepairDateController = TextEditingController(
          text: '${(AppCubit.get(context).getSpecificCarModel?.carData?.nextRepairDate?.day)??'-'}/${(AppCubit.get(context).getSpecificCarModel?.carData?.nextRepairDate?.month)??'-'}/${(AppCubit.get(context).getSpecificCarModel?.carData?.nextRepairDate?.year)??'-'}',
        );
        lastRepairDateController = TextEditingController(
            text: '${(AppCubit.get(context).getSpecificCarModel?.carData?.lastRepairDate?.day)??'-'}/${(AppCubit.get(context).getSpecificCarModel?.carData?.lastRepairDate?.month)??'-'}/${(AppCubit.get(context).getSpecificCarModel?.carData?.lastRepairDate?.year)??'-'}',
        );
        nextRepairDate=AppCubit.get(context).getSpecificCarModel?.carData?.nextRepairDate;
        lastRepairDate=AppCubit.get(context).getSpecificCarModel?.carData?.lastRepairDate;

      }
      else if (state is AppUpdateCarSuccessState)
        {
          setState(() {
          readOnly=true;
          });
        }
      else if (state is AppChangeServiceStateSuccessState){
        setState(() {

        });

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
          floatingActionButton: Container(
            alignment: Alignment.bottomRight,
            child: ConditionalBuilder(
              condition: state is AppUpdateCarLoadingState,
              builder: (context) => const CircularProgressIndicator(),
              fallback: (context) => FloatingActionButton(
                onPressed: () {
                  if (readOnly == true) {
                    setState(() {
                      readOnly = false;
                    });
                  } else if (formKey.currentState!.validate()) {
                    AppCubit.get(context).updateCar(
                      context,
                      carId: widget.carId,
                      carNumber: carNumberController.text,
                      color: colorController.text,
                      state: stateController.text,
                      brand: brandController.text,
                      category: categoryController.text,
                      model: modelController.text,
                      periodicRepairs: periodicRepairsController.text,
                      nonPeriodicRepairs: nonPeriodicRepairsController.text,
                      repairing: repairingController.text,
                      distance: distanceController.text,
                      lastRepair: lastRepairDate,
                      motorNumber: motorNumberController.text,
                      nextRepair:nextRepairDate ,

                    );
                  }
                },
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                heroTag: 'edit car info',
                child: readOnly == true
                    ? const Icon(Icons.edit_outlined)
                    : const Icon(
                        Icons.done,
                        size: 30,
                      ),
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            toolbarHeight: 66,
            leadingWidth: 66,
            title: const Text(
              'Car profile',
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlutterFlowIconButton(
                  borderColor:
                  FlutterFlowTheme.of(
                      context)
                      .lineColor,
                  borderRadius: 12,
                  borderWidth: 1,
                  buttonSize: 50,
                  fillColor: FlutterFlowTheme
                      .of(context)
                      .secondaryBackground,
                  icon: Icon(
                    Icons.car_repair_rounded,
                    color:
                    FlutterFlowTheme.of(
                        context)
                        .secondaryText,
                    size: 24,
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddRepairScreen(AppCubit.get(context)
                            .getSpecificCarModel!
                            .carData!
                            .carNumber!,AppCubit.get(context)
                            .getSpecificCarModel!
                            .carData!
                            .id!),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlutterFlowIconButton(
                  borderColor:
                  FlutterFlowTheme.of(
                      context)
                      .lineColor,
                  borderRadius: 12,
                  borderWidth: 1,
                  buttonSize: 50,
                  fillColor: FlutterFlowTheme
                      .of(context)
                      .secondaryBackground,
                  icon: Icon(
                    Icons.refresh_rounded,
                    color:
                    FlutterFlowTheme.of(
                        context)
                        .secondaryText,
                    size: 24,
                  ),
                  onPressed: () {
                    AppCubit.get(context).getSpecificCarById(carId: widget.carId);
                  },
                ),
              ),

            ],
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlutterFlowIconButton(
                borderColor:
                FlutterFlowTheme.of(
                    context)
                    .lineColor,
                borderRadius: 12,
                borderWidth: 1,
                buttonSize: 50,
                fillColor: FlutterFlowTheme
                    .of(context)
                    .secondaryBackground,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color:
                  FlutterFlowTheme.of(
                      context)
                      .secondaryText,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          body: Form(
            key: formKey,
            child: ConditionalBuilder(
              condition: state is AppGetSpecificCarLoadingState,
              builder: (context) => const  Center(
                child: Padding(padding: EdgeInsets.all(40.0),
                   child: CircularProgressIndicator(),
                                              ),),
              fallback: (context) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _controller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Container(
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
                                      carNumberController.text,
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
                      ),
                      Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30),
                            width: MediaQuery.sizeOf(context).width * 0.45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: carChassisNumberController,
                                  readOnly:readOnly,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Car Chassis Number'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: colorController,
                                  readOnly:readOnly,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Color'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: stateController,
                                  readOnly:true,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'State'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: brandController,
                                  readOnly:readOnly,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Brand'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: categoryController,
                                  readOnly:readOnly,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Category'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: modelController,
                                  readOnly:readOnly,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Model'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: generatedCodeController,
                                  readOnly:true,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Generated Code'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),

                              ],
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30),
                            width: MediaQuery.sizeOf(context).width * 0.45,
                            child: Column(
                              children: [
                               TextFormField(
                                  controller: periodicRepairsController,
                                  readOnly:readOnly,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Periodic Repairs'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: nonPeriodicRepairsController,
                                  readOnly:readOnly,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Non-Periodic Repairs'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: repairingController,
                                  readOnly:true,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Repairing'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: distanceController,
                                  readOnly:readOnly,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Distance'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  controller: motorNumberController,
                                  readOnly:readOnly,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Motor Number'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  onTap: () {
                                    if (readOnly==false)
                                    {
                                      showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2999),
                                        initialDate: DateTime.now(),
                                      ).then((value) {
                                        setState(() {
                                          if (value!=null) {
                                            lastRepairDate=value;
                                            lastRepairDateController.text =
                                          '${value.day.toString()}/${value.month.toString()}/${value.year.toString()}';
                                          }
                                        });
                                      });
                                    }
                                  },
                                  controller: lastRepairDateController,
                                  readOnly:readOnly,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'last Repair Date'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                                TextFormField(
                                  onTap: () {
                                    if (readOnly==false)
                                    {
                                      showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.utc(2999,30,24,60,60),
                                        initialDate: DateTime.now(),
                                      ).then((value) {
                                        setState(() {
                                          if (value!=null) {
                                            nextRepairDateController.text ='${value.day.toString()}/${value.month.toString()}/${value.year.toString()}';
                                            nextRepairDate=value;
                                          }
                                        });
                                      });
                                    }
                                  },

                                  controller: nextRepairDateController,
                                  readOnly:readOnly,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Next Repair Date'),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                const SizedBox(height: 16.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Text(
                                'All Repaires',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            ConditionalBuilder(
                              condition: state is AppGetAllCarsLoadingState,
                              builder: (context) => const Center(
                                  child: CircularProgressIndicator()),
                              fallback: (context) =>  Column(
                                children: List.generate(
                                  (AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs.length + 1) ~/ 2, // Number of rows needed
                                      (rowIndex) {
                                    int firstItemIndex = rowIndex * 2;
                                    int secondItemIndex = firstItemIndex + 1;

                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: repairItemBuilder(
                                            context,
                                            AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs[firstItemIndex],
                                          ),
                                        ),
                                        if (secondItemIndex < AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs.length)
                                          const SizedBox(width: 25), // Add spacing between items
                                        if (secondItemIndex < AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs.length)
                                          Expanded(
                                            child: repairItemBuilder(
                                              context,
                                              AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs[secondItemIndex],
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
