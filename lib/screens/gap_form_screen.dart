import 'package:flutter/material.dart';
import 'package:flutter_application_2/resources/firestore_method.dart';
import 'package:flutter_application_2/screens/home_screen.dart';

import '../utils/utils.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoding=false;
  // Define controllers for each field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController sponsorLetterRefController =
      TextEditingController();
  final TextEditingController projectTitleController = TextEditingController();
  final TextEditingController projectLeaderController = TextEditingController();
  final TextEditingController projectCoordinatorController =
      TextEditingController();
  final TextEditingController paymentAmountController = TextEditingController();
  final TextEditingController chequeController = TextEditingController();
  final TextEditingController headOfAccountController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController sponsorContributionController =
      TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController projectTypeController = TextEditingController();
  final TextEditingController hosController = TextEditingController();
  final TextEditingController horgController = TextEditingController();
  final TextEditingController datedController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController completionDateController =
      TextEditingController();

  // Add controllers for financial fields
  final TextEditingController landBuildingTotalController =
      TextEditingController();
  final TextEditingController landBuilding1stYearController =
      TextEditingController();
  final TextEditingController landBuilding2ndYearController =
      TextEditingController();
  final TextEditingController landBuilding3rdYearController =
      TextEditingController();
  final TextEditingController landBuildingAmtRecController =
      TextEditingController();
  final TextEditingController equipmentTotalController =
      TextEditingController();
  final TextEditingController equipment1stYearController =
      TextEditingController();
  final TextEditingController equipment2ndYearController =
      TextEditingController();
  final TextEditingController equipment3rdYearController =
      TextEditingController();
  final TextEditingController equipmentAmtRecController =
      TextEditingController();
  final TextEditingController totalCapitalTotalController =
      TextEditingController();
  final TextEditingController totalCapital1stYearController =
      TextEditingController();
  final TextEditingController totalCapital2ndYearController =
      TextEditingController();
  final TextEditingController totalCapital3rdYearController =
      TextEditingController();
  final TextEditingController totalCapitalAmtRecController =
      TextEditingController();
  final TextEditingController personnelTotalController =
      TextEditingController();
  final TextEditingController personnel1stYearController =
      TextEditingController();
  final TextEditingController personnel2ndYearController =
      TextEditingController();
  final TextEditingController personnel3rdYearController =
      TextEditingController();
  final TextEditingController personnelAmtRecController =
      TextEditingController();
  final TextEditingController consumablesTotalController =
      TextEditingController();
  final TextEditingController consumables1stYearController =
      TextEditingController();
  final TextEditingController consumables2ndYearController =
      TextEditingController();
  final TextEditingController consumables3rdYearController =
      TextEditingController();
  final TextEditingController consumablesAmtRecController =
      TextEditingController();
  final TextEditingController travelsTotalController = TextEditingController();
  final TextEditingController travels1stYearController =
      TextEditingController();
  final TextEditingController travels2ndYearController =
      TextEditingController();
  final TextEditingController travels3rdYearController =
      TextEditingController();
  final TextEditingController travelsAmtRecController = TextEditingController();
  final TextEditingController contingencyTotalController =
      TextEditingController();
  final TextEditingController contingency1stYearController =
      TextEditingController();
  final TextEditingController contingency2ndYearController =
      TextEditingController();
  final TextEditingController contingency3rdYearController =
      TextEditingController();
  final TextEditingController contingencyAmtRecController =
      TextEditingController();
  final TextEditingController overheadsTotalController =
      TextEditingController();
  final TextEditingController overheads1stYearController =
      TextEditingController();
  final TextEditingController overheads2ndYearController =
      TextEditingController();
  final TextEditingController overheads3rdYearController =
      TextEditingController();
  final TextEditingController overheadsAmtRecController =
      TextEditingController();
  final TextEditingController devMaintTotalController = TextEditingController();
  final TextEditingController devMaint1stYearController =
      TextEditingController();
  final TextEditingController devMaint2ndYearController =
      TextEditingController();
  final TextEditingController devMaint3rdYearController =
      TextEditingController();
  final TextEditingController devMaintAmtRecController =
      TextEditingController();
  final TextEditingController testingTotalController = TextEditingController();
  final TextEditingController testing1stYearController =
      TextEditingController();
  final TextEditingController testing2ndYearController =
      TextEditingController();
  final TextEditingController testing3rdYearController =
      TextEditingController();
  final TextEditingController testingAmtRecController = TextEditingController();
  final TextEditingController totalRevenueTotalController =
      TextEditingController();
  final TextEditingController totalRevenue1stYearController =
      TextEditingController();
  final TextEditingController totalRevenue2ndYearController =
      TextEditingController();
  final TextEditingController totalRevenue3rdYearController =
      TextEditingController();
  final TextEditingController totalRevenueAmtRecController =
      TextEditingController();
  final TextEditingController gTotalTotalController =
  TextEditingController();
  final TextEditingController gTotal1stYearController =
  TextEditingController();
  final TextEditingController gTotal2ndYearController =
  TextEditingController();
  final TextEditingController gTotal3rdYearController =
  TextEditingController();
  final TextEditingController gTotalAmtRecController =
  TextEditingController();
  final TextEditingController remarksController =
  TextEditingController();

  final TextEditingController installmentNoController = TextEditingController();

  void _submitForm() async {
    setState(() {
      _isLoding=true;
    });
    try {
      String res = await FirestoreMethods().gapFormUpload(  nameController.text,
        addressController.text,
        sponsorLetterRefController.text,
        projectTitleController.text,
        projectLeaderController.text,
        projectCoordinatorController.text,
        paymentAmountController.text,
        chequeController.text,
        headOfAccountController.text,
        durationController.text,
        sponsorContributionController.text,
        sectionController.text,
        projectTypeController.text,
        hosController.text,
        horgController.text,
        datedController.text,
        codeController.text,
        startDateController.text,
        completionDateController.text,

        // Add controllers for financial fields
        landBuildingTotalController.text,
        landBuilding1stYearController.text,
        landBuilding2ndYearController.text,
        landBuilding3rdYearController.text,
        landBuildingAmtRecController.text,
        equipmentTotalController.text,
        equipment1stYearController.text,
        equipment2ndYearController.text,
        equipment3rdYearController.text,
        equipmentAmtRecController.text,
        totalCapitalTotalController.text,
        totalCapital1stYearController.text,
        totalCapital2ndYearController.text,
        totalCapital3rdYearController.text,
        totalCapitalAmtRecController.text,
        personnelTotalController.text,
        personnel1stYearController.text,
        personnel2ndYearController.text,
        personnel3rdYearController.text,
        personnelAmtRecController.text,
        consumablesTotalController.text,
        consumables1stYearController.text,
        consumables2ndYearController.text,
        consumables3rdYearController.text,
        consumablesAmtRecController.text,
        travelsTotalController.text,
        travels1stYearController.text,
        travels2ndYearController.text,
        travels3rdYearController.text,
        travelsAmtRecController.text,
        contingencyTotalController.text,
        contingency1stYearController.text,
        contingency2ndYearController.text,
        contingency3rdYearController.text,
        contingencyAmtRecController.text,
        overheadsTotalController.text,
        overheads1stYearController.text,
        overheads2ndYearController.text,
        overheads3rdYearController.text,
        overheadsAmtRecController.text,
        devMaintTotalController.text,
        devMaint1stYearController.text,
        devMaint2ndYearController.text,
        devMaint3rdYearController.text,
        devMaintAmtRecController.text,
        testingTotalController.text,
        testing1stYearController.text,
        testing2ndYearController.text,
        testing3rdYearController.text,
        testingAmtRecController.text,
        totalRevenueTotalController.text,
        totalRevenue1stYearController.text,
        totalRevenue2ndYearController.text,
        totalRevenue3rdYearController.text,
        totalRevenueAmtRecController.text,
        gTotalTotalController.text,
        gTotal1stYearController.text,
        gTotal2ndYearController.text,
        gTotal3rdYearController.text,
        gTotalAmtRecController.text,
        remarksController.text,
        installmentNoController.text,
      );
      if (res == "success") {
        showSnackBar('Added', context);
        Navigator.pop(context);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context)=>HomePage()),
        // );
      } else {
        showSnackBar(res, context);
      }
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
    setState(() {
      _isLoding=false;
    });
  }

  void _showPreviewDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Preview Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Name: ${nameController.text}'),
                Text('Address: ${addressController.text}'),
                Text(
                    'Sponsor\'s Letter Reference: ${sponsorLetterRefController.text}'),
                Text('Installment No: ${installmentNoController.text}'),
                Text('Project Title: ${projectTitleController.text}'),
                Text('Project Leader: ${projectLeaderController.text}'),
                Text(
                    'Project Coordinator: ${projectCoordinatorController.text}'),
                Text('Payment Amount: ${paymentAmountController.text}'),
                Text('Cheque/DD No.: ${chequeController.text}'),
                Text(
                    'Head of Account/Project: ${headOfAccountController.text}'),
                Text('Duration: ${durationController.text}'),
                Text(
                    'Sponsor Contribution: ${sponsorContributionController.text}'),
                Text('Section: ${sectionController.text}'),
                Text('Project Type: ${projectTypeController.text}'),
                Text('HOS: ${hosController.text}'),
                Text('HORG: ${horgController.text}'),
                Text('Dated: ${datedController.text}'),
                Text('Code: ${codeController.text}'),
                Text('Start Date: ${startDateController.text}'),
                Text('Completion Date: ${completionDateController.text}'),
                // Financial fields
                Text(
                    'Total Capital Total: ${totalCapitalTotalController.text}'),
                Text(
                    'Total Capital 1st Year: ${totalCapital1stYearController.text}'),
                Text(
                    'Total Capital 2nd Year: ${totalCapital2ndYearController.text}'),
                Text(
                    'Total Capital 3rd Year: ${totalCapital3rdYearController.text}'),
                Text(
                    'Total Capital Amount Received: ${totalCapitalAmtRecController.text}'),
                Text('Personnel Total: ${personnelTotalController.text}'),
                Text('Personnel 1st Year: ${personnel1stYearController.text}'),
                Text('Personnel 2nd Year: ${personnel2ndYearController.text}'),
                Text('Personnel 3rd Year: ${personnel3rdYearController.text}'),
                Text(
                    'Personnel Amount Received: ${personnelAmtRecController.text}'),
                Text('Consumables Total: ${consumablesTotalController.text}'),
                Text(
                    'Consumables 1st Year: ${consumables1stYearController.text}'),
                Text(
                    'Consumables 2nd Year: ${consumables2ndYearController.text}'),
                Text(
                    'Consumables 3rd Year: ${consumables3rdYearController.text}'),
                Text(
                    'Consumables Amount Received: ${consumablesAmtRecController.text}'),
                Text('Travels Total: ${travelsTotalController.text}'),
                Text('Travels 1st Year: ${travels1stYearController.text}'),
                Text('Travels 2nd Year: ${travels2ndYearController.text}'),
                Text('Travels 3rd Year: ${travels3rdYearController.text}'),
                Text(
                    'Travels Amount Received: ${travelsAmtRecController.text}'),
                Text('Contingency Total: ${contingencyTotalController.text}'),
                Text(
                    'Contingency 1st Year: ${contingency1stYearController.text}'),
                Text(
                    'Contingency 2nd Year: ${contingency2ndYearController.text}'),
                Text(
                    'Contingency 3rd Year: ${contingency3rdYearController.text}'),
                Text(
                    'Contingency Amount Received: ${contingencyAmtRecController.text}'),
                Text('Overheads Total: ${overheadsTotalController.text}'),
                Text('Overheads 1st Year: ${overheads1stYearController.text}'),
                Text('Overheads 2nd Year: ${overheads2ndYearController.text}'),
                Text('Overheads 3rd Year: ${overheads3rdYearController.text}'),
                Text(
                    'Overheads Amount Received: ${overheadsAmtRecController.text}'),
                Text('Dev & Maint Total: ${devMaintTotalController.text}'),
                Text('Dev & Maint 1st Year: ${devMaint1stYearController.text}'),
                Text('Dev & Maint 2nd Year: ${devMaint2ndYearController.text}'),
                Text('Dev & Maint 3rd Year: ${devMaint3rdYearController.text}'),
                Text(
                    'Dev & Maint Amount Received: ${devMaintAmtRecController.text}'),
                Text('Testing Total: ${testingTotalController.text}'),
                Text('Testing 1st Year: ${testing1stYearController.text}'),
                Text('Testing 2nd Year: ${testing2ndYearController.text}'),
                Text('Testing 3rd Year: ${testing3rdYearController.text}'),
                Text(
                    'Testing Amount Received: ${testingAmtRecController.text}'),
                Text(
                    'Total Revenue Total: ${totalRevenueTotalController.text}'),
                Text(
                    'Total Revenue 1st Year: ${totalRevenue1stYearController.text}'),
                Text(
                    'Total Revenue 2nd Year: ${totalRevenue2ndYearController.text}'),
                Text(
                    'Total Revenue 3rd Year: ${totalRevenue3rdYearController.text}'),
                Text(
                    'Total Revenue Amount Received: ${totalRevenueAmtRecController.text}'),

                Text(
                    ' G.Total(A+B) Total: ${gTotalTotalController.text}'),
                Text(
                    ' G.Total(A+B) 1st Year: ${gTotal1stYearController.text}'),
                Text(
                    ' G.Total(A+B) 2nd Year: ${gTotal2ndYearController.text}'),
                Text(
                    ' G.Total(A+B) 3rd Year: ${gTotal3rdYearController.text}'),
                Text(
                    ' G.Total(A+B) Amount Received: ${gTotalAmtRecController.text}'),
                Text(
                    'Remarks: ${remarksController.text}'),

                // Add more financial fields here...
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  DateTime? _selectedDate;
  Future<void> _selectDate(BuildContext context,field) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        field.text=_selectedDate!.toLocal().toString().split(' ')[0];
        // date=_selectedDate!.toLocal().toString().split(' ')[0];
        // DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse('${date}'+" 00:00:00");
        // print(tempDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challan Form'),
      ),
      body:_isLoding?  Center(
        child: CircularProgressIndicator(),
      ):  SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('1.By Whom tendered'),
              TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name')),
              TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address')),
              TextFormField(
                  controller: sponsorLetterRefController,
                  decoration: InputDecoration(
                      labelText: '2.Sponsor\'s Letter Reference')),
              TextFormField(
                controller: installmentNoController,
                decoration: InputDecoration(labelText: 'Installment No'),
              ),
              TextFormField(
                  controller: projectTitleController,
                  decoration: InputDecoration(labelText: '3.Project Title')),
              TextFormField(
                  controller: projectLeaderController,
                  decoration: InputDecoration(labelText: '4.Project Leader/s')),
              TextFormField(
                  controller: projectCoordinatorController,
                  decoration:
                      InputDecoration(labelText: '5.Project Coordinator')),
              TextFormField(
                  controller: paymentAmountController,
                  decoration: InputDecoration(labelText: '6.Payment Amount')),
              TextFormField(
                  controller: chequeController,
                  decoration: InputDecoration(labelText: '7.Cheque/DD No./ECS')),
              TextFormField(
                  controller: headOfAccountController,
                  decoration:
                      InputDecoration(labelText: '8.Head of Account/Project')),
              TextFormField(
                  controller: durationController,
                  decoration: InputDecoration(labelText: '9.Duration')),
              // TextFormField(
              //     controller: sponsorContributionController,
              //     decoration:
              //         InputDecoration(labelText: 'Sponsor Contribution')),
              TextFormField(
                  controller: sectionController,
                  decoration: InputDecoration(labelText: 'Section')),
              // TextFormField(
              //     controller: projectTypeController,
              //     decoration: InputDecoration(labelText: 'Project Type')),
              TextFormField(
                  controller: hosController,
                  decoration: InputDecoration(labelText: 'HOS')),
              TextFormField(
                  controller: horgController,
                  decoration: InputDecoration(labelText: 'HORG')),
              TextFormField(
                  controller: datedController,
                  // onTap: ()=>_selectDate(context,datedController),
                  decoration: InputDecoration(labelText: 'Dated')),
              TextFormField(
                  controller: codeController,
                  decoration: InputDecoration(labelText: 'Code')),
              TextFormField(
                  controller: startDateController,
                  onTap: ()=>_selectDate(context,startDateController),
                  decoration: InputDecoration(labelText: 'Date of Start')),

              TextFormField(
                  controller: completionDateController,
                  onTap: ()=>_selectDate(context,completionDateController),
                  decoration: InputDecoration(labelText: 'Completion Date')),
              Text('A.Capital Expenditure'),

              // Financial Fields
              buildFinancialFields(
                  '1.Land & Bldg/Field Inst',
                  landBuildingTotalController,
                  landBuilding1stYearController,
                  landBuilding2ndYearController,
                  landBuilding3rdYearController,
                  landBuildingAmtRecController),
              buildFinancialFields(
                  '2.Equipment',
                  equipmentTotalController,
                  equipment1stYearController,
                  equipment2ndYearController,
                  equipment3rdYearController,
                  equipmentAmtRecController),
              buildFinancialFields(
                  '3.Total Capital',
                  totalCapitalTotalController,
                  totalCapital1stYearController,
                  totalCapital2ndYearController,
                  totalCapital3rdYearController,
                  totalCapitalAmtRecController),
              Text('B.Revenue Expenditure'),
              buildFinancialFields(
                  '4.Personnel/Salaries',
                  personnelTotalController,
                  personnel1stYearController,
                  personnel2ndYearController,
                  personnel3rdYearController,
                  personnelAmtRecController),
              buildFinancialFields(
                  '5.Consumables/Supplies',
                  consumablesTotalController,
                  consumables1stYearController,
                  consumables2ndYearController,
                  consumables3rdYearController,
                  consumablesAmtRecController),
              buildFinancialFields(
                  '6.Travels',
                  travelsTotalController,
                  travels1stYearController,
                  travels2ndYearController,
                  travels3rdYearController,
                  travelsAmtRecController),
              buildFinancialFields(
                  '7.Contingency',
                  contingencyTotalController,
                  contingency1stYearController,
                  contingency2ndYearController,
                  contingency3rdYearController,
                  contingencyAmtRecController),
              buildFinancialFields(
                  '8.Overheads',
                  overheadsTotalController,
                  overheads1stYearController,
                  overheads2ndYearController,
                  overheads3rdYearController,
                  overheadsAmtRecController),
              buildFinancialFields(
                  '9.Dev.Maint.Awarness',
                  devMaintTotalController,
                  devMaint1stYearController,
                  devMaint2ndYearController,
                  devMaint3rdYearController,
                  devMaintAmtRecController),
              buildFinancialFields(
                  '10.Testing',
                  testingTotalController,
                  testing1stYearController,
                  testing2ndYearController,
                  testing3rdYearController,
                  testingAmtRecController),
              buildFinancialFields(
                  'Total Revenue',
                  totalRevenueTotalController,
                  totalRevenue1stYearController,
                  totalRevenue2ndYearController,
                  totalRevenue3rdYearController,
                  totalRevenueAmtRecController),
              buildFinancialFields(
                  'G.Total(A+B)',
                  gTotalTotalController,
                  gTotal1stYearController,
                  gTotal2ndYearController,
                  gTotal3rdYearController,
                  gTotalAmtRecController),

              TextFormField(
                  controller: remarksController,
                  decoration: InputDecoration(labelText: 'Remarks')),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    // onPressed: (){},
                    child: Text('Submit'),
                  ),
                  ElevatedButton(
                    onPressed: _showPreviewDialog,
                    child: Text('Preview'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFinancialFields(
      String label,
      TextEditingController totalController,
      TextEditingController firstYearController,
      TextEditingController secondYearController,
      TextEditingController thirdYearController,
      TextEditingController amtRecController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        TextFormField(
            controller: totalController,
            decoration:
                InputDecoration(labelText: 'Total Cost of the Project')),
        TextFormField(
            controller: firstYearController,
            decoration: InputDecoration(labelText: '1st Year')),
        TextFormField(
            controller: secondYearController,
            decoration: InputDecoration(labelText: '2nd Year')),
        TextFormField(
            controller: thirdYearController,
            decoration: InputDecoration(labelText: '3rd Year')),
        TextFormField(
            controller: amtRecController,
            decoration: InputDecoration(labelText: 'Amt Rec')),
      ],
    );
  }
}
