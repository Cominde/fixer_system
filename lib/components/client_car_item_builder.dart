import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../models/get_specific_user_model.dart';
import '../screens/car_profile_page/car_profile_page.dart';

Widget clientCarItemBuilder(context,SpecificUserCarData model){
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CarProfilePage(model.id!),
        ),
      );
    },
    child: Container(
      decoration:ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),side: BorderSide(color: Colors.orange.shade300)),
        color: Colors.orange.shade100,
        shadows: CupertinoContextMenu.kEndBoxShadow

      ),
      padding: const EdgeInsets.all(5),
      width: MediaQuery.sizeOf(context).width * 0.15,
      height: MediaQuery.sizeOf(context).width * 0.13,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/car.png',
            width: MediaQuery.sizeOf(context).width * 0.15,
            height: MediaQuery.sizeOf(context).width * 0.1,
            fit: BoxFit.cover,
          ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Car Number: ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text('${(model.carNumber)??'-'}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Car Brand: ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text('${(model.brand)??'-'} ${(model.category)??'-'}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Car Model: ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text('${(model.model)??'-'}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Car Code: ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text('${(model.carCode)??'-'}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
        
          ],
        ),
      ),
      ]
    ),
  ),
  );
}