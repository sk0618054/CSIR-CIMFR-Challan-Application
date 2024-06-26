import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import '../models/gap_challan.dart';
import 'gap_edit_form_screen.dart';
import 'gap_viewAllForm_screen.dart';
import '../utils/utils.dart';

class GAPFormDataViewPrint extends StatefulWidget {
  final String formId;

  GAPFormDataViewPrint({required this.formId});

  @override
  State<GAPFormDataViewPrint> createState() => _GAPFormDataViewPrintState();
}

class _GAPFormDataViewPrintState extends State<GAPFormDataViewPrint> {
  GAPFormData? formDataout;

  Future<Uint8List> generatePdf(GAPFormData formData) async {
    final pdf = pw.Document();
    final logo = await _loadLogo();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          buildHeader(logo, formData),
          pw.Divider(),
          buildProjectInfo(formData),
          pw.SizedBox(height: 1 * PdfPageFormat.cm),
          buildTable(formData),
          pw.SizedBox(height: 1 * PdfPageFormat.cm),
          buildRemarksAndSignature(formData),
        ],
      ),
    );

    return pdf.save();
  }

  Future<pw.MemoryImage> _loadLogo() async {
    final data = await rootBundle.load('assets/images/logo.jpg');
    return pw.MemoryImage(data.buffer.asUint8List());
  }

  pw.Widget buildHeader(pw.MemoryImage logo, GAPFormData formData) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Container(
          width: 80,
          height: 80,
          child: pw.Image(logo),
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Challan',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12),
            ),
            pw.Text(
              'Challan of Cash/Cheque/Demand Draft/ECS Paid into the Account',
              style: pw.TextStyle(fontSize: 10),
            ),
            pw.Text(
              'CSIR-Central Institute of Mining & Fuel Research',
              style: pw.TextStyle(fontSize: 10),
            ),
            pw.Text(
              'Barwa Road, Dhanbad - 826015',
              style: pw.TextStyle(fontSize: 10),
            ),
            pw.Text(
              'Project Planning & Monitoring',
              style: pw.TextStyle(fontSize: 10),
            ),
          ],
        ),
        pw.Text(
          'Challan No: ${formData.uniquecode}',
          style: pw.TextStyle(fontSize: 10),
        ),
      ],
    );
  }

  pw.Widget buildProjectInfo(GAPFormData formData) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // buildInfoRow('Challan No:', formData.uniquecode, 'Entry Date:', formData.dateOfStart),
          // buildInfoRow('', '',  'Installment No:', '1'),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Expanded(
                flex: 1,
                child: pw.Row(
                  children: [
                    pw.Text('1.By Whom Tendered:',
                        style: pw.TextStyle(
                            // fontWeight: pw.FontWeight.bold,
                            fontSize: 10)),
                    pw.Text('', style: pw.TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text('Installment No:',
                        style: pw.TextStyle(
                            // fontWeight: pw.FontWeight.bold,
                            fontSize: 10)),
                    pw.Text(formData.installmentNo, style: pw.TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              pw.Expanded(
                flex: 1,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Text('Entry Date: ',
                        style: pw.TextStyle(
                            // fontWeight: pw.FontWeight.bold,
                            fontSize: 10)),
                    pw.Text(formData.entryDate,
                        style: pw.TextStyle(fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 3),
          // buildInfoRow(
          //     '1.By Whom Tendered:', '', 'Entry Date:', formData.entryDate),
          // buildInfoRow(' Name:', formData.name, 'Section:', formData.section),
          buildInfoRow(' Name:', formData.name, '', ''),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Expanded(
                flex: 1,
                child: pw.Container(
                  width: 500, // Adjust width as needed to fit the text
                  child: pw.Text(
                    'Address:' + ' ${formData.address}',
                    style: pw.TextStyle(fontSize: 10),
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
          // buildInfoRow(' Address:', formData.address, '', ''),

          // buildInfoRow(
          //     ' Address:', formData.address, 'Project Type:', 'SPONSOR'),
          buildInfoRow(
              '',
              '',
              // ' Project Type:', 'GRANT AID',
              'Dept:',
              formData.section),
          pw.SizedBox(height: 9),
          buildInfoRow('2.Sponsor\'s Letter Reference:',
              formData.sponsorLetterRef, '', ''),
          pw.SizedBox(height: 3),
          buildInfoRow('3.Project Title:', formData.projectTitle, '', ''),
          pw.SizedBox(height: 9),
          buildInfoRow('4.Project Leader/s:', formData.projectLeader, 'HOS:',
              formData.hos),
          buildInfoRow('5.Project Coordinator:', formData.projectCoordinator,
              'HORG:', formData.horg),
          buildInfoRow('6.Payment Amount:', formData.paymentAmount.toString(),
              'Dated:', formData.dated),
          buildInfoRow(
            '7.Cheque/DD No./ECS:',
            formData.cheque,
            'Code:',
            formData.code,
          ),
          buildInfoRow('8.Head of Account/Project:', formData.headOfAccount,
              'Date of Start:', formData.startDate),
          buildInfoRow(
            '9.Duration:',
            formData.duration,
            'Completion Date:',
            formData.completionDate,
          ),
          // buildInfoRow(
          //   '','',
          //   // '10.Sponsor Contribution:',
          //   // formData.sponsorContribution.toString(),
          //   'Completion Date:',
          //   formData.completionDate,
          // ),
        ],
      );

  pw.Widget buildInfoRow(
      String title1, String value1, String title2, String value2) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Expanded(
          flex: 1,
          child: pw.Row(
            children: [
              pw.Text('$title1 ',
                  style: pw.TextStyle(

                      // fontWeight: pw.FontWeight.bold,
                      fontSize: 10)),
              pw.Text(
                value1,
                style: pw.TextStyle(fontSize: 10),
                softWrap: true,
              ),
            ],
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.Row(
            // mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text('$title2 ',
                  style: pw.TextStyle(
                      // fontWeight: pw.FontWeight.bold,
                      fontSize: 10)),
              pw.Text(value2, style: pw.TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget buildTable(GAPFormData formData) {
    final headers = [
      '',
      'Particulars/Items',
      'Total Cost of the Project',
      '1st Year',
      '2nd Year',
      '3rd Year',
      'Amt Rec'
    ];

    final data = [
      [
        pw.Column(children: [
          pw.Text('A', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text('1', style: pw.TextStyle(fontSize: 8)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('2', style: pw.TextStyle(fontSize: 8)),
          pw.SizedBox(height: 3 * PdfPageFormat.mm),
        ]),
        pw.Column(
            // mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Capital Expenditure', style: pw.TextStyle(fontSize: 12)),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Text('Land & Bldg/Field Inst.',
                  style: pw.TextStyle(fontSize: 10)),
              pw.SizedBox(height: 2 * PdfPageFormat.mm),
              pw.Text('Equipment', style: pw.TextStyle(fontSize: 10)),
              pw.SizedBox(height: 3 * PdfPageFormat.mm),
            ]),
        pw.Column(children: [
          pw.Text('', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(formData.landBuildingTotal, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text(formData.equipmentTotal, style: pw.TextStyle(fontSize: 10)),
        ]),
        pw.Column(children: [
          pw.Text('', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(formData.landBuilding1stYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text(formData.equipment1stYear, style: pw.TextStyle(fontSize: 10)),
        ]),
        pw.Column(children: [
          pw.Text('', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(formData.landBuilding2ndYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text(formData.equipment2ndYear, style: pw.TextStyle(fontSize: 10)),
        ]),
        pw.Column(children: [
          pw.Text('', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(formData.landBuilding3rdYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text(formData.equipment3rdYear, style: pw.TextStyle(fontSize: 10)),
        ]),
        pw.Column(children: [
          pw.Text('', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(formData.landBuildingAmtRec, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text(formData.equipmentAmtRec, style: pw.TextStyle(fontSize: 10)),
        ]),
      ],
      ['3', 'Total Capital', formData.totalCapitalTotal, formData.totalCapital1stYear, formData.totalCapital2ndYear, formData.totalCapital3rdYear, formData.totalCapitalAmtRec],
      [
        pw.Column(children: [
          pw.Text('B', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text('4', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('5', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('6', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('7', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('8', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('9', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('10', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
        ]),
        pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text('Revenue Expenditure', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text('Personnel/Salaries', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('Consumables/Supplies', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('Travels', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('Contingency', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('Overheads', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('Dev.Maint.Awarness', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text('Testing', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
        ]),
        pw.Column(children: [
          pw.Text('', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(formData.personnelTotal, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.consumablesTotal, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.travelsTotal, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.contingencyTotal, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.overheadsTotal, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.devMaintTotal, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.testingTotal, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

        ]),
        pw.Column(children: [
          pw.Text('', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(formData.personnel1stYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.consumables1stYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.travels1stYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.contingency1stYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.overheads1stYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.devMaint1stYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.testing1stYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

        ]),
        pw.Column(children: [
          pw.Text('', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(formData.personnel2ndYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.consumables2ndYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.travels2ndYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.contingency2ndYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.overheads2ndYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.devMaint2ndYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.testing2ndYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

        ]),
        pw.Column(children: [
          pw.Text('', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(formData.personnel3rdYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.consumables3rdYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.travels3rdYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.consumables3rdYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.overheads3rdYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.devMaint3rdYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.testing3rdYear, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

        ]),
        pw.Column(children: [
          pw.Text('', style: pw.TextStyle(fontSize: 12)),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Text(formData.personnelAmtRec, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.consumablesAmtRec, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.travelsAmtRec, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.contingencyAmtRec, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.overheadsAmtRec, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.devMaintAmtRec, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

          pw.Text(formData.testingAmtRec, style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(height: 2*PdfPageFormat.mm),

        ]),
      ],
      // [
      //   '',
      //   pw.Row(
      //     children: [
      //       pw.Expanded(
      //         child: pw.Column(
      //           crossAxisAlignment: pw.CrossAxisAlignment.start,
      //           children: [
      //             pw.Text('1', textAlign: pw.TextAlign.center),
      //           ],
      //         ),
      //       ),
      //       pw.Expanded(
      //         child: pw.Column(
      //           crossAxisAlignment: pw.CrossAxisAlignment.start,
      //           children: [
      //             pw.Text('Land & Bldg/Field Inst.'),
      //             pw.Row(
      //               children: [
      //                 pw.Expanded(
      //                   child: pw.Table.fromTextArray(
      //                     border: null,
      //                     headers: [],
      //                     data: [
      //                       [
      //                         formData.landBuildingTotal ?? '',
      //                         formData.landBuilding1stYear ?? '0',
      //                         formData.landBuilding2ndYear ?? '0',
      //                         formData.landBuilding3rdYear ?? '0',
      //                         formData.landBuildingAmtRec ?? '',
      //                       ],
      //                     ],
      //                     cellAlignments: {
      //                       0: pw.Alignment.centerRight,
      //                       1: pw.Alignment.centerRight,
      //                       2: pw.Alignment.centerRight,
      //                       3: pw.Alignment.centerRight,
      //                       4: pw.Alignment.centerRight,
      //                     },
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      //   '',
      //   '',
      //   '',
      //   ''
      // ],
      // [
      //   '2',
      //   'Equipment',
      //   formData.equipmentTotal ?? '',
      //   formData.equipment1stYear ?? '0',
      //   formData.equipment2ndYear ?? '0',
      //   formData.equipment3rdYear ?? '0',
      //   formData.equipmentAmtRec ?? '',
      // ],
      // [
      //   '3',
      //   'Total Capital',
      //   formData.totalCapitalTotal ?? '',
      //   formData.totalCapital1stYear ?? '0',
      //   formData.totalCapital2ndYear ?? '0',
      //   formData.totalCapital3rdYear ?? '0',
      //   formData.totalCapitalAmtRec ?? '',
      // ],
      // ['B', 'Revenue Expenditure', '', '', '', '', ''],
      // [
      //   '4',
      //   'Personnel/Salaries',
      //   formData.personnelTotal ?? '0',
      //   formData.personnel1stYear ?? '0',
      //   formData.personnel2ndYear ?? '0',
      //   formData.personnel3rdYear ?? '0',
      //   formData.personnelAmtRec ?? '0',
      // ],
      // [
      //   '5',
      //   'Consumables/Supplies',
      //   formData.consumablesTotal ?? '0',
      //   formData.consumables1stYear ?? '0',
      //   formData.consumables2ndYear ?? '0',
      //   formData.consumables3rdYear ?? '0',
      //   formData.consumablesAmtRec ?? '0',
      // ],
      // [
      //   '6',
      //   'Travels',
      //   formData.travelsTotal ?? '0',
      //   formData.travels1stYear ?? '0',
      //   formData.travels2ndYear ?? '0',
      //   formData.travels3rdYear ?? '0',
      //   formData.travelsAmtRec ?? '0',
      // ],
      // [
      //   '7',
      //   'Contingency',
      //   formData.contingencyTotal ?? '0',
      //   formData.contingency1stYear ?? '0',
      //   formData.contingency2ndYear ?? '0',
      //   formData.contingency3rdYear ?? '0',
      //   formData.contingencyAmtRec ?? '0',
      // ],
      // [
      //   '8',
      //   'Overheads',
      //   formData.overheadsTotal ?? '0',
      //   formData.overheads1stYear ?? '0',
      //   formData.overheads2ndYear ?? '0',
      //   formData.overheads3rdYear ?? '0',
      //   formData.overheadsAmtRec ?? '0',
      // ],
      // [
      //   '9',
      //   'Dev./Maint./Awareness',
      //   formData.devMaintTotal ?? '0',
      //   formData.devMaint1stYear ?? '0',
      //   formData.devMaint2ndYear ?? '0',
      //   formData.devMaint3rdYear ?? '0',
      //   formData.devMaintAmtRec ?? '0',
      // ],
      // [
      //   '',
      //   'Testing',
      //   formData.testingTotal ?? '0',
      //   formData.testing1stYear ?? '0',
      //   formData.testing2ndYear ?? '0',
      //   formData.testing3rdYear ?? '0',
      //   formData.testingAmtRec ?? '0',
      // ],

      [
        '',
        'Total Revenue',
        formData.totalRevenueTotal ?? '0',
        formData.totalRevenue1stYear ?? '0',
        formData.totalRevenue2ndYear ?? '0',
        formData.totalRevenue3rdYear ?? '0',
        formData.totalRevenueAmtRec ?? '0',
      ],
      ['', 'G.Total(A+B)', formData.gTotalTotal, formData.gTotal1stYear, formData.gTotal2ndYear, formData.gTotal3rdYear, formData.gTotalAmtRec],
    ];

    return pw.Table.fromTextArray(
      headers: headers,
      data: data,
      border: pw.TableBorder.all(width: 0),
      // headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
      cellHeight: 10,
      cellAlignments: {
        0: pw.Alignment.center,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.centerRight,
        4: pw.Alignment.centerRight,
        5: pw.Alignment.centerRight,
      },
      columnWidths: {
        0: pw.FixedColumnWidth(20),
        1: pw.FixedColumnWidth(150),
        2: pw.FixedColumnWidth(75),
        3: pw.FixedColumnWidth(40),
        4: pw.FixedColumnWidth(40),
        5: pw.FixedColumnWidth(60),
      },
    );
  }

  pw.Widget buildRemarksAndSignature(GAPFormData formData) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          width: 500, // Adjust width as needed to fit the text
          child: pw.Text(
            'Remarks: ${formData.remarks}',
            style: pw.TextStyle(fontSize: 10),
            softWrap: true,
          ),
        ),
        pw.SizedBox(height: 2 * PdfPageFormat.cm),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'Breakup Of Fund Release',
              style: pw.TextStyle(fontSize: 8),
            ),
            pw.Text(
                'Signature & Designation of Officer Ordering money to be paid in',
                style: pw.TextStyle(fontSize: 10)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challan Details'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          GAPEditFormPage(initialData: formDataout?.toJson())));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('gapForm')
                  .doc(widget.formId)
                  .delete();
              showSnackBar("Challan deleted", context);
              Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GAPAllFormViewPage()))
                  .then((value) => setState(() {}));
            },
          ),
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () async {
              if (formDataout != null) {
                final pdfBytes = await generatePdf(formDataout!);
                await Printing.layoutPdf(onLayout: (format) => pdfBytes);
              }
            },
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('gapForm')
            .doc(widget.formId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Challan not found'));
          }

          GAPFormData formData = GAPFormData.fromSnap(snapshot.data!);
          formDataout = formData;

          return ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              InfoCard(title: 'Challan Number', value: formData.uniquecode),
              InfoCard(title: '1.Whom tendered:', value: ''),
              InfoCard(title: 'Name', value: formData.name),
              InfoCard(title: 'Address', value: formData.address),
              InfoCard(title: 'Installment No ', value: formData.installmentNo),
              InfoCard(title: 'Entry Date', value: formData.entryDate),
              InfoCard(
                  title: '2.Sponsor Letter Ref',
                  value: formData.sponsorLetterRef),
              InfoCard(title: '3.Project Title', value: formData.projectTitle),
              InfoCard(title: '4.Project Leader', value: formData.projectLeader),
              InfoCard(
                  title: '5.Project Coordinator',
                  value: formData.projectCoordinator),
              InfoCard(title: '6.Payment Amount', value: formData.paymentAmount),
              InfoCard(title: '7.Cheque', value: formData.cheque),
              InfoCard(title: '8.Head of Account', value: formData.headOfAccount),
              InfoCard(title: '9.Duration', value: formData.duration),
              InfoCard(
                  title: 'Sponsor Contribution',
                  value: formData.sponsorContribution),
              InfoCard(title: 'Section', value: formData.section),
              InfoCard(title: 'Project Type', value: formData.projectType),
              InfoCard(title: 'HOS', value: formData.hos),
              InfoCard(title: 'HORG', value: formData.horg),
              InfoCard(title: 'Dated', value: formData.dated),
              InfoCard(title: 'Code', value: formData.code),
              InfoCard(title: 'Start Date', value: formData.startDate),
              InfoCard(
                  title: 'Completion Date', value: formData.completionDate),

// Financial Fields
            InfoCard(title: 'B.Revenue Expenditure', value: ''),
              InfoCard(title: '1.Land Building', value: ''),
              InfoCard(
                  title: 'Land Building Total',
                  value: formData.landBuildingTotal),
              InfoCard(
                  title: 'Land Building 1st Year',
                  value: formData.landBuilding1stYear),
              InfoCard(
                  title: 'Land Building 2nd Year',
                  value: formData.landBuilding2ndYear),
              InfoCard(
                  title: 'Land Building 3rd Year',
                  value: formData.landBuilding3rdYear),
              InfoCard(
                  title: 'Land Building Amt Rec',
                  value: formData.landBuildingAmtRec),
              InfoCard(title: '2.Equipment', value: ''),

              InfoCard(
                  title: 'Equipment Total', value: formData.equipmentTotal),
              InfoCard(
                  title: 'Equipment 1st Year',
                  value: formData.equipment1stYear),
              InfoCard(
                  title: 'Equipment 2nd Year',
                  value: formData.equipment2ndYear),
              InfoCard(
                  title: 'Equipment 3rd Year',
                  value: formData.equipment3rdYear),
              InfoCard(
                  title: 'Equipment Amt Rec', value: formData.equipmentAmtRec),
              InfoCard(title: '3.Total Capital', value: ''),

              InfoCard(
                  title: 'Total Capital Total',
                  value: formData.totalCapitalTotal),
              InfoCard(
                  title: 'Total Capital 1st Year',
                  value: formData.totalCapital1stYear),
              InfoCard(
                  title: 'Total Capital 2nd Year',
                  value: formData.totalCapital2ndYear),
              InfoCard(
                  title: 'Total Capital 3rd Year',
                  value: formData.totalCapital3rdYear),
              InfoCard(
                  title: 'Total Capital Amt Rec',
                  value: formData.totalCapitalAmtRec),
              InfoCard(title: 'B.Revenue Expenditure', value: ''),
              InfoCard(title: '4.Personnel', value: ''),

              InfoCard(
                  title: 'Personnel Total', value: formData.personnelTotal),
              InfoCard(
                  title: 'Personnel 1st Year',
                  value: formData.personnel1stYear),
              InfoCard(
                  title: 'Personnel 2nd Year',
                  value: formData.personnel2ndYear),
              InfoCard(
                  title: 'Personnel 3rd Year',
                  value: formData.personnel3rdYear),
              InfoCard(
                  title: 'Personnel Amt Rec', value: formData.personnelAmtRec),
              InfoCard(title: '5.Consumables', value: ''),

              InfoCard(
                  title: 'Consumables Total', value: formData.consumablesTotal),
              InfoCard(
                  title: 'Consumables 1st Year',
                  value: formData.consumables1stYear),
              InfoCard(
                  title: 'Consumables 2nd Year',
                  value: formData.consumables2ndYear),
              InfoCard(
                  title: 'Consumables 3rd Year',
                  value: formData.consumables3rdYear),
              InfoCard(
                  title: 'Consumables Amt Rec',
                  value: formData.consumablesAmtRec),
              InfoCard(title: '6.Travels', value: ''),

              InfoCard(title: 'Travels Total', value: formData.travelsTotal),
              InfoCard(
                  title: 'Travels 1st Year', value: formData.travels1stYear),
              InfoCard(
                  title: 'Travels 2nd Year', value: formData.travels2ndYear),
              InfoCard(
                  title: 'Travels 3rd Year', value: formData.travels3rdYear),
              InfoCard(title: 'Travels Amt Rec', value: formData.travelsAmtRec),
              InfoCard(title: '7.Contingency', value: ''),

              InfoCard(
                  title: 'Contingency Total', value: formData.contingencyTotal),
              InfoCard(
                  title: 'Contingency 1st Year',
                  value: formData.contingency1stYear),
              InfoCard(
                  title: 'Contingency 2nd Year',
                  value: formData.contingency2ndYear),
              InfoCard(
                  title: 'Contingency 3rd Year',
                  value: formData.contingency3rdYear),
              InfoCard(
                  title: 'Contingency Amt Rec',
                  value: formData.contingencyAmtRec),
              InfoCard(title: '7.Overheads', value: ''),

              InfoCard(
                  title: 'Overheads Total', value: formData.overheadsTotal),
              InfoCard(
                  title: 'Overheads 1st Year',
                  value: formData.overheads1stYear),
              InfoCard(
                  title: 'Overheads 2nd Year',
                  value: formData.overheads2ndYear),
              InfoCard(
                  title: 'Overheads 3rd Year',
                  value: formData.overheads3rdYear),
              InfoCard(
                  title: 'Overheads Amt Rec', value: formData.overheadsAmtRec),
              InfoCard(title: '8.Dev Maint', value: ''),

              InfoCard(title: 'Dev Maint Total', value: formData.devMaintTotal),
              InfoCard(
                  title: 'Dev Maint 1st Year', value: formData.devMaint1stYear),
              InfoCard(
                  title: 'Dev Maint 2nd Year', value: formData.devMaint2ndYear),
              InfoCard(
                  title: 'Dev Maint 3rd Year', value: formData.devMaint3rdYear),
              InfoCard(
                  title: 'Dev Maint Amt Rec', value: formData.devMaintAmtRec),
              InfoCard(title: '10.Testing', value: ''),
              InfoCard(title: 'Testing Total', value: formData.testingTotal),
              InfoCard(
                  title: 'Testing 1st Year', value: formData.testing1stYear),
              InfoCard(
                  title: 'Testing 2nd Year', value: formData.testing2ndYear),
              InfoCard(
                  title: 'Testing 3rd Year', value: formData.testing3rdYear),
              InfoCard(title: 'Testing Amt Rec', value: formData.testingAmtRec),
              InfoCard(
                  title: 'Total Revenue Total',
                  value: formData.totalRevenueTotal),
              InfoCard(
                  title: 'Total Revenue 1st Year',
                  value: formData.totalRevenue1stYear),
              InfoCard(
                  title: 'Total Revenue 2nd Year',
                  value: formData.totalRevenue2ndYear),
              InfoCard(
                  title: 'Total Revenue 3rd Year',
                  value: formData.totalRevenue3rdYear),
              InfoCard(
                  title: 'Total Revenue Amt Rec',
                  value: formData.totalRevenueAmtRec),
              // InfoCard(title: 'Form ID', value: formData.formId),
              InfoCard(
                  title: 'G.Total (A+B)  Total',
                  value: formData.gTotalTotal),
              InfoCard(
                  title: 'G.Total (A+B)   1st Year',
                  value: formData.gTotal1stYear),
              InfoCard(
                  title: 'G.Total (A+B)   2nd Year',
                  value: formData.gTotal2ndYear),
              InfoCard(
                  title: 'G.Total (A+B)   3rd Year',
                  value: formData.gTotal3rdYear),
              InfoCard(
                  title: 'G.Total (A+B)   Amt Rec',
                  value: formData.gTotalAmtRec),
              InfoCard(title: 'Remarks', value: formData.remarks),
              // IconButton(
              //   icon: Icon(Icons.edit),
              //   onPressed: (){
              //     print("Edit button pressed");
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>GAPEditFormPage(initialData: formData.toJson())));
              //   },
              // ),
            ],
          );
        },
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
