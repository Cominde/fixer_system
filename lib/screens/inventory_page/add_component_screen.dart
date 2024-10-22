import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../components/custom/box_decoration.dart';

class AddNewComponentPage extends StatefulWidget {
  const AddNewComponentPage({super.key});

  @override
  State<AddNewComponentPage> createState() => _AddNewComponentPageState();
}

class _AddNewComponentPageState extends State<AddNewComponentPage> {

  final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var quantityController = TextEditingController();

  var priceController = TextEditingController();

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AlertDialog(
          alignment: Alignment.topCenter,
          surfaceTintColor: FlutterFlowTheme.of(context).primaryBackground,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          title:const Text(
            'Add Component',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          icon: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close,color: FlutterFlowTheme.of(context).error,),
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            alignment: Alignment.centerRight,
          ),
          actions: [
            ConditionalBuilder(
              condition: state is AppAddComponentLoadingState,
              builder: (context) => const  Center(
                child: Padding(padding: EdgeInsets.all(40.0),
                  child: CircularProgressIndicator(),
                ),),


              fallback: (context) => FFButtonWidget(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    AppCubit.get(context).addComponent(context,
                      name: nameController.text,
                      quantity: quantityController.text,
                      price: priceController.text,
                    );
                  }
                },
                text: 'Add component',
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
                  _controller.animateTo(_controller.offset - 200, duration: const Duration(milliseconds: 30), curve: Curves.ease);
                  return KeyEventResult.handled;
                } else if (event.logicalKey == LogicalKeyboardKey.arrowDown && !isTextFieldFocused) {
                  _controller.animateTo(_controller.offset + 200, duration: const Duration(milliseconds: 30), curve: Curves.ease);
                  return KeyEventResult.handled;
                }
              }
              return KeyEventResult.ignored;
            },
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              width: MediaQuery.sizeOf(context).width * 0.45,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: nameController,
                                    obscureText: false,
                                    decoration: CustomInputDecoration.customInputDecoration(context,'name'),
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
                                    controller: quantityController,
                                    obscureText: false,
                                    decoration: CustomInputDecoration.customInputDecoration(context,'quantity'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the quantity';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: priceController,
                                    obscureText: false,
                                    decoration: CustomInputDecoration.customInputDecoration(context,'price'),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Outfit',
                                      color:
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter the price';
                                      }
                                      return null;
                                    },
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
