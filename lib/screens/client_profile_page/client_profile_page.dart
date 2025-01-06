import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../../components/client_car_item_builder.dart';
import '../../components/custom/box_decoration.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import 'add_car_screen.dart';

class ClientProfilePage extends StatefulWidget {
  const ClientProfilePage(this.userId, {super.key});
  final String userId;

  @override
  State<ClientProfilePage> createState() => _ClientDetailsState();
}

class _ClientDetailsState extends State<ClientProfilePage> {
  @override
  void initState() {
    //WidgetsFlutterBinding.ensureInitialized();

    AppCubit.get(context).getSpecificUser(userId: widget.userId);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneNumberController = TextEditingController();

  var passwordController = TextEditingController();

  final ScrollController _controller = ScrollController();

  int? _radioSelected = 1;
  bool readOnly = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {
        if (state is AppGetSpecificUserSuccessState) {
          nameController = TextEditingController(
              text: AppCubit.get(context).getSpecificUserModel?.name);

          emailController = TextEditingController(
              text: AppCubit.get(context).getSpecificUserModel?.email);

          phoneNumberController = TextEditingController(
              text: AppCubit.get(context).getSpecificUserModel?.phoneNumber);

          passwordController = TextEditingController(
              text: AppCubit.get(context).getSpecificUserModel?.password);

          _radioSelected =
              AppCubit.get(context).getSpecificUserModel!.active ? 1 : 2;
        } else if (state is AppUpdateUsersSuccessState) {
          readOnly = true;
        } else if (state is AppAddCarSuccessState) {
          setState(() {});
        } else if (state is AppDeleteCarSuccessState) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return Focus(
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
          child: Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: Container(
              alignment: Alignment.bottomRight,
              child: ConditionalBuilder(
                condition: state is AppUpdateUsersLoadingState,
                builder: (context) => const CircularProgressIndicator(),
                fallback: (context) => FlutterFlowIconButton(
                  borderRadius: 16,
                  buttonSize: 56,
                  fillColor: Theme
                      .of(context)
                      .primaryColor,
                  icon: readOnly == true
                      ? const Icon(Icons.edit_outlined)
                      : const Icon(
                    Icons.done,
                    size: 30,
                  ),
                  onPressed: () {
                    if (readOnly == true) {
                      setState(() {
                        readOnly = false;
                      });
                    } else if (formKey.currentState!.validate()) {
                      AppCubit.get(context).updateUser(
                        context,
                        email: emailController.text.toString(),
                        name: nameController.text.toString(),
                        phone: phoneNumberController.text.toString(),
                        id: widget.userId,
                      );
                    }
                  },
                ),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(66),
              child: AppBar(
                toolbarHeight: 66,
                leadingWidth: 66,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).lineColor,
                      borderRadius: 12,
                      borderWidth: 1,
                      buttonSize: 50,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        Icons.add_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24,
                      ),
                      onPressed: () async {
                        AppCubit.get(context).getAllTypes();

                        showDialog(
                            context: context,
                            builder: (context) =>
                                AddNewCarScreen(userId: widget.userId,allTypes: AppCubit.get(context).getAllTypesModel!.types));
                      },
                    ),
                  ),
                  Padding(
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
                        Icons.refresh_rounded,
                        color:
                        FlutterFlowTheme.of(
                            context)
                            .secondaryText,
                        size: 24,
                      ),
                      onPressed: () {
                        AppCubit.get(context).getSpecificUser(userId: widget.userId);
                      },
                    ),
                  ),
                ],
                title: const Text("Client Profile"),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).lineColor,
                    borderRadius: 12,
                    borderWidth: 1,
                    buttonSize: 50,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
            body: Form(
              key: formKey,
              child: ConditionalBuilder(
                condition: state is AppGetSpecificUserLoadingState,
                builder: (context) => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
                fallback: (context) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    controller: _controller,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      readOnly: readOnly,
                                      controller: nameController,
                                      obscureText: false,
                                      decoration: CustomInputDecoration
                                          .customInputDecoration(context, 'name'),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
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
                                      readOnly: readOnly,
                                      controller: emailController,
                                      obscureText: false,
                                      decoration: CustomInputDecoration
                                          .customInputDecoration(context, 'Email'),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter the Email';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [

                                    TextFormField(
                                      readOnly: readOnly,
                                      controller: phoneNumberController,
                                      obscureText: false,
                                      decoration: CustomInputDecoration
                                          .customInputDecoration(
                                              context, 'phone number'),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter the phone number';
                                        } else if (value.length < 10) {
                                          return 'The phone number is to short';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      readOnly: true,
                                      controller: passwordController,
                                      obscureText: false,
                                      decoration: CustomInputDecoration
                                          .customInputDecoration(
                                          context, 'Password'),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter the Password';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _radioSelected,
                                    onChanged: (value) {
                                      if (readOnly == false) {
                                        setState(() {
                                          _radioSelected = value;
                                        });
                                      }
                                    },
                                  ),
                                  const Text('Active'),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Radio(
                                    value: 2,
                                    groupValue: _radioSelected,
                                    onChanged: (value) {
                                      if (readOnly == false) {
                                        setState(() {
                                          _radioSelected = value;
                                        });
                                      }
                                    },
                                  ),
                                  const Text('Not Active'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ConditionalBuilder(
                              condition: state is AppGetSpecificUserLoadingState,
                              builder: (context) => const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(40.0),
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              fallback: (context) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.all(25),
                                  child: SizedBox(
                                    height: 250,
                                    child: ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          clientCarItemBuilder(
                                              context,
                                              AppCubit.get(context)
                                                      .getSpecificUserModel!
                                                      .cars[
                                                  index]), //AppCubit.get(context).getUsersModel!.users[index]),
                                      itemCount: AppCubit.get(context)
                                          .getSpecificUserModel!
                                          .cars
                                          .length,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),*/
                        Container(
                          padding: const EdgeInsets.all(35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Text(
                                  'All Cars',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              ConditionalBuilder(
                                condition: state is AppGetAllCarsLoadingState,
                                builder: (context) => const Center(
                                    child: CircularProgressIndicator()),
                                fallback: (context) =>  Column(
                                  children: List.generate(
                                    (AppCubit.get(context).getSpecificUserModel!.cars.length + 4) ~/ 5, // Number of rows needed
                                        (rowIndex) {
                                      int firstItemIndex = rowIndex * 5;
                                      int secondItemIndex = firstItemIndex + 1;
                                      int thirdItemIndex = secondItemIndex + 1;
                                      int fourthItemIndex = thirdItemIndex + 1;
                                      int fifthItemIndex = fourthItemIndex + 1;

                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: clientCarItemBuilder(context, AppCubit.get(context).getSpecificUserModel!.cars[firstItemIndex], firstItemIndex),
                                          ),
                                          if (secondItemIndex < AppCubit.get(context).getSpecificUserModel!.cars.length) ...[
                                            const SizedBox(width: 25),
                                            Expanded(
                                              child: clientCarItemBuilder(context, AppCubit.get(context).getSpecificUserModel!.cars[secondItemIndex], secondItemIndex),
                                            ),
                                          ],
                                          if (thirdItemIndex < AppCubit.get(context).getSpecificUserModel!.cars.length) ...[
                                            const SizedBox(width: 25),
                                            Expanded(
                                              child: clientCarItemBuilder(context, AppCubit.get(context).getSpecificUserModel!.cars[thirdItemIndex], thirdItemIndex),
                                            ),
                                          ],
                                          if (fourthItemIndex < AppCubit.get(context).getSpecificUserModel!.cars.length) ...[
                                            const SizedBox(width: 25),
                                            Expanded(
                                              child: clientCarItemBuilder(context, AppCubit.get(context).getSpecificUserModel!.cars[fourthItemIndex], fourthItemIndex),
                                            ),
                                          ],
                                          if (fifthItemIndex < AppCubit.get(context).getSpecificUserModel!.cars.length) ...[
                                            const SizedBox(width: 25),
                                            Expanded(
                                              child: clientCarItemBuilder(context, AppCubit.get(context).getSpecificUserModel!.cars[fifthItemIndex], fifthItemIndex),
                                            ),
                                          ],
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
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
  }
}
