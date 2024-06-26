// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/utils/utils.dart';

import '../models/gap_challan.dart';
import '../models/sp_challan.dart';
import 'gap_edit_form_screen.dart';
import 'gap_viewAllForm_screen.dart';
// import 'your_model_file.dart'; // Import your model file here

class GAPFormDataView extends StatefulWidget {
  final String formId;

  GAPFormDataView( {required this.formId});

  @override
  State<GAPFormDataView> createState() => _GAPFormDataViewState();
}

class _GAPFormDataViewState extends State<GAPFormDataView> {
  void deleteFun() async {
     try{

       // Navigator.pop(context as BuildContext);
       // Navigator.pushReplacement(context, (context)=>);
       // print("delete");
     }catch(err){

     }
     // showSnackBar("deleted", context);
  }
  GAPFormData? formDataout;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challan Details'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){
              print("Edit button pressed");
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GAPEditFormPage(initialData: formDataout?.toJson())));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: ()async{
              await FirebaseFirestore.instance
                  .collection('gapForm')
                  .doc(widget.formId).delete();
              showSnackBar("Challan deleted", context);
              // Navigator.pop(context);
              Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => GAPAllFormViewPage()), ).then((value) => setState(() {}));

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
          // setState(() {
            formDataout=formData;
          // });
          return ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              InfoCard(title: 'Challan Number', value: formData.uniquecode),
              InfoCard(title: 'Name', value: formData.name),
              InfoCard(title: 'Address', value: formData.address),
              InfoCard(title: 'Sponsor Letter Ref', value: formData.sponsorLetterRef),
              InfoCard(title: 'Project Title', value: formData.projectTitle),
              InfoCard(title: 'Project Leader', value: formData.projectLeader),
              InfoCard(title: 'Project Coordinator', value: formData.projectCoordinator),
              InfoCard(title: 'Payment Amount', value: formData.paymentAmount),
              InfoCard(title: 'Cheque', value: formData.cheque),
              InfoCard(title: 'Head of Account', value: formData.headOfAccount),
              InfoCard(title: 'Duration', value: formData.duration),
              InfoCard(title: 'Sponsor Contribution', value: formData.sponsorContribution),
              InfoCard(title: 'Section', value: formData.section),
              InfoCard(title: 'Project Type', value: formData.projectType),
              InfoCard(title: 'HOS', value: formData.hos),
              InfoCard(title: 'HORG', value: formData.horg),
              InfoCard(title: 'Dated', value: formData.dated),
              InfoCard(title: 'Code', value: formData.code),
              InfoCard(title: 'Start Date', value: formData.startDate),
              InfoCard(title: 'Completion Date', value: formData.completionDate),

// Financial Fields
              InfoCard(title: 'Land Building Total', value: formData.landBuildingTotal),
              InfoCard(title: 'Land Building 1st Year', value: formData.landBuilding1stYear),
              InfoCard(title: 'Land Building 2nd Year', value: formData.landBuilding2ndYear),
              InfoCard(title: 'Land Building 3rd Year', value: formData.landBuilding3rdYear),
              InfoCard(title: 'Land Building Amt Rec', value: formData.landBuildingAmtRec),
              InfoCard(title: 'Equipment Total', value: formData.equipmentTotal),
              InfoCard(title: 'Equipment 1st Year', value: formData.equipment1stYear),
              InfoCard(title: 'Equipment 2nd Year', value: formData.equipment2ndYear),
              InfoCard(title: 'Equipment 3rd Year', value: formData.equipment3rdYear),
              InfoCard(title: 'Equipment Amt Rec', value: formData.equipmentAmtRec),
              InfoCard(title: 'Total Capital Total', value: formData.totalCapitalTotal),
              InfoCard(title: 'Total Capital 1st Year', value: formData.totalCapital1stYear),
              InfoCard(title: 'Total Capital 2nd Year', value: formData.totalCapital2ndYear),
              InfoCard(title: 'Total Capital 3rd Year', value: formData.totalCapital3rdYear),
              InfoCard(title: 'Total Capital Amt Rec', value: formData.totalCapitalAmtRec),
              InfoCard(title: 'Personnel Total', value: formData.personnelTotal),
              InfoCard(title: 'Personnel 1st Year', value: formData.personnel1stYear),
              InfoCard(title: 'Personnel 2nd Year', value: formData.personnel2ndYear),
              InfoCard(title: 'Personnel 3rd Year', value: formData.personnel3rdYear),
              InfoCard(title: 'Personnel Amt Rec', value: formData.personnelAmtRec),
              InfoCard(title: 'Consumables Total', value: formData.consumablesTotal),
              InfoCard(title: 'Consumables 1st Year', value: formData.consumables1stYear),
              InfoCard(title: 'Consumables 2nd Year', value: formData.consumables2ndYear),
              InfoCard(title: 'Consumables 3rd Year', value: formData.consumables3rdYear),
              InfoCard(title: 'Consumables Amt Rec', value: formData.consumablesAmtRec),
              InfoCard(title: 'Travels Total', value: formData.travelsTotal),
              InfoCard(title: 'Travels 1st Year', value: formData.travels1stYear),
              InfoCard(title: 'Travels 2nd Year', value: formData.travels2ndYear),
              InfoCard(title: 'Travels 3rd Year', value: formData.travels3rdYear),
              InfoCard(title: 'Travels Amt Rec', value: formData.travelsAmtRec),
              InfoCard(title: 'Contingency Total', value: formData.contingencyTotal),
              InfoCard(title: 'Contingency 1st Year', value: formData.contingency1stYear),
              InfoCard(title: 'Contingency 2nd Year', value: formData.contingency2ndYear),
              InfoCard(title: 'Contingency 3rd Year', value: formData.contingency3rdYear),
              InfoCard(title: 'Contingency Amt Rec', value: formData.contingencyAmtRec),
              InfoCard(title: 'Overheads Total', value: formData.overheadsTotal),
              InfoCard(title: 'Overheads 1st Year', value: formData.overheads1stYear),
              InfoCard(title: 'Overheads 2nd Year', value: formData.overheads2ndYear),
              InfoCard(title: 'Overheads 3rd Year', value: formData.overheads3rdYear),
              InfoCard(title: 'Overheads Amt Rec', value: formData.overheadsAmtRec),
              InfoCard(title: 'Dev Maint Total', value: formData.devMaintTotal),
              InfoCard(title: 'Dev Maint 1st Year', value: formData.devMaint1stYear),
              InfoCard(title: 'Dev Maint 2nd Year', value: formData.devMaint2ndYear),
              InfoCard(title: 'Dev Maint 3rd Year', value: formData.devMaint3rdYear),
              InfoCard(title: 'Dev Maint Amt Rec', value: formData.devMaintAmtRec),
              InfoCard(title: 'Testing Total', value: formData.testingTotal),
              InfoCard(title: 'Testing 1st Year', value: formData.testing1stYear),
              InfoCard(title: 'Testing 2nd Year', value: formData.testing2ndYear),
              InfoCard(title: 'Testing 3rd Year', value: formData.testing3rdYear),
              InfoCard(title: 'Testing Amt Rec', value: formData.testingAmtRec),
              InfoCard(title: 'Total Revenue Total', value: formData.totalRevenueTotal),
              InfoCard(title: 'Total Revenue 1st Year', value: formData.totalRevenue1stYear),
              InfoCard(title: 'Total Revenue 2nd Year', value: formData.totalRevenue2ndYear),
              InfoCard(title: 'Total Revenue 3rd Year', value: formData.totalRevenue3rdYear),
              InfoCard(title: 'Total Revenue Amt Rec', value: formData.totalRevenueAmtRec),
              InfoCard(title: 'Form ID', value: formData.formId),
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
