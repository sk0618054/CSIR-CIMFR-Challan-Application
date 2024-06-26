import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/models/cp_challan.dart';
import 'package:flutter_application_2/screens/cp_edit_form_screen.dart';
import 'package:flutter_application_2/screens/cp_viewAllForm_screen.dart';
import 'package:flutter_application_2/screens/sp_edit_form_screen.dart';
import 'package:flutter_application_2/screens/sp_viewAllForm_screen.dart';

import '../models/sp_challan.dart';
import '../utils/utils.dart';
// import 'your_model_file.dart'; // Import your model file here

class CPFormDataView extends StatefulWidget {
  final String formId;

  CPFormDataView( {required this.formId});

  @override
  State<CPFormDataView> createState() => _CPFormDataViewState();
}

class _CPFormDataViewState extends State<CPFormDataView> {
  CPFormData? formDataout;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challan Details'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CPEditFormPage(initialData: formDataout?.toJson(),)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: ()async{
              await FirebaseFirestore.instance
                  .collection('cpForm')
                  .doc(widget.formId).delete();
              showSnackBar("Challan deleted", context);
              // Navigator.pop(context);
              Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => CPAllFormViewPage()), ).then((value) => setState(() {}));
            },
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('cpForm')
            .doc(widget.formId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Challan not found'));
          }

          CPFormData formData = CPFormData.fromSnap(snapshot.data!);
          formDataout=formData;

          return ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              InfoCard(title: 'Challan Number', value: formData.uniquecode),
              InfoCard(title: 'Name', value: formData.name),
              InfoCard(title: 'Address', value: formData.address),
              InfoCard(title: 'Sponsor Letter Reference', value: formData.sponsorLetterReference),
              InfoCard(title: 'Project Title', value: formData.projectTitle),
              InfoCard(title: 'Project Leaders', value: formData.projectLeaders),
              InfoCard(title: 'Project Coordinator', value: formData.projectCoordinator),
              InfoCard(title: 'Payment Amount', value: formData.paymentAmount),
              InfoCard(title: 'Cheque/DD No/ECS', value: formData.chequeDdNoEcs),
              InfoCard(title: 'Head of Account', value: formData.headOfAccount),
              InfoCard(title: 'Duration', value: formData.duration),
              InfoCard(title: 'Sponsor Contribution', value: formData.sponsorContribution),
              InfoCard(title: 'Section', value: formData.section),
              InfoCard(title: 'Project Type', value: formData.projectType),
              InfoCard(title: 'HOS', value: formData.hos),
              InfoCard(title: 'HORG', value: formData.horg),
              InfoCard(title: 'Dated', value: formData.dated),
              InfoCard(title: 'Code', value: formData.code),
              InfoCard(title: 'Date of Start', value: formData.dateOfStart),
              InfoCard(title: 'Completion Date', value: formData.completionDate),
              InfoCard(title: 'Equipment Capital', value: formData.equipmentCapital),
              InfoCard(title: 'Consumables/Raw Materials/Component', value: formData.consumablesRawMaterialsComponent),
              InfoCard(title: 'Services/Utilities', value: formData.servicesUtilities),
              InfoCard(title: 'External Payment', value: formData.externalPayment),
              InfoCard(title: 'TA/DA Contingencies', value: formData.taDaContingencies),
              InfoCard(title: 'Institute Infrastructure Fund', value: formData.instituteInfrastructureFund),
              InfoCard(title: 'Project Follow', value: formData.projectFollow),
              InfoCard(title: 'Cost of Mandays', value: formData.costOfMandays),
              InfoCard(title: 'Equipment/Computer Usage', value: formData.equipmentComputerUsage),
              InfoCard(title: 'Overhead', value: formData.overhead),
              InfoCard(title: 'Handling Charges', value: formData.handlingCharges),
              InfoCard(title: 'Total Expenses', value: formData.totalExpenses),
              InfoCard(title: 'Laboratory Share', value: formData.laboratoryShare),
              InfoCard(title: 'Project Fee', value: formData.projectFee),
              InfoCard(title: 'Total Project Charge', value: formData.totalProjectCharge),
              InfoCard(title: 'IGST', value: formData.igst),
              InfoCard(title: 'CGST', value: formData.cgst),
              InfoCard(title: 'SGST', value: formData.sgst),
              InfoCard(title: 'Amount Deposited', value: formData.amountDeposited),
              InfoCard(title: 'Value of Service', value: formData.valueOfService),
              InfoCard(title: 'IT TDS', value: formData.itTds),
              InfoCard(title: 'Form ID', value: formData.formId),
              // IconButton(
              //   icon: Icon(Icons.edit),
              //   onPressed: (){
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) =>  SPEditFormPage(initialData: formData.toJson(),)),
              //     );
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
