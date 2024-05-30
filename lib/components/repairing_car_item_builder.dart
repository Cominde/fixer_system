import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/get_repairing_cars_model.dart';
import '../screens/car_profile_page/car_profile_page.dart';

Widget repairingCarItemBuilder(context, repairingCarData model) {
  return InkWell(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CarProfilePage(model.id!),
        ),
      );
    },
    child: Padding(
      padding:
      const EdgeInsets.all(12),
      child: Row(
        mainAxisSize:
        MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              mainAxisSize:
              MainAxisSize
                  .max,
              children: [
                AutoSizeText(
                  '${(model.brand)??'-'} ${(model.category)??'-'}',
                  style: FlutterFlowTheme.of(
                      context)
                      .bodyMedium
                      .override(
                    fontFamily:
                    FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context)
                        .primaryText,
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
            tablet: false,
          ))
            Expanded(
              child: AutoSizeText(
                (model.chassisNumber)??'-',
                style: FlutterFlowTheme.of(
                    context)
                    .bodyMedium
                    .override(
                  fontFamily:
                  FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: FlutterFlowTheme.of(context)
                      .primaryText,
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
          ))
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: AutoSizeText(
                  (model.carNumber)??'-',
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
            ),
          Expanded(
            child: AutoSizeText(
              (model.ownerName)??'-',
              style: FlutterFlowTheme.of(
                  context)
                  .bodyMedium
                  .override(
                fontFamily:
                FlutterFlowTheme.of(context)
                    .bodyMediumFamily,
                letterSpacing:
                0,
                useGoogleFonts: GoogleFonts
                    .asMap()
                    .containsKey(
                    FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              '${(model.completedServicesRatio)??'-'}',
              style: FlutterFlowTheme.of(
                  context)
                  .bodyMedium
                  .override(
                fontFamily:
                FlutterFlowTheme.of(context).bodyMediumFamily,
                color: FlutterFlowTheme.of(context)
                    .primaryText,
                letterSpacing:
                0,
                useGoogleFonts:
                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
            ),
          ),
        ],
      ),
    ),
  );


}
