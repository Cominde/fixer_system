import 'package:fixer_system/components/main_nav/main_nav_model.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import 'cars_in_garage_page.dart' show CarsInGaragePage;
import 'package:flutter/material.dart';

class CarsInGaragePageModel extends FlutterFlowModel<CarsInGaragePage> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for mainWebNav component.
  late MainNavModel mainNavModel;

  @override
  void initState(BuildContext context) {
    mainNavModel = createModel(context, () => MainNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainNavModel.dispose();
  }
}
