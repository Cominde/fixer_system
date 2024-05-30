
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../components/custom/box_decoration.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../models/get_workers_model.dart';

Widget updateTypePage(context,Worker model) {

  final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var keyController = TextEditingController();

  nameController=TextEditingController(text: model.name);
  keyController=TextEditingController(text: model.phoneNumber.toString());

  return BlocConsumer<AppCubit, AppCubitStates>(
    listener: (context, state) {},
    builder: (context, state) {
      return AlertDialog(
        alignment: Alignment.topCenter,
        surfaceTintColor: FlutterFlowTheme.of(context).primaryBackground,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        title:const Text(
          'Update Type',
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
            condition: state is AppUpdateWorkerLoadingState,
            builder: (context) => const  Center(
              child: Padding(padding: EdgeInsets.all(40.0),
                child: CircularProgressIndicator(),
              ),),


            fallback: (context) => FFButtonWidget(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  /*AppCubit.get(context).updateWorker(context,
                    name: nameController.text,
                    IDNumber: idNumberController.text,
                    jobTitle: jobTitleController.text,
                    phoneNumber: phoneNumberController.text,
                    salary: salaryController.text,
                    id:model.id!,
                  );*/
                }
              },
              text: 'Update Type',
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
            key: formKey,
            child: SingleChildScrollView(
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
                                controller: keyController,
                                obscureText: false,
                                enabled: false,
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
                                    return 'please enter the key';
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
      );
    },
  );
}