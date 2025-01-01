import 'package:fixer_system/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../models/get_specific_user_model.dart';
import '../screens/car_profile_page/car_profile_page.dart';

Widget clientCarItemBuilder(context,SpecificUserCarData model, int index){
  return InkWell(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CarProfilePage(model.id!),
        ),
      );
    },
    child: Container(
      decoration:BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFF68B1E).withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(5, 10),
            ),
          ],
        color: Colors.orange.shade100,


        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.all(5),
      width: MediaQuery.sizeOf(context).width * 0.15,
      height: 300,
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
                    Text((model.carNumber)??'-',
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
                    Text((model.model)??'-',
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
                    Text((model.carCode)??'-',
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
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () {
                      var con=context;

                      showDialog(context: context, builder: (context) => Dialog
                        (

                        child: Container(
                          height: 100,
                          padding:  EdgeInsets.all(16),
                          child: Column(children: [
                            Text(
                                'Confirm Car delete Car #${model.carNumber} ?',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            Spacer(),
                            TextButton(onPressed: () {
                              AppCubit.get(context).deleteCar(con, id: model.id!, index: index);
                              Navigator.pop(context);

                            }, child: Text('Delete',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))
                          ],),
                        ),
                      ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 2,
                            color: FlutterFlowTheme.of(context).error,
                          )
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.delete_outline_rounded,
                            color: FlutterFlowTheme.of(context).error,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Delete',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).error,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
      ]
    ),
  ),
  );
}