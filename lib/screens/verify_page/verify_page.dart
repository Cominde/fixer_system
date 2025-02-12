import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/components/show_toast_function/show_toast_function.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:fixer_system/screens/cars_page/cars_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../cubit/cubit.dart';
import '../login/login.dart';

class VerifyPage extends StatefulWidget {
  final LoginModel _model;
  const VerifyPage(this._model, {super.key});




  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppCubitStates>(
        listener: (context, state) {
            if (state is AppLoginSuccessState)
              {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 0),
                      reverseDuration: const Duration(milliseconds: 0),
                      child: const CarsPage(),
                    ),
                );
              }
            else if (state is AppLoginErrorState||state is AppLoginVerifyState){
              Navigator.pop(context);
              showToast('Failed to Login', TType.error);
            }
        },
        builder:(context, state) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                    Navigator.pushReplacement(context, PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 0),
                      reverseDuration: const Duration(milliseconds: 0),
                      child: const Login(),
                    ),
                    );

                  },
                ),
              ),
            ),
            body:  Center(
              heightFactor: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('verification email sent to ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                         Text(' ${widget._model.textController1.text}',style: const TextStyle(fontSize: 25,color: Colors.orange),),

                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Press the following button after verifying it or to resend the email',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  ),
              ConditionalBuilder(
                condition: state is AppLoginLoadingState,
                builder: (context) =>  const Center(
                  child: Padding(padding: EdgeInsets.all(40.0),
                    child: CircularProgressIndicator(),
                  ),),

                fallback: (context) => FFButtonWidget(
                  onPressed: () {
                      AppCubit.get(context).login(context, email: widget._model.textController1.text, password: widget._model.textController2.text);
                  },
                  text: 'Login',
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
              ),
            ),
          );
        },
    );
  }
}
