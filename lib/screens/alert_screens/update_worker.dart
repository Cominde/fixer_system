
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../models/get_workers_model.dart';

Widget UpdateWorkerPage(context,Worker model) {

  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var phoneNumberController = TextEditingController();

  var IDNumberController = TextEditingController();

  var jobTitleController=TextEditingController();

  var salaryController=TextEditingController();

  nameController=TextEditingController(text: model.name);
  phoneNumberController=TextEditingController(text: model.phoneNumber.toString());
  IDNumberController=TextEditingController(text: model.IDNumber.toString());
  jobTitleController=TextEditingController(text: model.jobTitle.toString());
  salaryController=TextEditingController(text:model.salary.toString());
  return BlocConsumer<AppCubit, AppCubitStates>(
    listener: (context, state) {},
    builder: (context, state) {
      return AlertDialog(
        alignment: Alignment.topCenter,
        title:const Text(
          'Update Worker',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        icon: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        actions: [
          ConditionalBuilder(
            condition: state is AppUpdateWorkerLoadingState,
            builder: (context) => const Center(child: CircularProgressIndicator()),
            fallback: (context) => FFButtonWidget(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  AppCubit.get(context).updateWorker(context,
                    name: nameController.text,
                    IDNumber: IDNumberController.text,
                    jobTitle: jobTitleController.text,
                    phoneNumber: phoneNumberController.text,
                    salary: salaryController.text,
                    id:model.id,
                  );
                }
              },
              text: 'Update Worker',
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
                                decoration: InputDecoration(
                                  labelText: 'name',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDBE2E7),
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

                                  contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
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
                                decoration: InputDecoration(
                                  labelText: 'quantity',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDBE2E7),
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

                                  contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
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
                                controller: IDNumberController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'price',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDBE2E7),
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

                                  contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the price';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: jobTitleController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'job title',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDBE2E7),
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

                                  contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
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
                                controller: salaryController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'salary',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFFF68B1E),
                                  ),
                                  hintStyle:
                                  FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFDBE2E7),
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

                                  contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).tertiary,
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
      );
    },
  );
}