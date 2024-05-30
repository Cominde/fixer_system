import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/get_list_of_inventory_components_model.dart';
import '../screens/inventory_page/edit_inventory_component_item.dart';

Widget componentItemBuilder(context,InventoryComponentData model){
return  Padding(
  padding:
  const EdgeInsetsDirectional
      .fromSTEB(
      0, 0, 0, 2),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: FlutterFlowTheme
          .of(context)
          .secondaryBackground,
      boxShadow: [
        BoxShadow(
          blurRadius: 0,
          color: FlutterFlowTheme
              .of(context)
              .lineColor,
          offset: const Offset(
            0,
            1,
          ),
        )
      ],
    ),
    child: Padding(
      padding:
      const EdgeInsets.all(12),
      child: Row(
        mainAxisSize:
        MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize:
              MainAxisSize
                  .max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional
                      .fromSTEB(
                      0,
                      0,
                      12,
                      0),
                  child:
                  Container(
                    width: 40,
                    height:
                    40,
                    decoration:
                    BoxDecoration(
                      color: const Color(
                          0xFFF68B1E),
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                    alignment:
                    const AlignmentDirectional(
                        0,
                        0),
                    child:
                    Icon(
                      Icons
                          .electrical_services_rounded,
                      color: FlutterFlowTheme.of(context)
                          .primaryBackground,
                      size:
                      32,
                    ),
                  ),
                ),
                AutoSizeText(
                  '${model.name}',
                  style: FlutterFlowTheme.of(
                      context)
                      .bodyMedium
                      .override(
                    fontFamily:
                    FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing:
                    0,
                    useGoogleFonts:
                    GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
                ),
              ],
            ),
          ),
          if (responsiveVisibility(
            context: context,
            phone: false,
          ))
            Expanded(
              child: AutoSizeText(
                '${model.quantity}',
                style: FlutterFlowTheme.of(
                    context)
                    .bodyMedium
                    .override(
                  fontFamily:
                  FlutterFlowTheme.of(context).bodyMediumFamily,
                  letterSpacing:
                  0,
                  useGoogleFonts:
                  GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                '${model.price} EGP',
                style: FlutterFlowTheme.of(
                    context)
                    .bodyMedium
                    .override(
                  fontFamily:
                  FlutterFlowTheme.of(context).bodyMediumFamily,
                  letterSpacing:
                  0,
                  useGoogleFonts:
                  GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
              ),
            ),
          Expanded(
            child: Row(
              mainAxisSize:
              MainAxisSize
                  .max,
              mainAxisAlignment:
              MainAxisAlignment
                  .end,
              children: [
                if (responsiveVisibility(
                  context:
                  context,
                  phone:
                  false,
                ))
                  Padding(
                    padding: const EdgeInsetsDirectional
                        .fromSTEB(
                        12,
                        0,
                        0,
                        0),
                    child:
                    Container(
                      width:
                      50,
                      height:
                      50,
                      decoration:
                      BoxDecoration(
                        color:
                        FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(
                              0,
                              2,
                            ),
                          )
                        ],
                        borderRadius:
                        BorderRadius.circular(16),
                      ),
                      child:
                      FlutterFlowIconButton(
                        borderColor:
                        FlutterFlowTheme.of(context).lineColor,
                        borderRadius:
                        12,
                        borderWidth:
                        1,
                        buttonSize:
                        50,
                        fillColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                        icon:
                        Icon(
                          Icons.edit_rounded,
                          color:
                          FlutterFlowTheme.of(context).secondaryText,
                          size:
                          24,
                        ),
                        onPressed:
                            () async {
                          showDialog(context: context, builder:(context) =>  editNewComponentPage(context,model));
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