import 'package:fixer_system/models/get_completed_repairs_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget billItemBuilder(context,CompletedRepairData? model){
 return Padding(
   padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),

   child: Container(
     width: double.infinity,
     decoration: BoxDecoration(
       color: FlutterFlowTheme.of(context).secondaryBackground,
       boxShadow: [
         BoxShadow(
           blurRadius: 0,
           color: FlutterFlowTheme.of(context).lineColor,
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
              flex: 3,
              child: Padding(
                padding: const EdgeInsetsDirectional
                    .fromSTEB(12, 0, 0, 0),
                child: Column(
                  mainAxisSize:
                  MainAxisSize.max,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '${(model?.brand)??'-'} ${(model?.category)??'-'}',
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
                  padding: const EdgeInsetsDirectional
                      .fromSTEB(24, 0, 0, 0),
                  child: Column(
                    mainAxisSize:
                    MainAxisSize.max,
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      AutoSizeText(
                        (model?.carCode)??'-',
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
                  padding: const EdgeInsetsDirectional
                      .fromSTEB(24, 0, 0, 0),
                  child: Column(
                    mainAxisSize:
                    MainAxisSize.max,
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      AutoSizeText(
                        (model?.client)??'-',
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
                  padding: const EdgeInsetsDirectional
                      .fromSTEB(24, 0, 0, 0),
                  child: Column(
                    mainAxisSize:
                    MainAxisSize.max,
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      AutoSizeText(
                        '${(model?.paidOn)?.day??'-'}/${(model?.paidOn)?.month??'-'}/${(model?.paidOn)?.year??'-'}',
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsetsDirectional
                    .fromSTEB(24, 0, 0, 0),
                child: Column(
                  mainAxisSize:
                  MainAxisSize.max,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '${(model?.priceAfterDiscount)??'-'} EGP',
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
 );
}