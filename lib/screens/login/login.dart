
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/cubit/cubit.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:fixer_system/screens/verify_page/verify_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/custom/box_decoration.dart';
import '../forget_password_page/forget_password_page.dart';
import '../set_first_time_page/set_first_time_page.dart';
import 'login_model.dart';
export 'login_model.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginModel _model;

  var formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> _savedEmails = [];
  List<String> _suggestions = [];
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
    _loadEmails();
  }

  void _loadEmails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedEmails = prefs.getStringList('emails');
    if (savedEmails != null) {
      setState(() {
        _savedEmails = savedEmails;
      });
    }
    //print(savedEmails);
  }

  void _saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!_savedEmails.contains(email)) {
      _savedEmails.add(email);
      await prefs.setStringList('emails', _savedEmails);
    }
  }

  void _filterEmails(String input) {
    setState(() {
      _suggestions = _savedEmails
          .where((email) => email.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
    //print(_suggestions);
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
        if (state is AppLoginVerifyState) {
          _saveEmail(_model.textController1.text);
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 0),
              reverseDuration: const Duration(milliseconds: 0),
              child: VerifyPage(_model),
            ),
          );
        }
        else if (state is AppLoginFirstTimeState)
          {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 0),
                reverseDuration: const Duration(milliseconds: 0),
                child: const SetFirstTimePage(),
              ),
            );
          }
      },

      builder: (context, state) {
        return Form(
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          height: _suggestions.isNotEmpty&&_model.textFieldFocusNode1!.hasFocus?120:null,
                          child: Stack(
                            children: [
                              TextFormField(
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
                                onChanged: (value) {
                                  _filterEmails(value); // Filter suggestions as user types
                                },
                              ),
                              if (_suggestions.isNotEmpty&&_model.textFieldFocusNode1!.hasFocus)
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 60, // Adjust the top position based on TextFormField height
                                  child: SizedBox(
                                    height: 60,
                                    child: Material(
                                      elevation: 4.0,
                                      child: ListView.builder(
                                        controller: _controller,
                                        itemCount: _suggestions.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(_suggestions[index]),
                                            onTap: () {
                                              setState(() {
                                                _model.textController1.text = _suggestions[index];
                                                _suggestions.clear(); // Hide suggestions once selected
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                            ],
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
                              labelText: 'password',
                              labelStyle:
                              FlutterFlowTheme
                                  .of(context)
                                  .labelMedium
                                  .override(
                                fontFamily: FlutterFlowTheme
                                    .of(context)
                                    .labelMediumFamily,
                                color: const Color(0xFFF68B1E),
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
                                return 'Please Enter your password';
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
                          condition: state is AppLoginLoadingState,
                          builder: (context) =>
                          const Center(
                            child: Padding(padding: EdgeInsets.all(40.0),
                              child: CircularProgressIndicator(),
                            ),),

                          fallback: (context) =>
                              FFButtonWidget(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    AppCubit.get(context).login(context,
                                        email: _model.textController1.text,
                                        password: _model.textController2.text);
                                  }
                                },
                                text: 'Login',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Forgotten password? '),
                          TextButton(onPressed: (){
                            Navigator.push(context,  PageTransition(
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 0),
                              reverseDuration: const Duration(milliseconds: 0),
                              child:const ForgetPasswordPage (),
                            ),);
                          }, child: const Text('Reset Password',style: TextStyle(color: Colors.orange),))

                        ],
                      )
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





