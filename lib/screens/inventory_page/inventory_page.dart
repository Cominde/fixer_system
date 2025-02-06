import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/components/component_item_builder.dart';
import 'package:fixer_system/components/main_nav/main_nav.dart';
import 'package:fixer_system/cubit/cubit.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pager/pager.dart';

import 'add_component_screen.dart';
import 'inventory_page_model.dart';
export 'inventory_page_model.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  late InventoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getListOfComponents();
    _model = createModel(context, () => InventoryPageModel());
  }

  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    _model.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Focus(
          onKey: (node, event) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            bool isTextFieldFocused = currentFocus.focusedChild is Focus &&
                currentFocus.focusedChild!.context?.widget is EditableText;
            if (event is RawKeyDownEvent) {
              if (event.logicalKey == LogicalKeyboardKey.arrowUp &&
                  !isTextFieldFocused) {
                _controller.animateTo(_controller.offset - 50,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
                return KeyEventResult.handled;
              } else if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
                  !isTextFieldFocused) {
                _controller.animateTo(_controller.offset + 50,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
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
                          navThree: FlutterFlowTheme.of(context).secondaryText,
                          navFour: FlutterFlowTheme.of(context).secondaryText,
                          navFive: FlutterFlowTheme.of(context).secondaryText,
                          navSix: FlutterFlowTheme.of(context).secondaryText,
                          navSeven: const Color(0xFFF68B1E),
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
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 16, 0),
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
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 12, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Inventory',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmallFamily,
                                                                letterSpacing:
                                                                    0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .displaySmallFamily),
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0, 4, 0, 0),
                                                      child: Text(
                                                        'Manage your items below.',
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
                                                        width: 50,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0,
                                                                2,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        child:
                                                            FlutterFlowIconButton(
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
                                                            Icons.add_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24,
                                                          ),
                                                          onPressed: () async {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        const AddNewComponentPage());
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                borderRadius: 12,
                                                borderWidth: 1,
                                                buttonSize: 50,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                icon: Icon(
                                                  Icons.refresh_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24,
                                                ),
                                                onPressed: () {
                                                  AppCubit.get(context)
                                                      .getListOfComponents(
                                                          page: AppCubit.get(
                                                                  context)
                                                              .getListOfInventoryComponentsModel!
                                                              .current);
                                                },
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
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 12, 0, 0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                width: 1,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            12, 12, 12, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            'Name',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                              'Quantity',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodySmallFamily),
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
                                                              'Sell Price',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodySmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        Expanded(
                                                          child: Text(
                                                            'Operations',
                                                            textAlign:
                                                                TextAlign.end,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            0, 16, 0, 0),
                                                    child: ConditionalBuilder(
                                                      condition: state
                                                          is AppGetListOfComponentsLoadingState,
                                                      builder: (context) =>
                                                          const Center(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  40.0),
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                      ),
                                                      fallback: (context) =>
                                                          ConditionalBuilder(
                                                        condition: AppCubit.get(
                                                                context)
                                                            .getListOfInventoryComponentsModel!
                                                            .data
                                                            .isEmpty,
                                                        builder: (context) =>
                                                            Text(
                                                          'No Results',
                                                          style: TextStyle(
                                                              fontSize: 50,
                                                              color: Colors
                                                                  .grey[300]),
                                                        ),
                                                        fallback: (context) =>
                                                            Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0, 16, 0, 0),
                                                          child:
                                                              ListView.builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            physics:
                                                                const BouncingScrollPhysics(),
                                                            itemBuilder: (context,
                                                                    index) =>
                                                                componentItemBuilder(
                                                                    context,
                                                                    AppCubit.get(
                                                                            context)
                                                                        .getListOfInventoryComponentsModel!
                                                                        .data[index]),
                                                            itemCount: AppCubit
                                                                    .get(
                                                                        context)
                                                                .getListOfInventoryComponentsModel!
                                                                .data
                                                                .length,
                                                          ),
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
                                  if (state
                                      is! AppGetListOfComponentsLoadingState)
                                    Center(
                                      child: Pager(
                                        currentPage: AppCubit.get(context)
                                                    .getListOfInventoryComponentsModel!
                                                    .current >
                                                0
                                            ? AppCubit.get(context)
                                                .getListOfInventoryComponentsModel!
                                                .current
                                            : 1,
                                        totalPages: AppCubit.get(context)
                                                    .getListOfInventoryComponentsModel!
                                                    .pages >
                                                0
                                            ? AppCubit.get(context)
                                                .getListOfInventoryComponentsModel!
                                                .pages
                                            : 1,
                                        onPageChanged: (page) {
                                          setState(() {
                                            AppCubit.get(context)
                                                .getListOfInventoryComponentsModel!
                                                .current = page;
                                            AppCubit.get(context)
                                                .getListOfComponents(
                                                    page: page);
                                          });
                                        },
                                        numberButtonSelectedColor:
                                            const Color(0xffF68B1E),
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
          ),
        );
      },
    );
  }
}
