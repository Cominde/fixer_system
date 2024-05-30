
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../components/custom/box_decoration.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';


final _formKey = GlobalKey<FormState>();

var typeController = TextEditingController(text: list.first);


var amountController = TextEditingController();

const List<String> list = <String>['reward', 'penalty', 'loans'];

Future addRewardOrLoanScreen(context ,id) {

  return showDialog(context: context, builder:(context) =>
    StatefulBuilder(
      builder: (context, setState) =>BlocConsumer<AppCubit, AppCubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return AlertDialog(
            alignment: Alignment.center,
            surfaceTintColor: FlutterFlowTheme.of(context).primaryBackground,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            title: const Text(
              'Add reward or loans',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pop();

                typeController = TextEditingController();

                amountController = TextEditingController();

              },
              icon: Icon(Icons.close,color: FlutterFlowTheme.of(context).error,),
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              alignment: Alignment.centerRight,
            ),
            actions: [
              ConditionalBuilder(
                condition: state is AppAddRewardOrLoansLoadingState,
                builder: (context) => const  Center(
                  child: Padding(padding: EdgeInsets.all(40.0),
                    child: CircularProgressIndicator(),
                  ),),
                fallback: (context) => FFButtonWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      AppCubit.get(context).addRewardOrLoans(
                        context,
                        id: id,
                        type: typeController.text,
                        amount: int.parse(amountController.text),
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
            content: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all( 30),
                  width: MediaQuery.sizeOf(context).width * 0.40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: DropdownMenu<String>(
                          initialSelection: list.first,
                          onSelected: (String? value) {
                            setState(() {
                              typeController.text = value!;
                            });
                          },
                          dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(value: value, label: value);
                          }).toList(),
                        ),
                      ),

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
                            FlutterFlowTheme.of(context).tertiary,
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
          );
        },
      ),
    ),
  );
}
