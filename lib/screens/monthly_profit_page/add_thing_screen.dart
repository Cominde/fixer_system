
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../components/custom/box_decoration.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';


final _formKey = GlobalKey<FormState>();

var titleController = TextEditingController();

var dateController= TextEditingController();

var priceController = TextEditingController();

final ScrollController _controller = ScrollController();


Widget addThingScreen(context,bool plus) {


  return BlocConsumer<AppCubit, AppCubitStates>(
    listener: (context, state) {},
    builder: (context, state) {
      return AlertDialog(

        alignment: Alignment.topRight,
        surfaceTintColor: FlutterFlowTheme.of(context).primaryBackground,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        title: plus ? const Text(
          'Add Thing',
          style: TextStyle(
            fontSize: 25,
          ),
        ) : const Text(
          'Subtract Thing',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        icon: IconButton(
          onPressed: () {
            Navigator.of(context).pop();

            titleController = TextEditingController();

            dateController=TextEditingController();

            priceController = TextEditingController();


          },
          icon: Icon(Icons.close,color: FlutterFlowTheme.of(context).error,),
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          alignment: Alignment.centerRight,
        ),
        actions: [
          ConditionalBuilder(
            condition: state is AppAddThingLoadingState,
            builder: (context) => const  Center(
              child: Padding(padding: EdgeInsets.all(40.0),
                child: CircularProgressIndicator(),
              ),),


            fallback: (context) => FFButtonWidget(
              onPressed: () {
                if (_formKey.currentState!.validate()) {

                  AppCubit.get(context).addThing(
                    context,
                    title: titleController.text,
                    price: int.parse(priceController.text),
                    plus: plus,
                    date:dateController.text,
                  );
                }
              },
              text: 'Add Thing',
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
            key: _formKey,
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
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            width: MediaQuery.sizeOf(context).width * 0.70,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: titleController,
                                  obscureText: false,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'title'),

                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Outfit',
                                    color:
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter the title';
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
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Price'),



                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Outfit',
                                    color:
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter the Price';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: dateController,
                                  obscureText: false,
                                  decoration: CustomInputDecoration.customInputDecoration(context,'Date '),



                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Outfit',
                                    color:
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter the date';
                                    }
                                    return null;
                                  },
                                  onTap:() {
                                    showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2024),
                                      lastDate: DateTime(2999),
                                      initialDate: DateTime.now(),
                                    ).then((value) {
                                      dateController.text =
                                          '${value?.year.toString()}-${value?.month.toString()}-${value?.day.toString()}';
                                    });
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
