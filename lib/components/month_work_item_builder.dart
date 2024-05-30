import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/get_month_work_model.dart';

Widget monthRepairItemBuilder(context ,MonthRepair? model)
{
  return Padding(
    padding:
    const EdgeInsetsDirectional
        .fromSTEB(0, 8, 0, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding:
            const EdgeInsetsDirectional
                .fromSTEB(
                12, 0, 0, 0),
            child: Column(
              mainAxisSize:
              MainAxisSize.max,
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: [
                Text(
                  '${(model?.brand)??'-'} ${(model?.category)??'-'}',
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
                    color: Colors.white,
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
                  Text(
                    '${(model?.createdAt?.day)??'-'}/${(model?.createdAt?.month)??'-'}/${(model?.createdAt?.year)??'-'}',
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
                      color: Colors.white,
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
                .fromSTEB(
                24, 0, 0, 0),
            child: Column(
              mainAxisSize:
              MainAxisSize.max,
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: [
                Text(
                  '${(model?.priceAfterDiscount)??'-'} EGP',
                  style: FlutterFlowTheme
                      .of(context)
                      .bodySmall
                      .override(
                    fontFamily: FlutterFlowTheme.of(
                        context)
                        .bodySmallFamily,
                    color: Colors.white,
                    letterSpacing:
                    0,
                    useGoogleFonts: GoogleFonts
                        .asMap()
                        .containsKey(
                        FlutterFlowTheme.of(context)
                            .bodySmallFamily),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ) ;

}

Widget monthWorkerItemBuilder(context ,MonthWorker? model)
{
  return Padding(
    padding:
    const EdgeInsetsDirectional
        .fromSTEB(0, 8, 0, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding:
            const EdgeInsetsDirectional
                .fromSTEB(
                12, 0, 0, 0),
            child: Column(
              mainAxisSize:
              MainAxisSize.max,
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: [
                Text(
                  (model?.name)??'-',
                  style: FlutterFlowTheme
                      .of(context)
                      .bodySmall
                      .override(
                    fontFamily: FlutterFlowTheme.of(
                        context)
                        .bodySmallFamily,
                    color: Colors.white,
                    letterSpacing:
                    0,
                    useGoogleFonts: GoogleFonts
                        .asMap()
                        .containsKey(
                        FlutterFlowTheme.of(context)
                            .bodySmallFamily),
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
                  Text(
                    '${(model?.salary)??'-'}',
                    style: FlutterFlowTheme
                        .of(context)
                        .bodySmall
                        .override(
                      fontFamily:
                      FlutterFlowTheme.of(context)
                          .bodySmallFamily,
                      color: Colors.white,
                      letterSpacing:
                      0,
                      useGoogleFonts: GoogleFonts
                          .asMap()
                          .containsKey(
                          FlutterFlowTheme.of(context).bodySmallFamily),
                    ),
                  ),
                ],
              ),
            ),
          ),

      ],
    ),
  ) ;

}


Widget monthAdditionItemBuilder(context ,MonthAddition? model)
{
  return Padding(
    padding:
    const EdgeInsetsDirectional
        .fromSTEB(0, 8, 0, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding:
            const EdgeInsetsDirectional
                .fromSTEB(
                12, 0, 0, 0),
            child: Column(
              mainAxisSize:
              MainAxisSize.max,
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: [
                Text(
                  (model?.title)??'-',
                  style: FlutterFlowTheme
                      .of(context)
                      .bodySmall
                      .override(
                    fontFamily: FlutterFlowTheme.of(
                        context)
                        .bodySmallFamily,
                    color: Colors.white,
                    letterSpacing:
                    0,
                    useGoogleFonts: GoogleFonts
                        .asMap()
                        .containsKey(
                        FlutterFlowTheme.of(context)
                            .bodySmallFamily),
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
                  Text(
                    '${(model?.date?.day)??'-'}/${(model?.date?.month)??'-'}/${(model?.date?.year)??'-'}',
                    style: FlutterFlowTheme
                        .of(context)
                        .bodySmall
                        .override(
                      fontFamily:
                      FlutterFlowTheme.of(context)
                          .bodySmallFamily,
                      color: Colors.white,
                      letterSpacing:
                      0,
                      useGoogleFonts: GoogleFonts
                          .asMap()
                          .containsKey(
                          FlutterFlowTheme.of(context).bodySmallFamily),
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
                .fromSTEB(
                24, 0, 0, 0),
            child: Column(
              mainAxisSize:
              MainAxisSize.max,
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: [
                Text(
                  '${(model?.price)??'-'} EGP',
                  style: FlutterFlowTheme
                      .of(context)
                      .bodySmall
                      .override(
                    fontFamily: FlutterFlowTheme.of(
                        context)
                        .bodySmallFamily,
                    color: Colors.white,
                    letterSpacing:
                    0,
                    useGoogleFonts: GoogleFonts
                        .asMap()
                        .containsKey(
                        FlutterFlowTheme.of(context)
                            .bodySmallFamily),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ) ;

}
