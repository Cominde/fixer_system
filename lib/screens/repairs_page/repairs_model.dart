
import 'package:fixer_system/components/main_nav/main_nav_model.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import 'repairs_page.dart' show RepairsPage;
import 'package:flutter/material.dart';
class ProjectsModel extends FlutterFlowModel<RepairsPage> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for mainWebNav component.
  late MainNavModel mainNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainNavModel = createModel(context, () => MainNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainNavModel.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}
