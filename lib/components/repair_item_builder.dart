import 'package:auto_size_text/auto_size_text.dart';
import 'package:fixer_system/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import '../cubit/cubit.dart';
import '../models/get_specific_car_model.dart';
import '../screens/car_profile_page/edit_repair_screen.dart';

class RepairItemBuilder extends StatelessWidget {

  RepairData model;
  int index;
  RepairItemBuilder({super.key, required this.index, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppCubitStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.30,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF68B1E).withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(5, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      model.genId??'',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: (model.complete)??true,
                        replacement:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                border: Border.all(color: Colors.red,width: 1)
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Processing',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ) ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                border: Border.all(color: Colors.green,width: 1)
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Completed',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 16,
                            buttonSize: 56,
                            fillColor: Theme
                                .of(context)
                                .primaryColor,
                            icon: const Icon(Icons.edit_rounded),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateRepairScreen(model),));
                            },
                          ),
                          SizedBox(width: 10,),
                          FlutterFlowIconButton(
                            borderRadius: 16,
                            buttonSize: 56,
                            fillColor: Theme
                                .of(context)
                                .primaryColor,
                            icon: const Icon(Icons.delete_rounded),
                            onPressed: () {
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateRepairScreen(model),));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    'General Info',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Client'),
                            Text('${model.client}',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Brand'),
                            Text('${model.brand}',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Category'),
                            Text('${model.category}',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Model'),
                            Text('${model.model}',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Price'),
                            Text('${model.totalPrice} EGP',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Discount'),
                            Text('${model.discount} EGP',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Price After Discount'),
                            Text('${(int.tryParse(model.totalPrice??'')??0)-(model.discount??0)} EGP',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Car Number'),
                            Text('${model.carNumber}',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Type'),
                            Text('${model.type}',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Expected Date'),
                            Text(
                              '${(model.expectedDate?.year) ?? 0000}-${(model.expectedDate?.month) ?? 00}-${(model.expectedDate?.day) ?? 00}',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Complete'),
                            Text(model.complete.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Completed Services Ratio'),
                            Text('% ${(((model.completedServicesRatio??0)*100.0) as double).toStringAsFixed(2)}',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Distance'),
                            Text('${(model.distance)??'_'}',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Created At'),
                            Text(
                              '${(model.createdAt?.year) ?? 0000}-${(model.createdAt?.month) ?? 00}-${(model.createdAt?.day) ?? 00}',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Updated At'),
                            Text(
                              '${(model.updatedAt?.year) ?? 0000}-${(model.updatedAt?.month) ?? 00}/${(model.updatedAt?.day) ?? 00}',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Services',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ...model.services.map((value) {

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: (value.state == 'repairing'),
                                child: IconButton(
                                    onPressed: () async {
                                      bool changed = await AppCubit.get(context).changeServiceState(
                                        context,
                                        serviceId: value.id!,
                                        state: 'completed',
                                      );
                                      print(changed);
                                      if(changed) {
                                        AppCubit.get(context).setState(() {
                                          int indexOfService = AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs[index].services.indexOf(value);
                                          value.state='completed';
                                          bool completed = true;
                                          for(var service in model.services) {
                                            if(service.state != 'completed'){
                                              completed = false;
                                              break;
                                            }
                                          }
                                          model.complete=completed;
                                          AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs[index].complete = completed;
                                          AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs[index].services[indexOfService].state = 'completed';
                                          AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs[index].completedServicesRatio = (model.services.where((service) => service.state == 'completed').length / model.services.length);
                                        });
                                      }
                                    },
                                    icon:  const Icon(Icons.check_box_outline_blank,color: Colors.red,)),
                              ),
                              Visibility(
                                visible: (value.state == 'completed'),
                                child: IconButton(
                                    onPressed: () async {
                                      bool changed = await AppCubit.get(context).changeServiceState(
                                        context,
                                        serviceId: value.id!,
                                        state: 'repairing',
                                      );
                                      if(changed) {
                                        AppCubit.get(context).setState(() {
                                          int indexOfService = AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs[index].services.indexOf(value);
                                          value.state='repairing';
                                          model.complete=false;
                                          AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs[index].complete = false;
                                          AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs[index].services[indexOfService].state = 'repairing';
                                          AppCubit.get(context).getAllRepairsForSpecificCarModel!.repairs[index].completedServicesRatio = (model.services.where((service) => service.state == 'completed').length / model.services.length);
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.check_box,color: Colors.green,)),
                              ),
                              Expanded(child: Text('${value.name}')),
                              Text('${value.price} EGP',style: const TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Additions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ...model.additions.map((value) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${value.name}'),
                            Text('${value.price} EGP',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Component',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ...model.components.map((value) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${value.name}'),
                            Text('${value.price} EGP',style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Important Things',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      AutoSizeText(model.note1??'_')

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Notes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      AutoSizeText(model.note2??'_')

                    ],
                  ),
                  const SizedBox(height: 10,),
                ],

              ),
            ),
          ),
        );
      },
    );
  }
}
