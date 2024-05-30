import 'package:fixer_system/models/get_all_types_model.dart';
import 'package:fixer_system/screens/types_page/update_type.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget typeBuilder(context,Type model){
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
                    '${model.category}',
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
                      '${model.code}',
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
                          Icons.edit_rounded,
                          color: FlutterFlowTheme
                              .of(context)
                              .secondaryText,
                          size: 24,
                        ),
                        onPressed: () async {
                          showDialog(context: context, builder: (context) => updateTypePage(context,model),);
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