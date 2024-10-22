import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/components/main_nav/main_nav.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:fixer_system/screens/monthly_profit_page/add_constants_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/month_work_item_builder.dart';
import '../../cubit/cubit.dart';
import 'add_thing_screen.dart';
import 'monthly_profit_page_model.dart';
export 'monthly_profit_page_model.dart';

class MonthlyProfitPage extends StatefulWidget {
  const MonthlyProfitPage({super.key});

  @override
  State<MonthlyProfitPage> createState() => _MonthlyProfitPageState();
}

class _MonthlyProfitPageState extends State<MonthlyProfitPage> {
  late MonthlyProfitPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentYear = DateTime.now().year;

  bool isExpanded = true;
  bool isExpanded2 = true;
  bool isExpanded3 = true;

  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getMainPrams(
        year: DateTime.now().year.toString(),
        month: DateTime.now().month.toString());
    AppCubit.get(context).getMonthWork( year: DateTime.now().year.toString(),
        month: DateTime.now().month.toString());
    _model = createModel(context, () => MonthlyProfitPageModel());
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
      listener: (context, state) {

      },
      builder: (context, state) {
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
                          navSix: const Color(0xFFF68B1E),
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16, 24, 16, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 12, 0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Month Profit',
                                                      style: FlutterFlowTheme.of(
                                                              context)
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
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              0, 4, 0, 0),
                                                      child: Text(
                                                        'Please check the latest payments and your balance below.',
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
                                                        decoration: BoxDecoration(
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
                                                            Icons.receipt_long_rounded,
                                                            color: FlutterFlowTheme
                                                                .of(context)
                                                                .secondaryText,
                                                            size: 24,
                                                          ),
                                                          onPressed: () async {
                                                             addConstantsScreen(context, _model.dropDownValue1!.toString(),  _model.dropDownValue2!.toString());

                                                          },
                                                        ),
                                                      ),
                                                    ),
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
                                                        decoration: BoxDecoration(
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
                                                            Icons.remove_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24,
                                                          ),
                                                          onPressed: () async {
                                                            showDialog(context: context, builder: (context) => addThingScreen(context,false),);

                                                          },
                                                        ),
                                                      ),
                                                    ),
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
                                                        decoration: BoxDecoration(
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
                                                            showDialog(context: context, builder: (context) => addThingScreen(context,true),);

                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 8, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(8, 0, 8, 0),
                                                child: FlutterFlowDropDown(
                                                  initialOption: DateTime.now().year.toString(),
                                                  options: List.generate(
                                                      currentYear - 2023 + 1,
                                                      (index) => (2023 + index)
                                                          .toString()),
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                          .dropDownValue1 = val),
                                                  width: 150,
                                                  height: 56,
                                                  textStyle:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumFamily),
                                                          ),
                                                  hintText: 'Select year',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(context)
                                                          .secondaryBackground,
                                                  elevation: 2,
                                                  borderColor:
                                                      FlutterFlowTheme.of(context)
                                                          .secondaryText,
                                                  borderWidth: 2,
                                                  borderRadius: 8,
                                                  margin:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(16, 4, 16, 4),
                                                  hidesUnderline: true,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(8, 0, 8, 0),
                                                child: FlutterFlowDropDown(
                                                  initialOption: DateTime.now().month.toString(),
                                                  options: List.generate(
                                                      12,
                                                      (index) =>
                                                          (1 + index).toString()),
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                          .dropDownValue2 = val),
                                                  width: 150,
                                                  height: 56,
                                                  textStyle:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumFamily),
                                                          ),
                                                  hintText: 'Select month',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(context)
                                                          .secondaryBackground,
                                                  elevation: 2,
                                                  borderColor:
                                                      FlutterFlowTheme.of(context)
                                                          .secondaryText,
                                                  borderWidth: 2,
                                                  borderRadius: 8,
                                                  margin:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(16, 4, 16, 4),
                                                  hidesUnderline: true,
                                                ),
                                              ),
                                              const Expanded(
                                                child: SizedBox()
                                              ),
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                              ))
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
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
                                                    child: ConditionalBuilder(
                                                        condition: state is AppGetMainPramsLoadingState,
                                                        builder: (context) => const CircularProgressIndicator(),
                                                        fallback:(context) => FlutterFlowIconButton(
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
                                                            Icons.search_rounded,
                                                            color:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .secondaryText,
                                                            size: 24,
                                                          ),
                                                          onPressed: () async {
                                                            AppCubit.get(context).getMainPrams(year: _model.dropDownValue1!.toString(), month: _model.dropDownValue2!.toString());
                                                            AppCubit.get(context).getMonthWork(year: _model.dropDownValue1!.toString(), month: _model.dropDownValue2!.toString());

                                                          },
                                                        ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
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
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 0, 16),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
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
                                            alignment:
                                                const AlignmentDirectional(0, 0),
                                            child: Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 12, 0, 12),
                                                child: Wrap(
                                                  spacing: 24,
                                                  runSpacing: 0,
                                                  alignment:
                                                      WrapAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                'Money In',
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .titleMedium
                                                                    .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                      context)
                                                                      .titleMediumFamily,
                                                                  letterSpacing:
                                                                  0,
                                                                  useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                      .containsKey(
                                                                      FlutterFlowTheme.of(context)
                                                                          .titleMediumFamily),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0, 4, 0, 0),
                                                                child: Text(
                                                                  'The amount of money received this month.\nTotal amount of services\n and sold components in all repairs in the month.',
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
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0, 16, 0, 0),
                                                            child: Text(
                                                              '${(AppCubit.get(context).mainPramsModel?.income) ?? '-'} EGP',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    fontFamily: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .success,
                                                                    letterSpacing:
                                                                        0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context)
                                                                                .displaySmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                'Money Out',
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .titleMedium
                                                                    .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                      context)
                                                                      .titleMediumFamily,
                                                                  letterSpacing:
                                                                  0,
                                                                  useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                      .containsKey(
                                                                      FlutterFlowTheme.of(context)
                                                                          .titleMediumFamily),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0, 4, 0, 0),
                                                                child: Text(
                                                                  'The amount you paid this month.\nTotal amount of salaries\n and paid components in the month.',
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
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0, 16, 0, 0),
                                                            child: Text(
                                                              '${(AppCubit.get(context).mainPramsModel?.outCome) ?? "-"} EGP',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    fontFamily: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    letterSpacing:
                                                                        0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context)
                                                                                .displaySmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            mainAxisSize: MainAxisSize.max,
                                                            children: [
                                                              Text(
                                                                'Current Balance',
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .titleMedium
                                                                    .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                      context)
                                                                      .titleMediumFamily,
                                                                  letterSpacing:
                                                                  0,
                                                                  useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                      .containsKey(
                                                                      FlutterFlowTheme.of(context)
                                                                          .titleMediumFamily),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0, 4, 0, 0),
                                                                child: Text(
                                                                  'The amount of money received this month.\n\n',
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
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0, 16, 0, 0),
                                                            child: Text(
                                                              '${(AppCubit.get(context).mainPramsModel?.totalGain) ?? '-'} EGP',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                        InkWell(
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              isExpanded = !isExpanded;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: isExpanded ? 25 : 0,
                                              vertical: 20,
                                            ),
                                            padding: const EdgeInsets.all(20),
                                            curve: Curves.fastLinearToSlowEaseIn,
                                            duration: const Duration(milliseconds: 1200),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color(0xFFF68B1E).withOpacity(0.5),
                                                  blurRadius: 20,
                                                  offset: const Offset(5, 10),
                                                ),
                                              ],
                                              color: const Color(0xFFF68B1E),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(isExpanded ? 20 : 8),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    const Text(
                                                      'Repairs',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Icon(
                                                      isExpanded
                                                          ? Icons.keyboard_arrow_down
                                                          : Icons.keyboard_arrow_up,
                                                      color: Colors.white,
                                                      size: 27,
                                                    ),
                                                  ],
                                                ),
                                                isExpanded ? const SizedBox() : const SizedBox(height: 20),
                                                AnimatedCrossFade(
                                                  firstChild: const Text(
                                                    '',
                                                    style: TextStyle(
                                                      fontSize: 0,
                                                    ),
                                                  ),
                                                  secondChild: Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional
                                                            .fromSTEB(0, 0, 0, 12),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(12, 0, 0, 0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize.max,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0, 4, 0, 0),
                                                                      child: Text(
                                                                        'Payment Name',
                                                                        style:
                                                                        FlutterFlowTheme.of(
                                                                            context)
                                                                            .bodyMedium
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme.of(
                                                                              context)
                                                                              .bodyMediumFamily,
                                                                          letterSpacing:
                                                                          0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme.of(context)
                                                                                  .bodyMediumFamily),
                                                                          color: Colors.white,
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
                                                                flex: 3,
                                                                child: Padding(
                                                                  padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      24, 0, 0, 0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize.max,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                        const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0, 4, 0, 0),
                                                                        child: Text(
                                                                          'Paid on',
                                                                          style: FlutterFlowTheme
                                                                              .of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme.of(
                                                                                context)
                                                                                .bodyMediumFamily,
                                                                            letterSpacing:
                                                                            0,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme.of(context)
                                                                                    .bodyMediumFamily),
                                                                            color: Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(24, 0, 0, 0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize.max,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0, 4, 0, 0),
                                                                      child: Text(
                                                                        'Amount',
                                                                        style:
                                                                        FlutterFlowTheme.of(
                                                                            context)
                                                                            .bodyMedium
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme.of(
                                                                              context)
                                                                              .bodyMediumFamily,
                                                                          letterSpacing:
                                                                          0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme.of(context)
                                                                                  .bodyMediumFamily),
                                                                          color: Colors.white,
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
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional
                                                            .fromSTEB(0, 4, 0, 0),

                                                        child:ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection: Axis.vertical,
                                                          physics: const BouncingScrollPhysics(),
                                                          itemBuilder: (context, index) => monthRepairItemBuilder(context,AppCubit.get(context).getMonthWorkModel?.monthRepairs[index]),
                                                          itemCount: AppCubit.get(context).getMonthWorkModel?.monthRepairs.length,

                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  crossFadeState: isExpanded
                                                      ? CrossFadeState.showFirst
                                                      : CrossFadeState.showSecond,
                                                  duration: const Duration(milliseconds: 1200),
                                                  reverseDuration: Duration.zero,
                                                  sizeCurve: Curves.fastLinearToSlowEaseIn,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          height: 24,
                                          thickness: 1,
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                        ),
                                        InkWell(
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              isExpanded2 = !isExpanded2;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: isExpanded2 ? 25 : 0,
                                              vertical: 20,
                                            ),
                                            padding: const EdgeInsets.all(20),
                                            curve: Curves.fastLinearToSlowEaseIn,
                                            duration: const Duration(milliseconds: 1200),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color(0xFFF68B1E).withOpacity(0.5),
                                                  blurRadius: 20,
                                                  offset: const Offset(5, 10),
                                                ),
                                              ],
                                              color: const Color(0xFFF68B1E),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(isExpanded2 ? 20 : 8),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    const Text(
                                                      'Salaries',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Icon(
                                                      isExpanded
                                                          ? Icons.keyboard_arrow_down
                                                          : Icons.keyboard_arrow_up,
                                                      color: Colors.white,
                                                      size: 27,
                                                    ),
                                                  ],
                                                ),
                                                isExpanded2 ? const SizedBox() : const SizedBox(height: 20),
                                                AnimatedCrossFade(
                                                  firstChild: const Text(
                                                    '',
                                                    style: TextStyle(
                                                      fontSize: 0,
                                                    ),
                                                  ),
                                                  secondChild: Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional
                                                            .fromSTEB(0, 0, 0, 12),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(12, 0, 0, 0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize.max,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0, 4, 0, 0),
                                                                      child: Text(
                                                                        'Worker',
                                                                        style:
                                                                        FlutterFlowTheme.of(
                                                                            context)
                                                                            .bodyMedium
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme.of(
                                                                              context)
                                                                              .bodyMediumFamily,
                                                                          color: Colors.white,
                                                                          letterSpacing:
                                                                          0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme.of(context)
                                                                                  .bodyMediumFamily),
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
                                                                flex: 3,
                                                                child: Padding(
                                                                  padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(24, 0, 0, 0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize.max,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                        const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0, 4, 0, 0),
                                                                        child: Text(
                                                                          'Salary',
                                                                          style:
                                                                          FlutterFlowTheme.of(
                                                                              context)
                                                                              .bodyMedium
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme.of(
                                                                                context)
                                                                                .bodyMediumFamily,
                                                                            color: Colors.white,
                                                                            letterSpacing:
                                                                            0,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme.of(context)
                                                                                    .bodyMediumFamily),
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
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional
                                                            .fromSTEB(0, 4, 0, 0),

                                                        child:ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection: Axis.vertical,
                                                          physics: const BouncingScrollPhysics(),
                                                          itemBuilder: (context, index) => monthWorkerItemBuilder(context,AppCubit.get(context).getMonthWorkModel?.monthWorker[index]),
                                                          itemCount: AppCubit.get(context).getMonthWorkModel?.monthWorker.length,

                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  crossFadeState: isExpanded2
                                                      ? CrossFadeState.showFirst
                                                      : CrossFadeState.showSecond,
                                                  duration: const Duration(milliseconds: 1200),
                                                  reverseDuration: Duration.zero,
                                                  sizeCurve: Curves.fastLinearToSlowEaseIn,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          height: 24,
                                          thickness: 1,
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                        ),
                                        InkWell(
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onTap: () {
                                            setState(() {
                                              isExpanded3 = !isExpanded3;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: isExpanded3 ? 25 : 0,
                                              vertical: 20,
                                            ),
                                            padding: const EdgeInsets.all(20),
                                            curve: Curves.fastLinearToSlowEaseIn,
                                            duration: const Duration(milliseconds: 1200),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color(0xFFF68B1E).withOpacity(0.5),
                                                  blurRadius: 20,
                                                  offset: const Offset(5, 10),
                                                ),
                                              ],
                                              color: const Color(0xFFF68B1E),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(isExpanded3 ? 20 : 8),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    const Text(
                                                      'Additions',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Icon(
                                                      isExpanded
                                                          ? Icons.keyboard_arrow_down
                                                          : Icons.keyboard_arrow_up,
                                                      color: Colors.white,
                                                      size: 27,
                                                    ),
                                                  ],
                                                ),
                                                isExpanded3 ? const SizedBox() : const SizedBox(height: 20),
                                                AnimatedCrossFade(
                                                  firstChild: const Text(
                                                    '',
                                                    style: TextStyle(
                                                      fontSize: 0,
                                                    ),
                                                  ),
                                                  secondChild: Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional
                                                            .fromSTEB(0, 0, 0, 12),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(12, 0, 0, 0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize.max,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0, 4, 0, 0),
                                                                      child: Text(
                                                                        'Payment Name',
                                                                        style:
                                                                        FlutterFlowTheme.of(
                                                                            context)
                                                                            .bodyMedium
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme.of(
                                                                              context)
                                                                              .bodyMediumFamily,
                                                                          color: Colors.white,
                                                                          letterSpacing:
                                                                          0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme.of(context)
                                                                                  .bodyMediumFamily),
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
                                                                flex: 3,
                                                                child: Padding(
                                                                  padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      24, 0, 0, 0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize.max,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                        const EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0, 4, 0, 0),
                                                                        child: Text(
                                                                          'Paid on',
                                                                          style: FlutterFlowTheme
                                                                              .of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                            fontFamily: FlutterFlowTheme.of(
                                                                                context)
                                                                                .bodyMediumFamily,
                                                                            color: Colors.white,
                                                                            letterSpacing:
                                                                            0,
                                                                            useGoogleFonts: GoogleFonts
                                                                                .asMap()
                                                                                .containsKey(
                                                                                FlutterFlowTheme.of(context)
                                                                                    .bodyMediumFamily),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(24, 0, 0, 0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize.max,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0, 4, 0, 0),
                                                                      child: Text(
                                                                        'Amount',
                                                                        style:
                                                                        FlutterFlowTheme.of(
                                                                            context)
                                                                            .bodyMedium
                                                                            .override(
                                                                          fontFamily: FlutterFlowTheme.of(
                                                                              context)
                                                                              .bodyMediumFamily,
                                                                          color: Colors.white,
                                                                          letterSpacing:
                                                                          0,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme.of(context)
                                                                                  .bodyMediumFamily),
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
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional
                                                            .fromSTEB(0, 4, 0, 0),

                                                        child:ListView.builder(
                                                          padding: EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection: Axis.vertical,
                                                          physics: const BouncingScrollPhysics(),
                                                          itemBuilder: (context, index) => monthAdditionItemBuilder(context,AppCubit.get(context).getMonthWorkModel?.monthAddition[index]),
                                                          itemCount: AppCubit.get(context).getMonthWorkModel?.monthAddition.length,

                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  crossFadeState: isExpanded3
                                                      ? CrossFadeState.showFirst
                                                      : CrossFadeState.showSecond,
                                                  duration: const Duration(milliseconds: 1200),
                                                  reverseDuration: Duration.zero,
                                                  sizeCurve: Curves.fastLinearToSlowEaseIn,
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
