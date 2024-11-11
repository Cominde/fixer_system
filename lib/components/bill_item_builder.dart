import 'dart:io';

import 'package:fixer_system/cubit/cubit.dart';
import 'package:fixer_system/models/get_completed_repair_details_model.dart';
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
import 'package:pdfrx/pdfrx.dart';

class BillItem extends StatefulWidget {
  final CompletedRepairData model;
  const BillItem({super.key, required this.model});

  @override
  State<BillItem> createState() => _BillItemState();
}

class _BillItemState extends State<BillItem> {

  late  pw.Document pdf;
  late Uint8List pdfBytes;

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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final AppCubit cubit = AppCubit.get(context);
        await cubit.getCompletedRepairDetails(repairId: widget.model.id!);

        int totalServices = 0;
        if (cubit.getCompletedRepairDetailsModel!.visit!.services.isNotEmpty) {
          totalServices = cubit.getCompletedRepairDetailsModel?.visit?.services.map((service) => service.price).reduce((a, b) => a! + b!)??0;
        }
        int totalComponents = 0;
        if (cubit.getCompletedRepairDetailsModel!.visit!.components.isNotEmpty) {
          totalComponents = cubit.getCompletedRepairDetailsModel?.visit?.components.map((component) => component.price).reduce((a, b) => a! + b!)??0;
        }
        int totalAdditions = 0;
        if (cubit.getCompletedRepairDetailsModel!.visit!.additions.isNotEmpty) {
          totalComponents = cubit.getCompletedRepairDetailsModel?.visit?.additions.map((component) => component.price).reduce((a, b) => a! + b!)??0;
        }

        const int itemsPerPage = 13; // Set the number of items per page
        final visitComponents = cubit.getCompletedRepairDetailsModel?.visit?.components;
        final visitAdditions = cubit.getCompletedRepairDetailsModel?.visit?.additions;
        final visitServices = cubit.getCompletedRepairDetailsModel?.visit?.services;

        // Combine all the widgets
        final List<dynamic> allItems = [...?visitComponents, ...?visitAdditions, ...?visitServices];

        // Split into chunks to handle pagination
        int currentIndex = 0;
        int currentPage = 1;
        int numberOfPages = (allItems.length / itemsPerPage).ceil();


        pdf = pw.Document();

        rootBundle.load('assets/images/logo.png').then((value) {
          pw.MemoryImage image = pw.MemoryImage(value.buffer.asUint8List());

          rootBundle.load("assets/fonts/Hacen_Tunisia/Hacen-Tunisia.ttf").then((value) {
            pw.Font myFont = pw.Font.ttf(value);

            while (currentIndex < allItems.length) {
              final endIndex = currentIndex + itemsPerPage;
              final itemsToDisplay = allItems.sublist(currentIndex, endIndex > allItems.length ? allItems.length : endIndex);
              final pageNumber = currentPage++;

              List<Service> services=[];
              List<Addition> additions=[];
              List<Component> components=[];

              for(final item in itemsToDisplay) {
                if(item is Service) {
                  services.add(item);
                } else if(item is Addition) {
                  additions.add(item);
                } else if(item is Component) {
                  components.add(item);
                }
              }

              pdf.addPage(pw.Page(
                  pageFormat: PdfPageFormat.a4,
                  margin: const pw.EdgeInsets.all(24),
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
                                                                          cubit.getCompletedRepairDetailsModel?.visit?.invoiceID??"***",myFont
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
                                                                height: 70,
                                                                child: allItems.length > 13 ? normalText('$pageNumber OF $numberOfPages',myFont) : null,
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
                                                                        (cubit.getCompletedRepairDetailsModel?.visit?.distance??cubit.getCompletedRepairDetailsModel?.distances??'***').toString() ,myFont
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
                                                                        (cubit.getCompletedRepairDetailsModel?.visit?.invoiceID != null ? cubit.getCompletedRepairDetailsModel?.visit?.invoiceID!.substring(2) : "***")??"***" ,myFont
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
                                                if(components.length+additions.length > 0) ... [
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
                                                        for(int i=0; i<components.length; i++)...[
                                                          pw.TableRow(
                                                              decoration: pw.BoxDecoration(
                                                                  border: pw.TableBorder.all(
                                                                      width: 1,
                                                                      color: PdfColor.fromHex('000000')
                                                                  )
                                                              ),
                                                              children: [
                                                                normalText(
                                                                    (components[i].price!*components[i].quantity!).toString(),myFont
                                                                ),
                                                                normalText(
                                                                    components[i].price.toString(),myFont
                                                                ),
                                                                normalText(
                                                                    components[i].quantity.toString(),myFont
                                                                ),
                                                                normalText(
                                                                    components[i].name!,myFont
                                                                ),
                                                              ]
                                                          ),
                                                        ],
                                                        for(int i=0; i<additions.length; i++)...[
                                                          pw.TableRow(
                                                              decoration: pw.BoxDecoration(
                                                                  border: pw.TableBorder.all(
                                                                      width: 1,
                                                                      color: PdfColor.fromHex('000000')
                                                                  )
                                                              ),
                                                              children: [
                                                                normalText(
                                                                    additions[i].price!.toString(),myFont
                                                                ),
                                                                normalText(
                                                                    additions[i].price.toString(),myFont
                                                                ),
                                                                normalText(
                                                                    '1',myFont
                                                                ),
                                                                normalText(
                                                                    additions[i].name!,myFont
                                                                ),
                                                              ]
                                                          ),
                                                        ],
                                                      ]
                                                  ),
                                                ],
                                                if(services.isNotEmpty) ... [
                                                  pw.SizedBox(
                                                    height: 5,
                                                  ),
                                                  pw.Center(
                                                    child: boldText(
                                                        'مصنعيات',myFont
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
                                                        for(int i=0; i<services.length; i++)...[
                                                          pw.TableRow(
                                                              decoration: pw.BoxDecoration(
                                                                  border: pw.TableBorder.all(
                                                                      width: 1,
                                                                      color: PdfColor.fromHex('000000')
                                                                  )
                                                              ),
                                                              children: [
                                                                normalText(
                                                                    services[i].price!.toString(),myFont
                                                                ),
                                                                normalText(
                                                                    services[i].price.toString(),myFont
                                                                ),
                                                                normalText(
                                                                    '1',myFont
                                                                ),
                                                                normalText(
                                                                    services[i].name!,myFont
                                                                ),
                                                              ]
                                                          ),
                                                        ],
                                                      ]
                                                  ),
                                                ],
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
                                                                        (totalServices-(cubit.getCompletedRepairDetailsModel?.visit?.discount??0)).toString(),myFont
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
                                                                        (totalComponents+totalAdditions).toString(),myFont
                                                                    ),
                                                                    pw.Container(
                                                                      color: const PdfColor(0.90196,0.90196,0.90196),
                                                                      child: normalText(
                                                                          'صافي قطع الغيار و الاعمال الخارجية',myFont
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
                                                                        ((cubit.getCompletedRepairDetailsModel?.visit?.discount??0)+(cubit.getCompletedRepairDetailsModel?.visit?.priceAfterDiscount??0)).toString(),myFont
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
                                                                        (cubit.getCompletedRepairDetailsModel?.visit?.priceAfterDiscount!).toString(),myFont
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
                                                                        cubit.getCompletedRepairDetailsModel?.visit?.discount.toString()??'',myFont
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
                                                                        cubit.getCompletedRepairDetailsModel?.visit?.priceAfterDiscount.toString()??'',myFont
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
                                                                  child: normalText(cubit.getCompletedRepairDetailsModel?.visit?.note1??'' , myFont,)
                                                              )
                                                          ),
                                                          boldText('اعمال هامة لم تتم بالسيارة', myFont),
                                                        ]
                                                    )
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
                                                                  child: normalText(cubit.getCompletedRepairDetailsModel?.visit?.note2??'' , myFont)
                                                              )
                                                          ),
                                                          boldText('ملاحظات هامة', myFont),
                                                        ]
                                                    )
                                                ),
                                                pw.Row(
                                                    mainAxisSize: pw.MainAxisSize.max,
                                                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      pw.Padding(
                                                        padding: const pw.EdgeInsets.only(left: 10,right: 10,top: 10),
                                                        child: pw.Column(
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
                                                      ),
                                                      pw.Padding(
                                                          padding: const pw.EdgeInsets.only(left: 10,right: 10,top: 10),
                                                          child: pw.Column(
                                                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                                                              children: [
                                                                boldText('توقيع العميل', myFont),
                                                                normalText('.........................................' , myFont)
                                                              ]
                                                          )
                                                      ),
                                                    ]
                                                ),
                                              ]
                                          )
                                      )
                                  )
                                ]
                            )
                        )
                    ); // Center
                  }));
              currentIndex = endIndex;
            }

            pdf.save().then((value) {
              pdfBytes = value;

              getApplicationDocumentsDirectory().then((directory) {
                // Create a file in the documents directory
                final file = File('${directory.path}/${cubit.getCompletedRepairDetailsModel?.visit?.invoiceID??cubit.getCompletedRepairDetailsModel?.visit?.id}.pdf');

                // Write the PDF bytes to the file
                file.writeAsBytes(pdfBytes).then((_) {
                  //print('PDF saved at ${file.path}');
                }).catchError((error) {
                  //print('Error writing PDF to file: $error');
                });
              }).catchError((error) {
                //print('Error getting documents directory: $error');
              });

              showDialog(context: context, builder: (context) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                     mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new_rounded),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.print_rounded),
                            onPressed: () async {
                              await printArabicPdf(pdf);
                            },
                          ),
                        ],
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: PdfViewer.data(pdfBytes, sourceName: 'sourceName'),
                            ),
                          ),
                      ),
                    ],
                  ),
                ),

              ),);
            });// Page

          });
        });
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
                          '${(widget.model.brand)??'-'} ${(widget.model.category)??'-'}',
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
                            (widget.model.carCode)??'-',
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
                            (widget.model.client)??'-',
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
                            '${(widget.model.paidOn)?.year??0000}-${(widget.model.paidOn)?.month??00}-${(widget.model.paidOn)?.day??00}',
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
                          '${(widget.model.priceAfterDiscount)??'-'} EGP',
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
}