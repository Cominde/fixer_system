import 'package:auto_size_text/auto_size_text.dart';
import 'package:fixer_system/components/main_nav/main_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';

import 'repairs_model.dart';
export 'repairs_model.dart';

class RepairsPage extends StatefulWidget {
  const RepairsPage({super.key});

  @override
  State<RepairsPage> createState() => _RepairsPageState();
}

class _RepairsPageState extends State<RepairsPage> {
  late ProjectsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectsModel());
  }

  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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
      child: GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          endDrawer: SizedBox(
            width: 350,
            child: Drawer(
              elevation: 16,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: Text(
                          'Notifications',
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                        child: Text(
                          'Below are you new notifications.',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        controller: _controller,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 1),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4, 4, 0, 4),
                                      child: Container(
                                        width: 4,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 12, 0, 0),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 12, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Username here',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                              child: Text(
                                                'okay wow, you could definitely catch meat the restaurant in Ibiza',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 4, 0),
                                                    child: Text(
                                                      'Posted',
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        fontSize: 12,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'A few moments ago',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodySmall
                                                        .override(
                                                      fontFamily: 'Outfit',
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .secondaryText,
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                          .containsKey(
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodySmallFamily),
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0,
                                    color: FlutterFlowTheme.of(context).lineColor,
                                    offset: const Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1474176857210-7287d38d27c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZGl2ZXJzZSUyMHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Username here',
                                              style: FlutterFlowTheme.of(context)
                                                  .titleMedium,
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                              child: Text(
                                                'okay wow, you could definitely catch meat the restaurant in Ibiza',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 4, 0),
                                                    child: Text(
                                                      'Posted',
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        fontSize: 12,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'A few moments ago',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodySmall
                                                        .override(
                                                      fontFamily: 'Outfit',
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .secondaryText,
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                          .containsKey(
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodySmallFamily),
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0,
                                    color: FlutterFlowTheme.of(context).lineColor,
                                    offset: const Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1507537297725-24a1c029d3ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZGl2ZXJzZSUyMHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Username here',
                                              style: FlutterFlowTheme.of(context)
                                                  .titleMedium,
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                              child: Text(
                                                'okay wow, you could definitely catch meat the restaurant in Ibiza',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 4, 0),
                                                    child: Text(
                                                      'Posted',
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        fontSize: 12,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'A few moments ago',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodySmall
                                                        .override(
                                                      fontFamily: 'Outfit',
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .secondaryText,
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                          .containsKey(
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodySmallFamily),
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
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                    navTwo: FlutterFlowTheme.of(context).alternate,
                    navThree: FlutterFlowTheme.of(context).secondaryText,
                    navFour: FlutterFlowTheme.of(context).secondaryText,
                    navFive: FlutterFlowTheme.of(context).secondaryText,
                    navSix: FlutterFlowTheme.of(context).secondaryText,
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
                                        flex: 5,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Your Repairs',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmall,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  'Your repairs are below',
                                                  style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
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
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 12, 0),
                                                child: Container(
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .alternate,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 0,
                                                        color: Color(0xFFC94851),
                                                        offset: Offset(0, 2),
                                                        spreadRadius: 1,
                                                      )
                                                    ],
                                                    borderRadius:
                                                    BorderRadius.circular(16),
                                                  ),
                                                  alignment:
                                                  const AlignmentDirectional(0, 0),
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(16, 0, 16, 0),
                                                    child: Text(
                                                      'Create',
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        color: FlutterFlowTheme
                                                            .of(context)
                                                            .primaryBtnText,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            /*if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 12, 0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color: Color(0x33000000),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                    BorderRadius.circular(16),
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .lineColor,
                                                    borderRadius: 12,
                                                    borderWidth: 1,
                                                    buttonSize: 50,
                                                    fillColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .secondaryBackground,
                                                    icon: Icon(
                                                      Icons.mark_chat_unread,
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .secondaryText,
                                                      size: 24,
                                                    ),
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled: true,
                                                        backgroundColor:
                                                        Colors.transparent,
                                                        barrierColor:
                                                        Color(0x17000000),
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                                ? FocusScope.of(
                                                                context)
                                                                .requestFocus(
                                                                _model
                                                                    .unfocusNode)
                                                                : FocusScope.of(
                                                                context)
                                                                .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                  context),
                                                              child: Container(
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                MessageBottomSheetWidget(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                  ),
                                                ),
                                              ),*/
                                            /*if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 12, 0),
                                                child: Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                        context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color: Color(0x33000000),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                    BorderRadius.circular(16),
                                                  ),
                                                  child: badges.Badge(
                                                    badgeContent: Text(
                                                      '1',
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .bodyMedium
                                                          .override(
                                                        fontFamily:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMediumFamily,
                                                        color: Colors.white,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily),
                                                      ),
                                                    ),
                                                    showBadge: true,
                                                    shape:
                                                    badges.BadgeShape.circle,
                                                    badgeColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primary,
                                                    elevation: 4,
                                                    padding: EdgeInsets.all(8),
                                                    position: badges.BadgePosition
                                                        .topEnd(),
                                                    animationType: badges
                                                        .BadgeAnimationType.scale,
                                                    toAnimate: true,
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
                                                        Icons.notifications_none,
                                                        color:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .secondaryText,
                                                        size: 24,
                                                      ),
                                                      onPressed: () async {
                                                        scaffoldKey.currentState!
                                                            .openEndDrawer();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),*/
                                          ],
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Recent Repairs',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  'A list of all cars in the center for repairs.',
                                                  style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              borderRadius:
                                              BorderRadius.circular(16),
                                            ),
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
                                                Icons.search_rounded,
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                size: 24,
                                              ),
                                              onPressed: () {
                                                /// todo: add search logic for repairs
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Divider(
                                      height: 24,
                                      thickness: 1,
                                      color:
                                      FlutterFlowTheme.of(context).lineColor,
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Clent Name',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
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
                                              'Car',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodySmall,
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          Expanded(
                                            child: Text(
                                              'Last Update',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodySmall,
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                        ))
                                          Expanded(
                                            child: Text(
                                              'Date Created',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodySmall,
                                            ),
                                          ),
                                        Expanded(
                                          child: Text(
                                            'Completion Rate',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 2),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0,
                                                  color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                                  offset: const Offset(0, 1),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0, 0,
                                                              12, 0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                            child: Image.asset(
                                                              'assets/images/man.png',
                                                              width: 40,
                                                              height: 40,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Custom Name',
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .titleMedium,
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              tabletLandscape:
                                                              false,
                                                              desktop: false,
                                                            ))
                                                              Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    2,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  'user@domainname.com',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
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
                                                        'KIA, 2017',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat('MEd',
                                                            getCurrentTimestamp),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat('relative',
                                                            getCurrentTimestamp),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          '20%',
                                                          style:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily,
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .primary,
                                                            useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                                .containsKey(
                                                                FlutterFlowTheme.of(context)
                                                                    .bodyMediumFamily),
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          tablet: false,
                                                          tabletLandscape: false,
                                                          desktop: false,
                                                        ))
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0,
                                                                2, 0, 0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  getCurrentTimestamp),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                    context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 2),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0,
                                                  color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                                  offset: const Offset(0, 1),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0, 0,
                                                              12, 0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                            child: Image.asset(
                                                              'assets/images/man.png',
                                                              width: 40,
                                                              height: 40,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Custom Name',
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .titleMedium,
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              tabletLandscape:
                                                              false,
                                                              desktop: false,
                                                            ))
                                                              Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    2,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  'user@domainname.com',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
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
                                                        'BMW, 2020',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat('MEd',
                                                            getCurrentTimestamp),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat('relative',
                                                            getCurrentTimestamp),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          '38%',
                                                          style:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily,
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .primary,
                                                            useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                                .containsKey(
                                                                FlutterFlowTheme.of(context)
                                                                    .bodyMediumFamily),
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          tablet: false,
                                                          tabletLandscape: false,
                                                          desktop: false,
                                                        ))
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0,
                                                                2, 0, 0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  getCurrentTimestamp),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                    context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 2),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0,
                                                  color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                                  offset: const Offset(0, 1),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0, 0,
                                                              12, 0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                            child: Image.asset(
                                                              'assets/images/man.png',
                                                              width: 40,
                                                              height: 40,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Custom Name',
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .titleMedium,
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              tabletLandscape:
                                                              false,
                                                              desktop: false,
                                                            ))
                                                              Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    2,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  'user@domainname.com',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
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
                                                        'KIA, 2017',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat('MEd',
                                                            getCurrentTimestamp),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat('relative',
                                                            getCurrentTimestamp),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          '20%',
                                                          style:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily,
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .primary,
                                                            useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                                .containsKey(
                                                                FlutterFlowTheme.of(context)
                                                                    .bodyMediumFamily),
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          tablet: false,
                                                          tabletLandscape: false,
                                                          desktop: false,
                                                        ))
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0,
                                                                2, 0, 0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  getCurrentTimestamp),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                    context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 2),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0,
                                                  color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                                  offset: const Offset(0, 1),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0, 0,
                                                              12, 0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                            child: Image.asset(
                                                              'assets/images/man.png',
                                                              width: 40,
                                                              height: 40,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Custom Name',
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .titleMedium,
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              tabletLandscape:
                                                              false,
                                                              desktop: false,
                                                            ))
                                                              Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    2,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  'user@domainname.com',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
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
                                                        'BMW, 2020',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat('MEd',
                                                            getCurrentTimestamp),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat('relative',
                                                            getCurrentTimestamp),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          '38%',
                                                          style:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily,
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .primary,
                                                            useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                                .containsKey(
                                                                FlutterFlowTheme.of(context)
                                                                    .bodyMediumFamily),
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          tablet: false,
                                                          tabletLandscape: false,
                                                          desktop: false,
                                                        ))
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0,
                                                                2, 0, 0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  getCurrentTimestamp),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                    context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 2),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0,
                                                  color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                                  offset: const Offset(0, 1),
                                                )
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0, 0,
                                                              12, 0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                            child: Image.asset(
                                                              'assets/images/man.png',
                                                              width: 40,
                                                              height: 40,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                          MainAxisSize.max,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Custom Name',
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .titleMedium,
                                                            ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              tabletLandscape:
                                                              false,
                                                              desktop: false,
                                                            ))
                                                              Padding(
                                                                padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    0,
                                                                    2,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  'user@domainname.com',
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
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
                                                        'BMW, 2020',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat('MEd',
                                                            getCurrentTimestamp),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                  ))
                                                    Expanded(
                                                      child: Text(
                                                        dateTimeFormat('relative',
                                                            getCurrentTimestamp),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          '38%',
                                                          style:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMedium
                                                              .override(
                                                            fontFamily: FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMediumFamily,
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .primary,
                                                            useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                                .containsKey(
                                                                FlutterFlowTheme.of(context)
                                                                    .bodyMediumFamily),
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          tablet: false,
                                                          tabletLandscape: false,
                                                          desktop: false,
                                                        ))
                                                          Padding(
                                                            padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0,
                                                                2, 0, 0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  getCurrentTimestamp),
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                    context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .secondaryText,
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
                          ],
                        ),
                      ),
                    ),
                    /*wrapWithModel(
                      model: _model.mobileNavModel,
                      updateCallback: () => setState(() {}),
                      child: MobileNavWidget(
                        navOneIcon: Icon(
                          Icons.home_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        navTwoIcon: Icon(
                          Icons.grain,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        navThreeIcon: Icon(
                          Icons.credit_card_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        navFourIcon: Icon(
                          Icons.group_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        navFiveIcon: Icon(
                          Icons.home_work_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
