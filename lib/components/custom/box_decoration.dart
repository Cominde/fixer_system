import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

class CustomInputDecoration extends InputDecoration {

  static InputDecoration customInputDecoration(context ,labelText) {
    return InputDecoration(
        labelText: labelText,
        labelStyle: FlutterFlowTheme
            .of(context)
            .bodySmall
            .override(
          fontFamily: 'Outfit',
          color: const Color(0xFFF68B1E),
        ),
        hintStyle:
        FlutterFlowTheme
            .of(context)
            .bodySmall,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme
                .of(context)
                .alternate,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFF68B1E),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        /*filled: true,*/
        /*fillColor: Colors.white,*/
        contentPadding:
        const EdgeInsetsDirectional.fromSTEB(
            16, 24, 0, 24),
      );
  }
}