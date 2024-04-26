
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/components/main_nav/main_nav.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../components/repairing_car_item_builder.dart';
import '../../cubit/cubit.dart';
import 'cars_in_garage_page_model.dart';
export 'cars_in_garage_page_model.dart';

class CarsInGaragePage extends StatefulWidget {
  const CarsInGaragePage({super.key});

  @override
  State<CarsInGaragePage> createState() => _CarsInGaragePageState();
}

class _CarsInGaragePageState extends State<CarsInGaragePage> {
  late CarsInGaragePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    AppCubit.get(context).getRepairingCars();
    super.initState();
    _model = createModel(context, () => CarsInGaragePageModel());
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
        listener: (context, state) {

        },
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
                          navTwo: FlutterFlowTheme.of(context).secondaryText,
                          navThree: FlutterFlowTheme.of(context).alternate,
                          navFour: FlutterFlowTheme.of(context).secondaryText,
                          navFive: FlutterFlowTheme.of(context).secondaryText,
                          navSix: FlutterFlowTheme.of(context).secondaryText,
                          navSeven: FlutterFlowTheme.of(context).secondaryText,
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
                                                      'Cars in garage',
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
                                                        'Manage your clients\'s cars in your center below.',
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
                                                      child: Container(
                                                        width: 250,
                                                        height: 50,
                                                        child:TextFormField(
                                                          controller: searchController,
                                                          obscureText: false,
                                                          decoration: InputDecoration(
                                                            labelText: 'Search',
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
                                                            filled: true,
                                                            fillColor: Colors.white,
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
                                                          onFieldSubmitted: (value) {
                                                            if (value.isNotEmpty) {
                                                              AppCubit.get(context).searchRepairingCars(word: value);
                                                            }
                                                            else
                                                            {
                                                              AppCubit.get(context).getRepairingCars();
                                                            }
                                                          },
                                                        ),

                                                      ),
                                                    ),

                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
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
                                                            Icons.car_repair_rounded,
                                                            color:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .secondaryText,
                                                            size: 24,
                                                          ),
                                                          onPressed: () async {

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
                                                            'Car',
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
                                                              'Car ID',
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
                                                        ))
                                                          Expanded(
                                                            child: Text(
                                                              'Car Code',
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
                                                        ))
                                                          Expanded(
                                                            child: Text(
                                                              'Owner',
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
                                                        ))
                                                          Expanded(
                                                            child: Text(
                                                              'Repair Percentage',
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
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(0, 16, 0, 0),
                                                    child:ConditionalBuilder(
                                                      condition: state is AppGetRepairingCarsLoadingState||state is AppSearchRepairingCarsLoadingState,
                                                      builder: (context) => const Center(child: CircularProgressIndicator()),
                                                      fallback:(context) =>ListView.separated(
                                                        padding: EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection: Axis.vertical,
                                                        itemBuilder: (context, index) =>//Container(color: Colors.grey,),
                                                             repairingCarItemBuilder(context,AppCubit.get(context).getRepairingCarsModel!.data[index]),
                                                        itemCount: AppCubit.get(context).getRepairingCarsModel!.data.length,
                                                        separatorBuilder: (context, index) => Container(color: Colors.grey[400],width: double.infinity,height: 1,),
                                                      ),  ),
                                                      
                                                  ),
                                                ],
                                              ),
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
