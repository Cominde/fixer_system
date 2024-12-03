import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:fixer_system/screens/login/login.dart';
import 'package:fixer_system/screens/new_update.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'cubit/cubit.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool? updatedApp;
  @override
  void initState() {
    get(Uri.parse('https://fixer-backend-rtw4.onrender.com/api/V1/appVersion')).then((value) {
      setState(() {
        updatedApp = json.decode(value.body)[1]['version'].toString() == "1.6.2";
      });
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterFlowTheme.of(context).primary = const Color(0xFFF68B1E);
    return BlocProvider(

        create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppCubitStates>(
        listener: (context, state) {        },
        builder: (context, state) {
          return  AdaptiveTheme(
            light: ThemeData(
              colorScheme: const ColorScheme.light(primary: Colors.deepOrange),

              useMaterial3: true,
              brightness: Brightness.light,

            ),
            dark: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorScheme: const ColorScheme.dark(primary: Colors.deepOrange),

            ),
            initial: AdaptiveThemeMode.light,
            builder: (theme, darkTheme) => MaterialApp(
              title: 'Fixer',
              theme: theme,
              darkTheme: darkTheme,
              debugShowCheckedModeBanner: false,
              home: updatedApp == null ? const Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              ) : (updatedApp! ? const Login() : const NewUpdateScreen()),
            ),
          );
        },
      ),
    );

  }
}
