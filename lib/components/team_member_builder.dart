import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/cubit.dart';
import '../models/get_workers_model.dart';
import '../screens/team_page/add_reward_or_loan_screen.dart';
import '../screens/team_page/update_worker.dart';

Widget teamMemberBuilder(context,Worker model){
  return  Padding(
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
            color: FlutterFlowTheme.of(context)
                .lineColor,
            offset: const Offset(
              0,
              1,
            ),
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
                mainAxisSize: MainAxisSize.max,
                children: [

                  AutoSizeText(
                    '${model.name}',
                    style: FlutterFlowTheme.of(
                        context)
                        .bodyMedium
                        .override(

                      fontFamily:
                      FlutterFlowTheme.of(
                          context)
                          .titleMediumFamily,
                      letterSpacing: 0,
                      useGoogleFonts: GoogleFonts
                          .asMap()
                          .containsKey(
                          FlutterFlowTheme.of(
                              context)
                              .titleMediumFamily),
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
              Expanded(
                flex: 2,
                child: Text(
                  '${model.IDNumber}',
                  style:
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
                ),
              ),
            if (responsiveVisibility(
              context: context,
              phone: false,
            ))
              Expanded(
                flex: 2,

                child: Text(
                  '${model.phoneNumber}',
                  style:
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
                  '${model.jobTitle}',
                  style:
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
                ),
              ),
            Expanded(
              flex: 2,

              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment:
                CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment:
                    const AlignmentDirectional(
                        -1, 0),
                    child: Text(
                      '${model.salary} EGP',
                      style: FlutterFlowTheme.of(
                          context)
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
                          .fromSTEB(
                          0, 2, 0, 0),
                      child: Text(
                        dateTimeFormat('relative',
                            getCurrentTimestamp),
                        style:
                        FlutterFlowTheme.of(
                            context)
                            .bodySmall
                            .override(
                          fontFamily: FlutterFlowTheme.of(
                              context)
                              .bodySmallFamily,
                          color: FlutterFlowTheme.of(
                              context)
                              .secondaryText,
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
            Expanded(
                flex: 3,
              child: Row(

                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                    const EdgeInsetsDirectional
                        .fromSTEB(
                        12, 0, 0, 0),
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
                          Icons.attach_money,
                          color: FlutterFlowTheme
                              .of(context)
                              .secondaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          addRewardOrLoanScreen(context,model.id!);
                         // AppCubit.get(context).deleteWorker(context ,id: model.id!);

                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsetsDirectional
                        .fromSTEB(
                        12, 0, 0, 0),
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
                          Icons.close_rounded,
                          color: FlutterFlowTheme
                              .of(context)
                              .secondaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          AppCubit.get(context).deleteWorker(context ,id: model.id!);

                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsetsDirectional
                        .fromSTEB(
                        12, 0, 0, 0),
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
                          Icons.edit_rounded,
                          color: FlutterFlowTheme
                              .of(context)
                              .secondaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          showDialog(context: context, builder: (context) => updateWorkerPage(context,model),);
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
  );
}