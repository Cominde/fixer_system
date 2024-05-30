import 'package:fixer_system/components/main_nav/main_nav_model.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import 'types_page.dart' show TypesPage;
import 'package:flutter/material.dart';

class TypesPageModel extends FlutterFlowModel<TypesPage> {
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
