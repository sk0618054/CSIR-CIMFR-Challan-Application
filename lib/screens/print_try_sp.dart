import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/screens/sp_edit_form_screen.dart';
import 'package:flutter_application_2/screens/sp_viewAllForm_screen.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import '../models/sp_challan.dart';
import '../utils/utils.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class SPFormDataViewPrint extends StatefulWidget {
  final String formId;

  SPFormDataViewPrint({required this.formId});

  @override
  State<SPFormDataViewPrint> createState() => _SPFormDataViewPrintState();
}

class _SPFormDataViewPrintState extends State<SPFormDataViewPrint> {
  SPFormData? formDataout;
  bool _isLoding = false;

  Future<Uint8List> generatePdf(SPFormData formData) async {
    final pdf = pw.Document();

    final logo = await _loadLogo();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          buildHeader(logo, formData),
          pw.Divider(),
          // pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
          buildProjectInfo(formData),
          // pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
          buildTable(formData),
          // pw.SizedBox(height: 1 * PdfPageFormat.cm),
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

  pw.Widget buildHeader(pw.MemoryImage logo, SPFormData formData) {
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

  pw.Widget buildProjectInfo(SPFormData formData) => pw.Column(
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
          pw.SizedBox(height: 6),
          // buildInfoRow(
          //     '1.By Whom Tendered:', '', 'Entry Date:', formData.entryDate),
          // buildInfoRow(' Name:', formData.name, 'Section:', formData.section),
          buildInfoRow(' Name:', formData.name, '', ''),
          buildInfoRow(' Address:', formData.address, '', ''),

          // buildInfoRow(
          //     ' Address:', formData.address, 'Project Type:', 'SPONSOR'),
          buildInfoRow(' Project Type:', formData.projectType, 'Section:', formData.section),
          pw.SizedBox(height: 18),
          buildInfoRow('2.Sponsor\'s Letter Reference:',
              formData.sponsorLetterReference, '', ''),
          pw.SizedBox(height: 6),
          buildInfoRow('3.Project Title:', formData.projectTitle, '', ''),
          pw.SizedBox(height: 18),
          buildInfoRow('4.Project Leader/s:', formData.projectLeaders, 'HOS:',
              formData.hos),
          buildInfoRow('5.Project Coordinator:', formData.projectCoordinator,
              'HORG:', formData.horg),
          buildInfoRow(
              '6.Payment Amount:', formData.paymentAmount.toString(), '', ''),
          buildInfoRow('7.Cheque/DD No./ECS:', formData.chequeDdNoEcs, 'Dated:',
              formData.dated.toString()),
          buildInfoRow(
            '8.Head of Account/Project:',
            formData.headOfAccount.toString(),
            'Code:',
            formData.code.toString(),
          ),
          buildInfoRow('9.Duration:', formData.duration.toString(), 'Date of Start:',
              formData.dateOfStart.toString()),
          buildInfoRow(
            '10.Sponsor Contribution:',
            formData.sponsorContribution.toString(),
            'Completion Date:',
            formData.completionDate.toString(),
          ),


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
              pw.Text(value1, style: pw.TextStyle(fontSize: 10)),
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



  pw.Widget buildTable(SPFormData formData) {
    final headers = ['Particulars', 'Amount (Rs.)'];

    // Define a function to create a row with specific style
    pw.Widget _buildRow(String text1, String text2) {
      return pw.Row(
        children: [
          pw.Expanded(
            flex: 14,
            child: pw.Text(
              text1,
              style: pw.TextStyle(fontSize: 10),
            ),
          ),
          // pw.Expanded(
          //   flex: 7,
          //   child: pw.Text(
          //     '..............................................................................',
          //     style: pw.TextStyle(fontSize: 10),
          //     textAlign: pw.TextAlign.right,
          //   ),
          // ),
          pw.Expanded(
            flex: 2,
            child: pw.Text(
              text2,
              style: pw.TextStyle(fontSize: 10),
              textAlign: pw.TextAlign.right,
            ),
          ),
        ],
      );
    }

    return pw.Column(
      children: [
        // Header Row
        pw.Divider(),
        _buildRow(headers[0], headers[1]),
        pw.Divider(),
        // Data Rows
        _buildRow('11. Deposit:', ''),
        _buildRow('  i. Equipment/Capital     ................................................................................................................', formData.equipmentCapital.toString()),
        _buildRow('  ii. Consumables/Raw Materials/Component     ...........................................................................', formData.consumablesRawMaterialsComponent.toString()),
        _buildRow('  iii. Services/Utilities    ..................................................................................................................', formData.servicesUtilities.toString()),
        _buildRow('  iv. External Payment    ................................................................................................................', formData.externalPayment.toString()),
        _buildRow('  v. TA/DA    ...................................................................................................................................', formData.taDaContingencies.toString()),
        _buildRow('  vi. Contingencies    ......................................................................................................................', formData.contingencies.toString()),
        _buildRow('  vii. Institute Infrastructure Fund    ................................................................................................', formData.instituteInfrastructureFund.toString()),
        _buildRow('  viii. Project Fellow    ....................................................................................................................', formData.projectFollow.toString()),
        _buildRow('Total (i to vii)    ...............................................................................................................................', formData.totalOneToEight.toString()),

        _buildRow('12. Miscellaneous', ''),
        _buildRow('  i. Cost of Mandays     ..................................................................................................................', formData.costOfMandays.toString()),
        _buildRow('  ii. Equipment/Computer Usage    ................................................................................................', formData.equipmentComputerUsage.toString()),
        _buildRow('  iii. Overhead     ............................................................................................................................', formData.overhead.toString()),
        _buildRow('  iv. Handling Charges     ...............................................................................................................', formData.handlingCharges.toString()),
        _buildRow('Total (i to iv)    ...............................................................................................................................', formData.totalOneToFour.toString()),

        _buildRow('13. Total Expenses     ...................................................................................................................', formData.totalExpenses.toString()),
        _buildRow('14. Laboratory Share     ................................................................................................................', formData.laboratoryShare.toString()),
        _buildRow('15. Project Fee     ..........................................................................................................................', formData.projectFee.toString()),
        _buildRow('16. Total Project Charge (13+14+15)     ........................................................................................', formData.totalProjectCharge.toString()),

        _buildRow('17. GST', ''),
        _buildRow('  i. IGST (${formData.igstPercentage.toString()}% of Sl. No. 16)     ...................................................................................................', formData.igst.toString()),
        _buildRow('  ii. CGST (${formData.cgstPercentage.toString()}%)     ........................................................................................................................', formData.cgst.toString()),
        _buildRow('  iii. SGST (${formData.sgstPercentage.toString()}%)     .......................................................................................................................', formData.sgst.toString()),
        _buildRow('Total (i to iii)     ..............................................................................................................................', formData.totalOneToThree.toString()),

        _buildRow('Total Cost of The Project (16+17)     .............................................................................................', formData.totalCostOfProject),
      ],
    );
  }

  pw.Widget buildRemarksAndSignature(SPFormData formData) => pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.SizedBox(height: 2 * PdfPageFormat.mm),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('Amount Deposited: ${formData.amountDeposited.toString()}', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(width: 10), // Add space between text elements
          pw.Text('Value of Service: ${formData.valueOfService}', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(width: 10),
          pw.Text('IGST: ${formData.igst}', style: pw.TextStyle(fontSize: 10)),


        ],
      ),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('CGST: ${formData.cgst.toString()}', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(width: 10),
          pw.Text('SGST: ${formData.sgst.toString()}', style: pw.TextStyle(fontSize: 10)),
          pw.SizedBox(width: 10),
          pw.Text('IT-TDS: ${formData.itTds.toString()}', style: pw.TextStyle(fontSize: 10)),
        ]
      ),
      pw.SizedBox(height: 2 * PdfPageFormat.mm),
      pw.Container(
        width: 500, // Adjust width as needed to fit the text
        child: pw.Text(
          'Remarks: ${formData.remarks.toString()}',
          style: pw.TextStyle(fontSize: 10),
          softWrap: true,
        ),
      ),
      pw.SizedBox(height: 10 * PdfPageFormat.mm),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Text(
                  'Signature & Designation of Officer Ordering money to be paid in',
                  style: pw.TextStyle(fontSize: 10)),


            ],
          ),
        ],
      ),
    ],
  );




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
                        SPEditFormPage(initialData: formDataout?.toJson())),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              setState(() {
                _isLoding = true;
              });
              await FirebaseFirestore.instance
                  .collection('spForm')
                  .doc(widget.formId)
                  .delete();
              showSnackBar("Challan deleted", context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AllFormViewPage()),
              ).then((value) => setState(() {}));
              setState(() {
                _isLoding = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () async {
              try {
                if (formDataout != null) {
                  var pdfData = await generatePdf(formDataout!);
                  await Printing.layoutPdf(
                    onLayout: (PdfPageFormat format) async => pdfData,
                  );
                }
              } catch (e) {
                showSnackBar("Error printing PDF: $e", context);
              }
            },
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('spForm')
            .doc(widget.formId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Challan not found'));
          }

          SPFormData formData = SPFormData.fromSnap(snapshot.data!);
          formDataout = formData;

          return ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              InfoCard(title: 'Challan Number', value: formData.uniquecode),
              InfoCard(title: 'Entry Date', value: formData.entryDate),
              InfoCard(title:'1.By Whom tendered',value: "",),
              InfoCard(title: 'Name', value: formData.name),
              InfoCard(title: 'Address', value: formData.address),
              InfoCard(
                  title: '2.Sponsor Letter Reference',
                  value: formData.sponsorLetterReference),
              InfoCard(title: '3.Project Title', value: formData.projectTitle),
              InfoCard(
                  title: '4.Project Leaders', value: formData.projectLeaders),
              InfoCard(
                  title: '5.Project Coordinator',
                  value: formData.projectCoordinator),
              InfoCard(
                  title: '6.Payment Amount',
                  value: formData.paymentAmount.toString()),
              InfoCard(
                  title: '7.Cheque/DD No/ECS', value: formData.chequeDdNoEcs),
              InfoCard(title: '8.Head of Account', value: formData.headOfAccount),
              InfoCard(title: '9.Duration', value: formData.duration),
              InfoCard(
                  title: '10.Sponsor Contribution',
                  value: formData.sponsorContribution.toString()),
              InfoCard(title: 'Section', value: formData.section),
              InfoCard(title: 'Project Type', value: formData.projectType),
              InfoCard(title: 'HOS', value: formData.hos),
              InfoCard(title: 'HORG', value: formData.horg),
              InfoCard(title: 'Installment No', value: formData.installmentNo),
              InfoCard(title: 'Dated', value: formData.dated),
              InfoCard(title: 'Code', value: formData.code),
              InfoCard(title: 'Date of Start', value: formData.dateOfStart),
              InfoCard(
                  title: 'Completion Date', value: formData.completionDate),
              InfoCard(title: '11.G.Deposit:', value: ""),
              InfoCard(
                  title: 'i.Equipment Capital',
                  value: formData.equipmentCapital.toString()),
              InfoCard(
                  title: 'ii.Consumables/Raw Materials/Component',
                  value: formData.consumablesRawMaterialsComponent.toString()),
              InfoCard(
                  title: 'iii.Services/Utilities',
                  value: formData.servicesUtilities.toString()),
              InfoCard(
                  title: 'iv.External Payment',
                  value: formData.externalPayment.toString()),
              InfoCard(
                  title: 'v.TA/DA',
                  value: formData.taDaContingencies.toString()),
              InfoCard(title: 'vi.Contingencies', value: formData.contingencies),
              InfoCard(
                  title: 'vii.Institute Infrastructure Fund',
                  value: formData.instituteInfrastructureFund.toString()),
              InfoCard(
                  title: 'viii.Project Follow',
                  value: formData.projectFollow.toString()),
              InfoCard(title: 'Total (i to viii)', value: formData.totalOneToEight),
              InfoCard(title: '12.Miscellaneous:', value: ""),
              InfoCard(
                  title: 'i.Cost of Mandays',
                  value: formData.costOfMandays.toString()),
              InfoCard(
                  title: 'ii.Equipment/Computer Usage',
                  value: formData.equipmentComputerUsage.toString()),
              InfoCard(title: 'iii.Overhead', value: formData.overhead.toString()),
              InfoCard(
                  title: 'iv.Handling Charges',
                  value: formData.handlingCharges.toString()),
              InfoCard(title: 'Total (i to iv)', value: formData.totalOneToFour),

              InfoCard(
                  title: '13.Total Expenses',
                  value: formData.totalExpenses.toString()),
              InfoCard(
                  title: '14.Laboratory Share',
                  value: formData.laboratoryShare.toString()),
              InfoCard(
                  title: '15.Project Fee', value: formData.projectFee.toString()),
              InfoCard(
                  title: 'Total Project Charge (13+14+15)',
                  value: formData.totalProjectCharge.toString()),
              InfoCard(title: '17.GST', value: ''),
              InfoCard(title: 'IGST Percentage', value: formData.igstPercentage),
              InfoCard(title: 'i.IGST', value: formData.igst.toString()),
              InfoCard(title: 'CGST Percentage', value: formData.cgstPercentage),
              InfoCard(title: 'ii.CGST', value: formData.cgst.toString()),
              InfoCard(title: 'SGST Percentage', value: formData.sgstPercentage),
              InfoCard(title: 'iii.SGST', value: formData.sgst.toString()),
              InfoCard(title: 'Total (i to iii)', value: formData.totalOneToThree),
              InfoCard(title: 'Total Cost Of Project (16 + 17)', value: formData.totalCostOfProject),


              InfoCard(
                  title: 'Amount Deposited',
                  value: formData.amountDeposited.toString()),
              InfoCard(
                  title: 'Value of Service',
                  value: formData.valueOfService.toString()),
              InfoCard(title: 'IT TDS', value: formData.itTds.toString()),
              // InfoCard(title: 'Form ID', value: formData.formId),

              InfoCard(title: 'Remarks', value: formData.remarks),
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
