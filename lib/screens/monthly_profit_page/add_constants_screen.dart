import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/custom/box_decoration.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';


final _formKey = GlobalKey<FormState>();

var typeController = TextEditingController(text: list.keys.first);

final ScrollController _controller = ScrollController();


var amountController = TextEditingController();

const Map<String,String> list= {
  'rent': "rent",
  'electricity': "electricity_bill",
  'water': "water_bill",
  'gas': "gas_bill",
};

Future addConstantsScreen(context ,year,month) {

  return showDialog(context: context, builder:(context) =>
      StatefulBuilder(
        builder: (context, setState) {
          return BlocConsumer<AppCubit, AppCubitStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return AlertDialog(
              alignment: Alignment.center,
              surfaceTintColor: FlutterFlowTheme.of(context).primaryBackground,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              title: const Text(
                'Add Constant',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  amountController = TextEditingController();
                },
                icon: Icon(Icons.close,color: FlutterFlowTheme.of(context).error,),
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                alignment: Alignment.centerRight,
              ),
              actions: [
                ConditionalBuilder(
                  condition: state is AppAddConstantLoadingState,
                  builder: (context) => const  Center(
                    child: Padding(padding: EdgeInsets.all(40.0),
                      child: CircularProgressIndicator(),
                    ),),
                  fallback: (context) => FFButtonWidget(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {

                        AppCubit.get(context).putConstant(
                          context,
                          title: list[typeController.text]!,
                          amount: amountController.text,
                          year: year,
                          month: month,
                        );
                      }
                    },
                    text: 'Add',
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
                      child: Container(
                        padding: const EdgeInsets.all( 30),
                        width: MediaQuery.sizeOf(context).width * 0.40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: FlutterFlowDropDown(
                                initialOption: list.keys.first,
                                options: list.keys.toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    typeController.text = value!;
                                  });
                                },
                                width: 150,
                                height: 56,
                                textStyle:
                                FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily:
                                  FlutterFlowTheme.of(
                                      context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0,
                                  useGoogleFonts: GoogleFonts
                                      .asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(
                                          context)
                                          .bodyMediumFamily),
                                ),
                                hintText: 'Select type',
                                icon: Icon(
                                  Icons
                                      .keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(
                                      context)
                                      .secondaryText,
                                  size: 24,
                                ),
                                fillColor:
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2,
                                borderColor:
                                FlutterFlowTheme.of(context)
                                    .secondaryText,
                                borderWidth: 2,
                                borderRadius: 8,
                                margin:
                                const EdgeInsetsDirectional
                                    .fromSTEB(16, 4, 16, 4),
                                hidesUnderline: true,
                              ),
                            ),
                            /*Expanded(

                              child: DropdownMenu<String>(
                                initialSelection: list.keys.first,
                                onSelected: (String? value) {
                                  setState(() {
                                    typeController.text = value!;
                                  });
                                },
                                dropdownMenuEntries: list.keys.map<DropdownMenuEntry<String>>((String value) {
                                  return DropdownMenuEntry<String>(value: value, label: value);
                                }).toList(),
                              ),
                            ),*/

                            const SizedBox(
                              width: 10,
                            ),

                            Expanded(
                              child: TextFormField(
                                controller: amountController,
                                obscureText: false,
                                decoration: CustomInputDecoration.customInputDecoration(context,'Amount'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).primaryText,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the amount';
                                  }
                                  return null;
                                },
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
          },
        );
        },
      ),
  );
}
