import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/components/bill_item_builder.dart';
import 'package:fixer_system/components/main_nav/main_nav.dart';
import 'package:fixer_system/cubit/cubit.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pager/pager.dart';

import 'bills_page_model.dart';
export 'bills_page_model.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({super.key});

  @override
  State<BillsPage> createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  late BillsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getCompletedRepairs();
    _model = createModel(context, () => BillsPageModel());
  }

  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    _model.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppCubitStates>(
        listener: (context, state) {

        },
        builder:(context, state) {

          return Focus(
            onKey: (node, event) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              bool isTextFieldFocused = currentFocus.focusedChild is Focus && currentFocus.focusedChild!.context?.widget is EditableText;
              if (event is RawKeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.arrowUp && !isTextFieldFocused) {
                  _controller.animateTo(_controller.offset - 200, duration: const Duration(milliseconds: 30), curve: Curves.ease);
                  return KeyEventResult.handled;
                } else if (event.logicalKey == LogicalKeyboardKey.arrowDown && !isTextFieldFocused) {
                  _controller.animateTo(_controller.offset + 200, duration: const Duration(milliseconds: 30), curve: Curves.ease);
                  return KeyEventResult.handled;
                }
              }
              return KeyEventResult.ignored;
            },
            child: GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: Row(
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
                          navThree: FlutterFlowTheme.of(context).secondaryText,
                          navFour: const Color(0xFFF68B1E),
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
                              controller: _controller,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 7,
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Bills',
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
                                                        'All repairs bills.',
                                                        style:
                                                        FlutterFlowTheme.of(context)
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
                                                  AppCubit.get(context).getCompletedRepairs(page: AppCubit.get(context).getCompletedRepairsModel!.current);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                        ))
                                          Divider(
                                            height: 44,
                                            thickness: 1,
                                            color:
                                            FlutterFlowTheme.of(context).lineColor,
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                        Divider(
                                            height: 24,
                                            thickness: 1,
                                            color:
                                            FlutterFlowTheme.of(context).lineColor,
                                          ),
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context).width,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              border: Border.all(
                                                color: FlutterFlowTheme.of(context)
                                                    .lineColor,
                                                width: 1,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                                        0, 0, 0, 12),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 3,
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional.fromSTEB(
                                                                12, 0, 0, 0),
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.max,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(0, 4, 0, 0),
                                                                  child: Text(
                                                                    'Car',
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
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                        ))
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsetsDirectional.fromSTEB(
                                                                  24, 0, 0, 0),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(0, 4, 0, 0),
                                                                    child: Text(
                                                                      'Car Code',
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
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                        ))
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsetsDirectional.fromSTEB(
                                                                  24, 0, 0, 0),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(0, 4, 0, 0),
                                                                    child: Text(
                                                                      'Owner',
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
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                        ))
                                                          Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsetsDirectional.fromSTEB(
                                                                  24, 0, 0, 0),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(0, 4, 0, 0),
                                                                    child: Text(
                                                                      'Paid on',
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
                                                          flex: 2,
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional.fromSTEB(
                                                                24, 0, 0, 0),
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.max,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(0, 4, 0, 0),
                                                                  child: Text(
                                                                    'Amount',
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
                                                      ],
                                                    ),
                                                  ),
                                                  ConditionalBuilder(
                                                    condition: state is AppGetCompletedRepairsLoadingState,
                                                    builder: (context) => const Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(40.0),
                                                        child: CircularProgressIndicator(),
                                                      ),
                                                    ),
                                                    fallback: (context) => ConditionalBuilder(
                                                      condition:
                                                      AppCubit.get(context)
                                                          .getCompletedRepairsModel!
                                                          .completedRepairs
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
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0, 16, 0, 0),
                                                            child: ListView.builder(
                                                              padding: EdgeInsets.zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection: Axis.vertical,
                                                              itemBuilder: (context, index) => BillItem(model: AppCubit.get(context).getCompletedRepairsModel!.completedRepairs[index],),

                                                              itemCount:AppCubit.get(context).getCompletedRepairsModel?.completedRepairs.length ,
                                                            ),
                                                          ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Pager(
                                                      currentPage: AppCubit.get(context).getCompletedRepairsModel!.current>0?AppCubit.get(context).getCompletedRepairsModel!.current:1,
                                                      totalPages: AppCubit.get(context).getCompletedRepairsModel!.pages>0?AppCubit.get(context).getCompletedRepairsModel!.pages:1,
                                                      onPageChanged: (page) {
                                                        setState(() {
                                                          AppCubit.get(context).getCompletedRepairsModel!.current = page;
                                                          AppCubit.get(context).getCompletedRepairs(page: page);
                                                        });
                                                      },
                                                      numberButtonSelectedColor: const Color(0xffF68B1E),
                                                    ),
                                                  )
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
