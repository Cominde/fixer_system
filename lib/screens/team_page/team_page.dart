import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fixer_system/components/main_nav/main_nav.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pager/pager.dart';

import '../../components/custom/box_decoration.dart';
import '../../components/team_member_builder.dart';
import '../../cubit/cubit.dart';
import 'add_worker_screen.dart';
import 'team_page_model.dart';
export 'team_page_model.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  late TeamPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    AppCubit.get(context).getWorkers();
    super.initState();
    _model = createModel(context, () => TeamPageModel());
  }

  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  var searchController = TextEditingController();
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
                        navFour: FlutterFlowTheme.of(context).secondaryText,
                        navFive: const Color(0xFFF68B1E),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Team Members',
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
                                                      'Manage your team below.',
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
                                                    child: SizedBox(
                                                      width: 250,
                                                      height: 50,
                                                      child: TextFormField(
                                                        controller:
                                                            searchController,
                                                        obscureText: false,
                                                        decoration:
                                                            CustomInputDecoration
                                                                .customInputDecoration(
                                                                    context,
                                                                    'Search'),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                        onFieldSubmitted:
                                                            (value) {
                                                          if (value
                                                              .isNotEmpty) {
                                                            AppCubit.get(
                                                                    context)
                                                                .searchWorkers(
                                                                    word:
                                                                        value);
                                                          } else {
                                                            AppCubit.get(
                                                                    context)
                                                                .getWorkers();
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
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
                                                        Icons
                                                            .person_add_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24,
                                                      ),
                                                      onPressed: () async {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                addNewWorkerPage(
                                                                    context));
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24,
                                              ),
                                              onPressed: () {
                                                AppCubit.get(context)
                                                    .getWorkers(
                                                        page: AppCubit.get(
                                                                context)
                                                            .getWorkersModel!
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
                                          width:
                                              MediaQuery.sizeOf(context).width,
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
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
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
                                                        tablet: false,
                                                      ))
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            'National ID',
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
                                                          flex: 2,
                                                          child: Text(
                                                            'Phone Number',
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
                                                        tablet: false,
                                                      ))
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            'Job Title',
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
                                                      Expanded(
                                                        flex: 2,
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Text(
                                                            'Salary',
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
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1, 0),
                                                          child: Text(
                                                            'Operations',
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
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                ConditionalBuilder(
                                                  condition: state
                                                          is AppGetWorkersLoadingState ||
                                                      state
                                                          is AppSearchWorkersLoadingState,
                                                  builder: (context) =>
                                                      const Center(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(40.0),
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  ),
                                                  fallback: (context) =>
                                                      ConditionalBuilder(
                                                    condition:
                                                        AppCubit.get(context)
                                                            .getWorkersModel!
                                                            .workers
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
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: AppCubit.get(
                                                                context)
                                                            .getWorkersModel
                                                            ?.workers
                                                            .length,
                                                        physics:
                                                            const BouncingScrollPhysics(),
                                                        itemBuilder: (context,
                                                                index) =>
                                                            teamMemberBuilder(
                                                                context,
                                                                AppCubit.get(
                                                                        context)
                                                                    .getWorkersModel!
                                                                    .workers[index]),
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
                                if (state is! AppGetWorkersLoadingState &&
                                    state is! AppSearchWorkersLoadingState)
                                  Center(
                                    child: Pager(
                                      currentPage: AppCubit.get(context)
                                                  .getWorkersModel!
                                                  .current >
                                              0
                                          ? AppCubit.get(context)
                                              .getWorkersModel!
                                              .current
                                          : 1,
                                      totalPages: AppCubit.get(context)
                                                  .getWorkersModel!
                                                  .pages >
                                              0
                                          ? AppCubit.get(context)
                                              .getWorkersModel!
                                              .pages
                                          : 1,
                                      onPageChanged: (page) {
                                        setState(() {
                                          AppCubit.get(context)
                                              .getWorkersModel!
                                              .current = page;
                                          AppCubit.get(context)
                                              .getWorkers(page: page);
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
        );
      },
    );
  }
}
