import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/components/car_item_builder.dart';
import 'package:fixer_system/components/main_nav/main_nav.dart';
import 'package:fixer_system/cubit/cubit.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pager/pager.dart';

import '../../components/custom/box_decoration.dart';
import 'cars_page_model.dart';
export 'cars_page_model.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  late CarsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    AppCubit.get(context).getCars();
    super.initState();
    _model = createModel(context, () => CarsPageModel());
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
          onTap: () {
            _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus();

          },
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
                        navOne: const Color(0xFFF68B1E),
                        navTwo: FlutterFlowTheme.of(context).secondaryText,
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
                                                    'Cars',
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
                                                      'Manage your clients\'s cars below.',
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
                                                            AppCubit.get(context).searchCars(word: value);
                                                          }
                                                          else
                                                          {
                                                            AppCubit.get(context).getCars();
                                                          }
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
                                                        child: AutoSizeText(
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
                                                          child: AutoSizeText(
                                                            'Car Number',
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
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 0),
                                                  child:
                                                  ConditionalBuilder(
                                                      condition: state is AppGetAllCarsLoadingState||state is AppSearchCarsLoadingState,
                                                      builder: (context) => const  Center(
              child: Padding(padding: EdgeInsets.all(40.0),
                 child: CircularProgressIndicator(),
                                            ),),
            
                                        
                                                      fallback: (context) => ConditionalBuilder(
                                                        condition: AppCubit.get(context).getCarsModel!.data.isEmpty,
                                                        builder: (context) => Text('No Results',style: TextStyle(fontSize: 50,color: Colors.grey[300]),),
                                                        fallback: (context) =>ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection: Axis.vertical,
                                                          physics: const BouncingScrollPhysics(),
                                                          itemBuilder: (context, index) => carItemBuilder(context, AppCubit.get(context).getCarsModel!.data[index]),
                                                          itemCount: AppCubit.get(context).getCarsModel!.data.length,
                                                        ) ,),

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
                                    currentPage: AppCubit.get(context).getCarsModel!.current,
                                    totalPages: AppCubit.get(context).getCarsModel!.pages,
                                    onPageChanged: (page) {
                                      setState(() {
                                        AppCubit.get(context).getCarsModel!.current = page;
                                        AppCubit.get(context).getCars(page: page);
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
