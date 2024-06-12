import 'dart:io';

import 'package:fixer_system/cubit/cubit.dart';
import 'package:fixer_system/models/get_completed_repairs_model.dart';
import 'package:flutter/services.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


Widget billItemBuilder(context,CompletedRepairData? model, AppCubit cubit){
  late  pw.Document pdf;
  late Uint8List pdfBytes;
  

  int totalServices = cubit.getCompletedRepairDetailsModel?.visit?.services.map((service) => service.price).reduce((a, b) => a! + b!)??0;
  int totalComponents = cubit.getCompletedRepairDetailsModel?.visit?.components.map((component) => component.price).reduce((a, b) => a! + b!)??0;
  /*int totalAdditions = cubit.getCompletedRepairDetailsModel?.visit?.additions.map((addition) => addition.price).reduce((a, b) => a! + b!)??0;*/
  
  


 return InkWell(
   onTap: () async {
     cubit.getCompletedRepairDetails(repairId: model.id!);


     pdf = pw.Document();

     rootBundle.load('assets/images/logo.png').then((value) {
       pw.MemoryImage image = pw.MemoryImage(value.buffer.asUint8List());

       rootBundle.load("assets/fonts/Hacen_Tunisia/Hacen-Tunisia.ttf").then((value) {
         pw.Font myFont = pw.Font.ttf(value);

         pdf.addPage(pw.Page(
             pageFormat: PdfPageFormat.a4,
             build: (pw.Context context) {
               return pw.Expanded(
                   child: pw.Container(
                       child: pw.Stack(
                           children: [
                             pw.Padding(
                                 padding: const pw.EdgeInsets.all(0),
                                 child: pw.Expanded(
                                     child: pw.Column(
                                         mainAxisAlignment: pw.MainAxisAlignment.start,
                                         mainAxisSize: pw.MainAxisSize.max,
                                         crossAxisAlignment: pw.CrossAxisAlignment.end,
                                         children: [
                                           pw.Row(
                                               mainAxisSize: pw.MainAxisSize.max,
                                               mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                                               crossAxisAlignment: pw.CrossAxisAlignment.start,
                                               children: [
                                                 pw.Expanded(
                                                   flex: 2,
                                                   child: pw.SizedBox(
                                                       width: 160,
                                                       height: 90,
                                                       child: pw.Image(image)
                                                   ),
                                                 ),
                                                 pw.Expanded(
                                                   flex: 3,
                                                   child: pw.Column(
                                                       mainAxisAlignment: pw.MainAxisAlignment.center,
                                                       crossAxisAlignment: pw.CrossAxisAlignment.center,
                                                       mainAxisSize: pw.MainAxisSize.max,
                                                       children: [
                                                         pw.SizedBox(
                                                             height: 25
                                                         ),
                                                         boldText(
                                                             'بيان اسعار',myFont
                                                         ),
                                                         pw.Container(
                                                           color: const PdfColor(0.90196,0.90196,0.90196),
                                                           child: pw.Row(
                                                               mainAxisAlignment: pw.MainAxisAlignment.center,
                                                               crossAxisAlignment: pw.CrossAxisAlignment.center,
                                                               mainAxisSize: pw.MainAxisSize.max,
                                                               children: [
                                                                 boldText(
                                                                     '***',myFont
                                                                 ),
                                                               ]
                                                           ),
                                                         ),
                                                       ]
                                                   ),
                                                 ),
                                                 pw.Expanded(
                                                   flex: 2,
                                                   child: pw.Column(
                                                       mainAxisAlignment: pw.MainAxisAlignment.end,
                                                       crossAxisAlignment: pw.CrossAxisAlignment.end,
                                                       mainAxisSize: pw.MainAxisSize.max,
                                                       children: [
                                                         pw.SizedBox(
                                                             height: 70
                                                         ),
                                                         pw.Row(
                                                             mainAxisAlignment: pw.MainAxisAlignment.end,
                                                             crossAxisAlignment: pw.CrossAxisAlignment.center,
                                                             mainAxisSize: pw.MainAxisSize.max,
                                                             children: [
                                                               pw.SizedBox(
                                                                 width: 70,
                                                                 child: pw.Table(
                                                                     border: pw.TableBorder.all(
                                                                         width: 1,
                                                                         color: PdfColor.fromHex('000000')
                                                                     ),
                                                                     children: [
                                                                       pw.TableRow(
                                                                           children: [
                                                                             normalText(
                                                                                 '${cubit.getCompletedRepairDetailsModel?.visit?.createdAt?.year}-${cubit.getCompletedRepairDetailsModel?.visit?.createdAt?.month}-${cubit.getCompletedRepairDetailsModel?.visit?.createdAt?.day}',myFont
                                                                             ),
                                                                           ]
                                                                       ),
                                                                       pw.TableRow(
                                                                           children: [
                                                                             normalText(
                                                                                 '${cubit.getCompletedRepairDetailsModel?.visit?.expectedDate?.year}-${cubit.getCompletedRepairDetailsModel?.visit?.expectedDate?.month}-${cubit.getCompletedRepairDetailsModel?.visit?.expectedDate?.day}',myFont
                                                                             ),
                                                                           ]
                                                                       ),
                                                                     ]
                                                                 ),
                                                               ),
                                                               pw.Table(
                                                                   children: [
                                                                     pw.TableRow(
                                                                         children: [
                                                                           boldText(
                                                                               'تاريخ الدخول',myFont
                                                                           ),
                                                                         ]
                                                                     ),
                                                                     pw.TableRow(
                                                                         children: [
                                                                           boldText(
                                                                               'تاريخ الخروج',myFont
                                                                           ),
                                                                         ]
                                                                     ),
                                                                   ]
                                                               ),

                                                             ]
                                                         ),
                                                       ]
                                                   ),
                                                 ),
                                               ]
                                           ),
                                           pw.SizedBox(
                                               height: 2
                                           ),
                                           pw.Container(
                                               width: double.infinity,
                                               height: 2,
                                               color: const PdfColor(0,0,0)
                                           ),
                                           pw.SizedBox(
                                             height: 4,
                                           ),
                                           pw.Row(
                                               children: [
                                                 pw.Expanded(
                                                   flex: 2,
                                                   child: pw.Table(
                                                       border: pw.TableBorder.all(
                                                           width: 1,
                                                           color: PdfColor.fromHex('000000')
                                                       ),
                                                       children: [
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   '***',myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   cubit.getCompletedRepairDetailsModel?.phone??'***',myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   cubit.getCompletedRepairDetailsModel?.model??'***' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   cubit.getCompletedRepairDetailsModel?.clientCode??'***' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                       ]
                                                   ),
                                                 ),
                                                 pw.Expanded(
                                                   flex: 1,
                                                   child: pw.Table(
                                                       children: [
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'اسم المندوب :',myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'تليفون :',myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'موديل :' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'كود السيارة :' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                       ]
                                                   ),
                                                 ),
                                                 pw.SizedBox(
                                                     width: 10
                                                 ),
                                                 pw.Expanded(
                                                   flex: 1,
                                                   child: pw.Table(
                                                       border: pw.TableBorder.all(
                                                           width: 1,
                                                           color: PdfColor.fromHex('000000')
                                                       ),
                                                       children: [
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   cubit.getCompletedRepairDetailsModel?.name??'***' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   cubit.getCompletedRepairDetailsModel?.chassisNumber??'***' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   cubit.getCompletedRepairDetailsModel?.brand??'***' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   cubit.getCompletedRepairDetailsModel?.distances.toString()??'***' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                       ]
                                                   ),
                                                 ),
                                                 pw.Expanded(
                                                   flex: 1,
                                                   child: pw.Table(
                                                       children: [
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'اسم العميل :',myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'رقم الشاسيه :',myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'نوع العربية :' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'كيلومتر :' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                       ]
                                                   ),
                                                 ),
                                                 pw.SizedBox(
                                                     width: 10
                                                 ),
                                                 pw.Expanded(
                                                   flex: 1,
                                                   child: pw.Table(
                                                       border: pw.TableBorder.all(
                                                           width: 1,
                                                           color: PdfColor.fromHex('000000')
                                                       ),
                                                       children: [
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   '***' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   cubit.getCompletedRepairDetailsModel?.carNumber??'***' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   '***' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   cubit.getCompletedRepairDetailsModel?.color??'***' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                       ]
                                                   ),
                                                 ),
                                                 pw.Expanded(
                                                   flex: 1,
                                                   child: pw.Table(
                                                       children: [
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'رقم امر التشغيل :',myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'رقم اللوحة :',myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'مهندس الاستقبال :' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             children: [
                                                               normalText(
                                                                   'اللون :' ,myFont
                                                               ),
                                                             ]
                                                         ),
                                                       ]
                                                   ),
                                                 ),
                                               ]
                                           ),
                                           pw.SizedBox(
                                             height: 5,
                                           ),
                                           pw.Center(
                                             child: boldText(
                                                 'قطع غيار + اعمال خارجية',myFont
                                             ),
                                           ),
                                           pw.SizedBox(
                                             height: 5,
                                           ),
                                           pw.Table(
                                               border: pw.TableBorder.all(
                                                   width: 1,
                                                   color: PdfColor.fromHex('000000')
                                               ),
                                               children: [
                                                 pw.TableRow(
                                                     decoration: pw.BoxDecoration(
                                                       border: pw.TableBorder.all(
                                                           width: 1,
                                                           color: PdfColor.fromHex('000000')
                                                       ),
                                                       color: const PdfColor(0.90196,0.90196,0.90196),
                                                     ),
                                                     children: [
                                                       normalText(
                                                           'القيمة',myFont
                                                       ),
                                                       normalText(
                                                           'السعر',myFont
                                                       ),
                                                       normalText(
                                                           'الكمية',myFont
                                                       ),
                                                       normalText(
                                                           'اسم الصنف',myFont
                                                       ),
                                                     ]
                                                 ),
                                                 for(int i=0; i<cubit.getCompletedRepairDetailsModel!.visit!.components.length; i++)...[
                                                   pw.TableRow(
                                                       decoration: pw.BoxDecoration(
                                                           border: pw.TableBorder.all(
                                                               width: 1,
                                                               color: PdfColor.fromHex('000000')
                                                           )
                                                       ),
                                                       children: [
                                                         normalText(
                                                             (cubit.getCompletedRepairDetailsModel!.visit!.components[i].price!*cubit.getCompletedRepairDetailsModel!.visit!.components[i].quantity!).toString(),myFont
                                                         ),
                                                         normalText(
                                                             cubit.getCompletedRepairDetailsModel!.visit!.components[i].price.toString(),myFont
                                                         ),
                                                         normalText(
                                                             cubit.getCompletedRepairDetailsModel!.visit!.components[i].quantity.toString(),myFont
                                                         ),
                                                         normalText(
                                                             cubit.getCompletedRepairDetailsModel!.visit!.components[i].name!,myFont
                                                         ),
                                                       ]
                                                   ),
                                                 ],
                                                 for(int i=0; i<cubit.getCompletedRepairDetailsModel!.visit!.additions.length; i++)...[
                                                   pw.TableRow(
                                                       decoration: pw.BoxDecoration(
                                                           border: pw.TableBorder.all(
                                                               width: 1,
                                                               color: PdfColor.fromHex('000000')
                                                           )
                                                       ),
                                                       children: [
                                                         normalText(
                                                             cubit.getCompletedRepairDetailsModel!.visit!.additions[i].price!.toString(),myFont
                                                         ),
                                                         normalText(
                                                             cubit.getCompletedRepairDetailsModel!.visit!.additions[i].price.toString(),myFont
                                                         ),
                                                         normalText(
                                                             '1',myFont
                                                         ),
                                                         normalText(
                                                             cubit.getCompletedRepairDetailsModel!.visit!.additions[i].name!,myFont
                                                         ),
                                                       ]
                                                   ),
                                                 ],
                                               ]
                                           ),
                                           pw.SizedBox(
                                             height: 5,
                                           ),
                                           pw.Center(
                                             child: boldText(
                                                 'مصنعات',myFont
                                             ),
                                           ),
                                           pw.SizedBox(
                                             height: 5,
                                           ),
                                           pw.Table(
                                               border: pw.TableBorder.all(
                                                   width: 1,
                                                   color: PdfColor.fromHex('000000')
                                               ),
                                               children: [
                                                 pw.TableRow(
                                                     decoration: pw.BoxDecoration(
                                                       border: pw.TableBorder.all(
                                                           width: 1,
                                                           color: PdfColor.fromHex('000000')
                                                       ),
                                                       color: const PdfColor(0.90196,0.90196,0.90196),
                                                     ),
                                                     children: [
                                                       normalText(
                                                           'القيمة',myFont
                                                       ),
                                                       normalText(
                                                           'السعر',myFont
                                                       ),
                                                       normalText(
                                                           'الكمية',myFont
                                                       ),
                                                       normalText(
                                                           'اسم الصنف',myFont
                                                       ),
                                                     ]
                                                 ),
                                                 for(int i=0; i<cubit.getCompletedRepairDetailsModel!.visit!.services.length; i++)...[
                                                   pw.TableRow(
                                                       decoration: pw.BoxDecoration(
                                                           border: pw.TableBorder.all(
                                                               width: 1,
                                                               color: PdfColor.fromHex('000000')
                                                           )
                                                       ),
                                                       children: [
                                                         normalText(
                                                             cubit.getCompletedRepairDetailsModel!.visit!.services[i].price!.toString(),myFont
                                                         ),
                                                         normalText(
                                                             cubit.getCompletedRepairDetailsModel!.visit!.services[i].price.toString(),myFont
                                                         ),
                                                         normalText(
                                                             '1',myFont
                                                         ),
                                                         normalText(
                                                             cubit.getCompletedRepairDetailsModel!.visit!.services[i].name!,myFont
                                                         ),
                                                       ]
                                                   ),
                                                 ],
                                               ]
                                           ),
                                           pw.Expanded(
                                             child: pw.SizedBox(),
                                           ),
                                           pw.Row(
                                               crossAxisAlignment: pw.CrossAxisAlignment.start,
                                               mainAxisSize: pw.MainAxisSize.max,
                                               children: [
                                                 pw.Expanded(
                                                   child: pw.Table(
                                                       border: pw.TableBorder.all(
                                                           width: 1,
                                                           color: PdfColor.fromHex('000000')
                                                       ),
                                                       children: [
                                                         pw.TableRow(
                                                             decoration: pw.BoxDecoration(
                                                               border: pw.TableBorder.all(
                                                                   width: 1,
                                                                   color: PdfColor.fromHex('000000')
                                                               ),
                                                             ),
                                                             children: [
                                                               normalText(
                                                                   totalServices.toString(),myFont
                                                               ),
                                                               pw.Container(
                                                                 color: const PdfColor(0.90196,0.90196,0.90196),
                                                                 child: normalText(
                                                                     'صافي المصنعات',myFont
                                                                 ),
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             decoration: pw.BoxDecoration(
                                                               border: pw.TableBorder.all(
                                                                   width: 1,
                                                                   color: PdfColor.fromHex('000000')
                                                               ),
                                                             ),
                                                             children: [
                                                               normalText(
                                                                   (totalServices+cubit.getCompletedRepairDetailsModel!.visit!.discount!).toString(),myFont
                                                               ),
                                                               pw.Container(
                                                                 color: const PdfColor(0.90196,0.90196,0.90196),
                                                                 child: normalText(
                                                                     'صافي المصنعات بعد الخصم',myFont
                                                                 ),
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             decoration: pw.BoxDecoration(
                                                               border: pw.TableBorder.all(
                                                                   width: 1,
                                                                   color: PdfColor.fromHex('000000')
                                                               ),
                                                             ),
                                                             children: [
                                                               normalText(
                                                                   totalComponents.toString(),myFont
                                                               ),
                                                               pw.Container(
                                                                 color: const PdfColor(0.90196,0.90196,0.90196),
                                                                 child: normalText(
                                                                     'صافي القطع غيار',myFont
                                                                 ),
                                                               ),
                                                             ]
                                                         ),
                                                       ]
                                                   ),
                                                 ),
                                                 pw.Expanded(
                                                   child: pw.SizedBox(),
                                                 ),
                                                 pw.Expanded(
                                                   child: pw.Table(
                                                       border: pw.TableBorder.all(
                                                           width: 1,
                                                           color: PdfColor.fromHex('000000')
                                                       ),
                                                       children: [
                                                         pw.TableRow(
                                                             decoration: pw.BoxDecoration(
                                                               border: pw.TableBorder.all(
                                                                   width: 1,
                                                                   color: PdfColor.fromHex('000000')
                                                               ),
                                                             ),
                                                             children: [
                                                               normalText(
                                                                   (cubit.getCompletedRepairDetailsModel!.visit!.discount!+cubit.getCompletedRepairDetailsModel!.visit!.priceAfterDiscount!).toString(),myFont
                                                               ),
                                                               pw.Container(
                                                                 child: normalText(
                                                                     'الاجمالي',myFont
                                                                 ),
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             decoration: pw.BoxDecoration(
                                                               border: pw.TableBorder.all(
                                                                   width: 1,
                                                                   color: PdfColor.fromHex('000000')
                                                               ),
                                                             ),
                                                             children: [
                                                               normalText(
                                                                   (cubit.getCompletedRepairDetailsModel!.visit!.priceAfterDiscount!).toString(),myFont
                                                               ),
                                                               pw.Container(
                                                                 child: normalText(
                                                                     'الاجمالي بعد الخصم',myFont
                                                                 ),
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             decoration: pw.BoxDecoration(
                                                               border: pw.TableBorder.all(
                                                                   width: 1,
                                                                   color: PdfColor.fromHex('ffffff')
                                                               ),
                                                             ),
                                                             children: [
                                                               normalText(
                                                                   cubit.getCompletedRepairDetailsModel!.visit!.discount.toString(),myFont
                                                               ),
                                                               pw.Container(
                                                                 color: const PdfColor(0.90196,0.90196,0.90196),
                                                                 child: normalText(
                                                                     'خصم',myFont
                                                                 ),
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             decoration: pw.BoxDecoration(
                                                               border: pw.TableBorder.all(
                                                                   width: 1,
                                                                   color: PdfColor.fromHex('ffffff')
                                                               ),
                                                             ),
                                                             children: [
                                                               normalText(
                                                                   'نقدي',myFont
                                                               ),
                                                               normalText(
                                                                   'دفعات سابقة',myFont
                                                               ),
                                                             ]
                                                         ),
                                                         pw.TableRow(
                                                             decoration: pw.BoxDecoration(
                                                               border: pw.TableBorder.all(
                                                                   width: 1,
                                                                   color: PdfColor.fromHex('000000')
                                                               ),
                                                               color: const PdfColor(0.90196,0.90196,0.90196),
                                                             ),
                                                             children: [
                                                               normalText(
                                                                   cubit.getCompletedRepairDetailsModel!.visit!.priceAfterDiscount.toString(),myFont
                                                               ),
                                                               normalText(
                                                                   '0',myFont
                                                               ),
                                                             ]
                                                         ),
                                                       ]
                                                   ),
                                                 ),
                                               ]
                                           ),
                                           pw.SizedBox(
                                             height: 10,
                                           ),
                                           pw.Container(
                                               width: double.infinity,
                                               height: 50,
                                               color: const PdfColor(0.90196,0.90196,0.90196),
                                               child: pw.Row(
                                                   mainAxisSize: pw.MainAxisSize.max,
                                                   children: [
                                                     pw.Expanded(
                                                         child: pw.Container(
                                                           height: 50,
                                                           decoration: pw.BoxDecoration(
                                                             border: pw.TableBorder.all(
                                                                 width: 1,
                                                                 color: PdfColor.fromHex('000000')
                                                             ),
                                                             color: const PdfColor(1,1,1),
                                                           ),
                                                         )
                                                     ),
                                                     boldText('اعمال هامة لم تتم بالسيارة', myFont),
                                                   ]
                                               )
                                           ),
                                           pw.Row(
                                               mainAxisSize: pw.MainAxisSize.max,
                                               mainAxisAlignment: pw.MainAxisAlignment.end,
                                               children: [
                                                 pw.Padding(
                                                     padding: const pw.EdgeInsets.symmetric(horizontal: 10,vertical: 25),
                                                     child: pw.Column(
                                                         crossAxisAlignment: pw.CrossAxisAlignment.center,
                                                         children: [
                                                           boldText('توقيع العميل', myFont),
                                                           normalText('.........................................' , myFont)
                                                         ]
                                                     )
                                                 )
                                               ]
                                           ),
                                           pw.Row(
                                               mainAxisSize: pw.MainAxisSize.max,
                                               mainAxisAlignment: pw.MainAxisAlignment.start,
                                               children: [
                                                 pw.Column(
                                                     crossAxisAlignment: pw.CrossAxisAlignment.start,
                                                     children: [
                                                       pw.Row(
                                                           mainAxisAlignment: pw.MainAxisAlignment.start,
                                                           children: [
                                                             boldText('Email: ', myFont),
                                                             normalText('fixerservicecenter@gmail.com' , myFont)
                                                           ]
                                                       ),
                                                       pw.Row(
                                                           mainAxisAlignment: pw.MainAxisAlignment.start,
                                                           children: [
                                                             boldText('Address: ', myFont),
                                                             normalText('117 St. Teraat Al Gabal - Hadaik el Quiba' , myFont)
                                                           ]
                                                       ),
                                                     ]
                                                 ),
                                               ]
                                           )
                                         ]
                                     )
                                 )
                             )
                           ]
                       )
                   )
               ); // Center
             }));

         pdf.save().then((value) {
           pdfBytes = value;

           getApplicationDocumentsDirectory().then((directory) {
             // Create a file in the documents directory
             final file = File('${directory.path}/${model.id!}.pdf');

             // Write the PDF bytes to the file
             file.writeAsBytes(pdfBytes).then((_) {
               //print('PDF saved at ${file.path}');
             }).catchError((error) {
               //print('Error writing PDF to file: $error');
             });
           }).catchError((error) {
             //print('Error getting documents directory: $error');
           });
         });// Page

       });
     });

     await printArabicPdf(pdf);
   },
   child: Padding(
     padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
   
     child: Container(
       width: double.infinity,
       decoration: BoxDecoration(
         color: FlutterFlowTheme.of(context).secondaryBackground,
         boxShadow: [
           BoxShadow(
             blurRadius: 0,
             color: FlutterFlowTheme.of(context).lineColor,
             offset: const Offset(
               0,
               1,
             ),
           )
         ],
       ),
       child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsetsDirectional
                      .fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize:
                    MainAxisSize.max,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        '${(model!.brand)??'-'} ${(model.category)??'-'}',
                        style:
                        FlutterFlowTheme.of(
                            context)
                            .bodyMedium
                            .override(
                          fontFamily: FlutterFlowTheme.of(
                              context)
                              .bodyMediumFamily,
                          letterSpacing:
                          0,
                          useGoogleFonts: GoogleFonts
                              .asMap()
                              .containsKey(
                              FlutterFlowTheme.of(context)
                                  .bodyMediumFamily),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsetsDirectional
                        .fromSTEB(24, 0, 0, 0),
                    child: Column(
                      mainAxisSize:
                      MainAxisSize.max,
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        AutoSizeText(
                          (model.carCode)??'-',
                          style:
                          FlutterFlowTheme.of(
                              context)
                              .bodyMedium
                              .override(
                            fontFamily: FlutterFlowTheme.of(
                                context)
                                .bodyMediumFamily,
                            letterSpacing:
                            0,
                            useGoogleFonts: GoogleFonts
                                .asMap()
                                .containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsetsDirectional
                        .fromSTEB(24, 0, 0, 0),
                    child: Column(
                      mainAxisSize:
                      MainAxisSize.max,
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        AutoSizeText(
                          (model.client)??'-',
                          style:
                          FlutterFlowTheme.of(
                              context)
                              .bodyMedium
                              .override(
                            fontFamily: FlutterFlowTheme.of(
                                context)
                                .bodyMediumFamily,
                            letterSpacing:
                            0,
                            useGoogleFonts: GoogleFonts
                                .asMap()
                                .containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsetsDirectional
                        .fromSTEB(24, 0, 0, 0),
                    child: Column(
                      mainAxisSize:
                      MainAxisSize.max,
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        AutoSizeText(
                          '${(model.paidOn)?.day??'-'}/${(model.paidOn)?.month??'-'}/${(model.paidOn)?.year??'-'}',
                          style:
                          FlutterFlowTheme.of(
                              context)
                              .bodyMedium
                              .override(
                            fontFamily: FlutterFlowTheme.of(
                                context)
                                .bodyMediumFamily,
                            letterSpacing:
                            0,
                            useGoogleFonts: GoogleFonts
                                .asMap()
                                .containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyMediumFamily),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsetsDirectional
                      .fromSTEB(24, 0, 0, 0),
                  child: Column(
                    mainAxisSize:
                    MainAxisSize.max,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        '${(model.priceAfterDiscount)??'-'} EGP',
                        style:
                        FlutterFlowTheme.of(
                            context)
                            .bodyMedium
                            .override(
                          fontFamily: FlutterFlowTheme.of(
                              context)
                              .bodyMediumFamily,
                          letterSpacing:
                          0,
                          useGoogleFonts: GoogleFonts
                              .asMap()
                              .containsKey(
                              FlutterFlowTheme.of(context)
                                  .bodyMediumFamily),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
     ),
   ),
 );
}

pw.Padding boldText (String s, pw.Font myFont) {
  return pw.Padding(
      padding: const pw.EdgeInsets.all(3),
      child: pw.Center(child: pw.Directionality(child: pw.Text(s, style: pw.TextStyle(fontWeight: pw.FontWeight.bold,font: myFont,fontSize: 10)),textDirection: pw.TextDirection.rtl))
  );
}

pw.Padding normalText (String s, pw.Font myFont) {
  return pw.Padding(
      padding: const pw.EdgeInsets.all(3),
      child: pw.Center(child: pw.Directionality(child: pw.Text(s, style: pw.TextStyle(font: myFont,fontSize: 8)),textDirection: pw.TextDirection.rtl))
  );
}

Future<void> printArabicPdf (pw.Document pdf) async{
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
}