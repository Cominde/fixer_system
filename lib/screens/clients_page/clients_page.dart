import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/components/client_item_builder.dart';
import 'package:fixer_system/components/custom/box_decoration.dart';
import 'package:fixer_system/components/main_nav/main_nav.dart';
import 'package:fixer_system/screens/clients_page/add_client_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pager/pager.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import 'clients_page_model.dart';
export 'clients_page_model.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  late ClientsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    AppCubit.get(context).getUsers();
    super.initState();
    _model = createModel(context, () => ClientsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                wrapWithModel(
                  model: _model.mainNavModel,
                  updateCallback: () => setState(() {}),
                  child: MainNavWidget(
                    navOne: FlutterFlowTheme.of(context).secondaryText,
                    navTwo: const Color(0xFFF68B1E),
                    navThree: FlutterFlowTheme.of(context).secondaryText,
                    navFour: FlutterFlowTheme.of(context).secondaryText,
                    navFive: FlutterFlowTheme.of(context).secondaryText,
                    navSix: FlutterFlowTheme.of(context).secondaryText,
                    navSeven: FlutterFlowTheme.of(context).secondaryText,
                    navEight: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Container(
                                width: double.infinity,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Clients',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmall
                                                    .override(
                                                  fontFamily:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .displaySmallFamily,
                                                  letterSpacing: 0,
                                                  useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                      .containsKey(
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .displaySmallFamily),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  'Manage your clients below.',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodySmall
                                                      .override(
                                                    fontFamily:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .bodySmallFamily,
                                                    letterSpacing: 0,
                                                    useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                        .containsKey(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodySmallFamily),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                            ))
                                              Padding(
                                                padding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    0, 0, 12, 0),
                                                child: SizedBox(
                                                  width: 250,
                                                  height: 50,
                                                  child:TextFormField(
                                                    controller: searchController,
                                                    obscureText: false,
                                                    decoration: CustomInputDecoration.customInputDecoration(context,'Search'),
                                                    style: FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                      fontFamily: 'Outfit',
                                                      color:
                                                      FlutterFlowTheme.of(context).primaryText,
                                                    ),
                                                    onFieldSubmitted: (value) {
                                                      if (value.isNotEmpty) {
                                                        AppCubit.get(context).searchUsers(word: value);
                                                      }
                                                      else
                                                      {
                                                        AppCubit.get(context).getUsers();
                                                      }
                                                    },
                                                  ),

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 12, 0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .secondaryBackground,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color:
                                                        Color(0x33000000),
                                                        offset: Offset(
                                                          0,
                                                          2,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        16),
                                                  ),
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
                                                      Icons.person_add_rounded,
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .secondaryText,
                                                      size: 24,
                                                    ),
                                                    onPressed: () async {
                                                      AppCubit.get(context).getAllTypes();

                                                      showDialog(context: context, builder: (context) => addNewClientScreen(context, AppCubit.get(context).getAllTypesModel!.types));
                                                    },
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    Divider(
                                      height: 24,
                                      thickness: 1,
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Divider(
                                      height: 44,
                                      thickness: 1,
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                    ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Name',
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodySmall
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodySmallFamily,
                                                        letterSpacing:
                                                        0,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodySmallFamily),
                                                      ),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Expanded(
                                                      child: Text(
                                                        'Phone Number',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodySmall
                                                            .override(
                                                          fontFamily: FlutterFlowTheme.of(
                                                              context)
                                                              .bodySmallFamily,
                                                          letterSpacing:
                                                          0,
                                                          useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                              .containsKey(
                                                              FlutterFlowTheme.of(context)
                                                                  .bodySmallFamily),
                                                        ),
                                                      ),
                                                    ),


                                                ],
                                              ),
                                            ),
                                            ConditionalBuilder(
                                              condition:state is  AppGetUsersLoadingState||state is AppSearchUsersLoadingState,
                                              builder: (context) => const  Center(
              child: Padding(padding: EdgeInsets.all(40.0),
                 child: CircularProgressIndicator(),
                                            ),),
            
                                        
                                              fallback:(context) =>  ConditionalBuilder(
                                                condition:
                                                AppCubit.get(context)
                                                    .getUsersModel!
                                                    .users
                                                    .isEmpty,
                                                builder: (context) => Text(
                                                  'No Results',
                                                  style: TextStyle(
                                                      fontSize: 50,
                                                      color:
                                                      Colors.grey[300]),
                                                ),
                                                fallback: (context) =>
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional
                                                          .fromSTEB(0, 16, 0, 0),
                                                      child: ListView.builder(
                                                        padding: EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection: Axis.vertical,
                                                        physics: const BouncingScrollPhysics(),
                                                        itemBuilder: (context, index) => clientItemBuilder(context,AppCubit.get(context).getUsersModel!.users[index]),
                                                        itemCount: AppCubit.get(context).getUsersModel!.users.length,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Pager(
                                currentPage: AppCubit.get(context).getUsersModel!.current>0?AppCubit.get(context).getUsersModel!.current:1,
                                totalPages: AppCubit.get(context).getUsersModel!.pages>0?AppCubit.get(context).getUsersModel!.pages:1,
                                onPageChanged: (page) {
                                  setState(() {
                                    AppCubit.get(context).getUsersModel!.current = page;
                                    AppCubit.get(context).getUsers(page: page);
                                  });
                                },
                                numberButtonSelectedColor: const Color(0xffF68B1E),
                              ),
                            )
                          ],
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
    );
      },
    );
  }
}
