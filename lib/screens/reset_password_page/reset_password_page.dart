
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/cubit/cubit.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/custom/box_decoration.dart';
import '../login/login.dart';
import '../login/login_model.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late LoginModel _model;

  var formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {
        if (state is AppResetPasswordSuccessState) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 0),
              reverseDuration: const Duration(milliseconds: 0),
              child: const Login(),
            ),
          );
        }
      },

      builder: (context, state) {
        return GestureDetector(
          onTap: () =>
          _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            child: Scaffold(

              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme
                  .of(context)
                  .primaryBackground,
              body: SafeArea(
                top: true,
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0, 0, 0, 75),
                        child: Hero(
                          tag: 'logo',
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/51.png',
                              width: MediaQuery
                                  .sizeOf(context)
                                  .width * 0.5,
                              height: MediaQuery
                                  .sizeOf(context)
                                  .width * 0.25,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            8, 8, 8, 0),
                        child: SizedBox(
                          width: MediaQuery
                              .sizeOf(context)
                              .width * 0.3,
                          child: TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: true,
                            autofillHints: const [AutofillHints.email],
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: CustomInputDecoration
                                .customInputDecoration(context, 'email'),


                            style: FlutterFlowTheme
                                .of(context)
                                .bodyMedium
                                .override(
                              fontFamily:
                              FlutterFlowTheme
                                  .of(context)
                                  .bodyMediumFamily,
                              letterSpacing: 0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme
                                      .of(context)
                                      .bodyMediumFamily),
                            ),
                            minLines: null,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter your Email';
                              }
                              return null;
                            },

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            8, 8, 8, 0),
                        child: SizedBox(
                          width: MediaQuery
                              .sizeOf(context)
                              .width * 0.3,
                          child: TextFormField(
                            controller: _model.textController3,
                            focusNode: _model.textFieldFocusNode3,
                            autofocus: true,
                            autofillHints: const [AutofillHints.email],
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: CustomInputDecoration
                                .customInputDecoration(context, 'otp'),


                            style: FlutterFlowTheme
                                .of(context)
                                .bodyMedium
                                .override(
                              fontFamily:
                              FlutterFlowTheme
                                  .of(context)
                                  .bodyMediumFamily,
                              letterSpacing: 0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme
                                      .of(context)
                                      .bodyMediumFamily),
                            ),
                            minLines: null,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter the otp';
                              }
                              return null;
                            },

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            8, 8, 8, 0),
                        child: SizedBox(
                          width: MediaQuery
                              .sizeOf(context)
                              .width * 0.3,
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            autofocus: true,
                            textInputAction: TextInputAction.done,
                            obscureText: !_model.passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'New password',
                              labelStyle:
                              FlutterFlowTheme
                                  .of(context)
                                  .labelMedium
                                  .override(
                                fontFamily: FlutterFlowTheme
                                    .of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0,
                                useGoogleFonts: GoogleFonts.asMap()
                                    .containsKey(FlutterFlowTheme
                                    .of(context)
                                    .labelMediumFamily),
                              ),
                              hintStyle:
                              FlutterFlowTheme
                                  .of(context)
                                  .labelMedium
                                  .override(
                                fontFamily: FlutterFlowTheme
                                    .of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0,
                                useGoogleFonts: GoogleFonts.asMap()
                                    .containsKey(FlutterFlowTheme
                                    .of(context)
                                    .labelMediumFamily),
                              ),
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
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              suffixIcon: InkWell(
                                onTap: () =>
                                    setState(
                                          () =>
                                      _model.passwordVisibility =
                                      !_model.passwordVisibility,
                                    ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 20,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme
                                .of(context)
                                .bodyMedium
                                .override(
                              fontFamily:
                              FlutterFlowTheme
                                  .of(context)
                                  .bodyMediumFamily,
                              letterSpacing: 0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme
                                      .of(context)
                                      .bodyMediumFamily),
                            ),
                            minLines: null,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter your new password';
                              }
                              return null;
                            },

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            8, 12, 8, 8),
                        child: ConditionalBuilder(
                          condition: state is AppResetPasswordLoadingState,
                          builder: (context) =>
                          const Center(
                            child: Padding(padding: EdgeInsets.all(40.0),
                              child: CircularProgressIndicator(),
                            ),),

                          fallback: (context) =>
                              FFButtonWidget(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    AppCubit.get(context).resetPassword(context,
                                        email: _model.textController1.text,
                                        otp: _model.textController3.text,
                                        password: _model.textController2.text);
                                  }
                                },
                                text: 'Reset',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding: const EdgeInsetsDirectional
                                      .fromSTEB(0, 0, 0, 0),
                                  color: const Color(0xFFF68B1E),
                                  textStyle: FlutterFlowTheme
                                      .of(context)
                                      .titleSmall
                                      .override(
                                    fontFamily:
                                    FlutterFlowTheme
                                        .of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    letterSpacing: 0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                        FlutterFlowTheme
                                            .of(context)
                                            .titleSmallFamily),
                                  ),
                                  elevation: 3,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),

                              ),
                        ),
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
}





