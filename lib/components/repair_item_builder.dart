import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cubit/cubit.dart';
import '../models/get_specific_car_model.dart';

Widget repairItemBuilder(context, RepairData? model) {
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
             Visibility(
              visible: (model?.complete)??true,
              replacement:const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Processing',style: TextStyle(color: Colors.red),),
              ) ,
              child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Completed',style: TextStyle(color: Colors.green),),
              ),
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
                      Text('${model?.client}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Brand'),
                      Text('${model?.brand}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Category'),
                      Text('${model?.category}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Model'),
                      Text('${model?.model}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Discount'),
                      Text('${model?.discount}%'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Price'),
                      Text('${model?.totalPrice} EGP'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Car Number'),
                      Text('${model?.carNumber}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Type'),
                      Text('${model?.type}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Expected Date'),
                      Text(
                          '${(model?.expectedDate?.day) ?? '-'}/${(model?.expectedDate?.month) ?? '-'}/${(model?.expectedDate?.year) ?? '-'}'),
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
                      Text('${model?.complete.toString()}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Completed Services Ratio'),
                      Text('${(model?.completedServicesRatio)}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Created At'),
                      Text(
                          '${(model?.createdAt?.day) ?? '-'}/${(model?.createdAt?.month) ?? '-'}/${(model?.createdAt?.year) ?? '-'}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Updated At'),
                      Text(
                          '${(model?.updatedAt?.day) ?? '-'}/${(model?.updatedAt?.month) ?? '-'}/${(model?.updatedAt?.year) ?? '-'}'),
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
                ...?model?.services.map((value) {

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: (value.state == 'repairing'),
                          child: IconButton(
                              onPressed: () {
                                AppCubit.get(context).changeServiceState(
                                  context,
                                  serviceId: value.id!,
                                  state: 'completed',
                                );
                                value.state='completed';

                              },
                              icon:  const Icon(Icons.check_box_outline_blank,color: Colors.red,)),

                        ),
                        Visibility(
                          visible: (value.state == 'completed'),
                          child: IconButton(
                              onPressed: () {
                                AppCubit.get(context).changeServiceState(
                                  context,
                                  serviceId: value.id!,
                                  state: 'repairing',
                                );
                                value.state='repairing';
                                model.complete=false;
                              },

                              icon: const Icon(Icons.check_box,color: Colors.green,)),
                        ),
                        Expanded(child: Text('${value.name}')),
                        Text('${value.price} EGP'),
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
                ...?model?.additions.map((value) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${value.name}'),
                          Text('${value.price} EGP'),
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
                ...?model?.components.map((value) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${value.name}'),
                          Text('${value.price} EGP'),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
