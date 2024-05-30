import 'package:fixer_system/components/main_nav/main_nav_model.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import 'team_page.dart' show TeamPage;
import 'package:flutter/material.dart';

class TeamPageModel extends FlutterFlowModel<TeamPage> {
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
