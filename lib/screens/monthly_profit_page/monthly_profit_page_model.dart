import 'package:fixer_system/components/main_nav/main_nav_model.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import 'monthly_profit_page.dart' show MonthlyProfitPage;
import 'package:flutter/material.dart';

class MonthlyProfitPageModel extends FlutterFlowModel<MonthlyProfitPage> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for mainWebNav component.
  late MainNavModel mainNavModel;
  // State field(s) for DropDown widget.
  String? dropDownValue1=DateTime.now().year.toString();
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2=DateTime.now().month.toString();
  FormFieldController<String>? dropDownValueController2;

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
