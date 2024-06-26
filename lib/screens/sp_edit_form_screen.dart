import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/sp_challan.dart';

import '../resources/firestore_method.dart';
import '../utils/utils.dart';

class SPEditFormPage extends StatefulWidget {
  final Map<String, dynamic>? initialData;

  SPEditFormPage({required this.initialData});

  @override
  _SPEditFormPageState createState() => _SPEditFormPageState();
}

class _SPEditFormPageState extends State<SPEditFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoding=false;
  // Controllers for TextFormFields
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final sponsorReferenceController = TextEditingController();
  final projectTitleController = TextEditingController();
  final projectLeadersController = TextEditingController();
  final projectCoordinatorController = TextEditingController();
  final paymentAmountController = TextEditingController();
  final chequeNoController = TextEditingController();
  final headOfAccountController = TextEditingController();
  final durationController = TextEditingController();
  final sponsorContributionController = TextEditingController();
  final sectionController = TextEditingController();
  final projectTypeController = TextEditingController();
  final hosController = TextEditingController();
  final horgController = TextEditingController();
  final datedController = TextEditingController();
  final codeController = TextEditingController();
  final dateOfStartController = TextEditingController();
  final completionDateController = TextEditingController();
  final equipmentController = TextEditingController();
  final consumablesController = TextEditingController();
  final servicesController = TextEditingController();
  final externalPaymentController = TextEditingController();
  final taContingenciesController = TextEditingController();
  final infrastructureFundController = TextEditingController();
  final projectFollowController = TextEditingController();
  final costOfMandaysController = TextEditingController();
  final equipmentUsageController = TextEditingController();
  final overheadController = TextEditingController();
  final handlingChargesController = TextEditingController();
  final totalExpensesController = TextEditingController();
  final laboratoryShareController = TextEditingController();
  final projectFeeController = TextEditingController();
  final totalProjectChargeController = TextEditingController();
  final igstController = TextEditingController();
  final cgstController = TextEditingController();
  final sgstController = TextEditingController();
  final amountDepositedController = TextEditingController();
  final valueOfServiceController = TextEditingController();
  final itTdsController = TextEditingController();
  final uniquecodeController=TextEditingController();
  final entryDateController=TextEditingController();


  final contingenciesController = TextEditingController();
  final totalOneToEightController = TextEditingController();
  final totalOneToFourController = TextEditingController();
  final totalOneToThreeController = TextEditingController();
  final totalCostOfProjectController = TextEditingController();
  final remarksController = TextEditingController();
  final igstPercentageController = TextEditingController();
  final cgstPercentageController = TextEditingController();
  final sgstPercentageController = TextEditingController();
  final installmentNoController = TextEditingController();
  @override
  void initState() {
    super.initState();
    print(widget.initialData);
    if (widget.initialData != null) {
      nameController.text = widget.initialData!['name'] ?? '';
      addressController.text = widget.initialData!['address'] ?? '';
      sponsorReferenceController.text = widget.initialData!['sponsorLetterReference'] ?? '';
      projectTitleController.text = widget.initialData!['projectTitle'] ?? '';
      projectLeadersController.text = widget.initialData!['projectLeaders'] ?? '';
      projectCoordinatorController.text = widget.initialData!['projectCoordinator'] ?? '';
      paymentAmountController.text = widget.initialData!['paymentAmount'] ?? '';
      chequeNoController.text = widget.initialData!['chequeDdNoEcs'] ?? '';
      headOfAccountController.text = widget.initialData!['headOfAccount'] ?? '';
      durationController.text = widget.initialData!['duration'] ?? '';
      sponsorContributionController.text = widget.initialData!['sponsorContribution'] ?? '';
      sectionController.text = widget.initialData!['section'] ?? '';
      projectTypeController.text = widget.initialData!['projectType'] ?? '';
      hosController.text = widget.initialData!['hos'] ?? '';
      horgController.text = widget.initialData!['horg'] ?? '';
      datedController.text = widget.initialData!['dated'] ?? '';
      codeController.text = widget.initialData!['code'] ?? '';
      dateOfStartController.text = widget.initialData!['dateOfStart'] ?? '';
      completionDateController.text = widget.initialData!['completionDate'] ?? '';
      equipmentController.text = widget.initialData!['equipmentCapital'] ?? '';
      consumablesController.text = widget.initialData!['consumablesRawMaterialsComponent'] ?? '';
      servicesController.text = widget.initialData!['servicesUtilities'] ?? '';
      externalPaymentController.text = widget.initialData!['externalPayment'] ?? '';
      taContingenciesController.text = widget.initialData!['taDaContingencies'] ?? '';
      infrastructureFundController.text = widget.initialData!['instituteInfrastructureFund'] ?? '';
      projectFollowController.text = widget.initialData!['projectFollow'] ?? '';
      costOfMandaysController.text = widget.initialData!['costOfMandays'] ?? '';
      equipmentUsageController.text = widget.initialData!['equipmentComputerUsage'] ?? '';
      overheadController.text = widget.initialData!['overhead'] ?? '';
      handlingChargesController.text = widget.initialData!['handlingCharges'] ?? '';
      totalExpensesController.text = widget.initialData!['totalExpenses'] ?? '';
      laboratoryShareController.text = widget.initialData!['laboratoryShare'] ?? '';
      projectFeeController.text = widget.initialData!['projectFee'] ?? '';
      totalProjectChargeController.text = widget.initialData!['totalProjectCharge'] ?? '';
      igstController.text = widget.initialData!['igst'] ?? '';
      cgstController.text = widget.initialData!['cgst'] ?? '';
      sgstController.text = widget.initialData!['sgst'] ?? '';
      amountDepositedController.text = widget.initialData!['amountDeposited'] ?? '';
      valueOfServiceController.text = widget.initialData!['valueOfService'] ?? '';
      itTdsController.text = widget.initialData!['itTds'] ?? '';
      uniquecodeController.text = widget.initialData!['uniquecode'] ?? '';
      entryDateController.text = widget.initialData!['entryDate'] ?? '';

      contingenciesController.text = widget.initialData!['contingencies'] ?? '';
      totalOneToEightController.text = widget.initialData!['totalOneToEight'] ?? '';
      totalOneToFourController.text = widget.initialData!['totalOneToFour'] ?? '';
      totalOneToThreeController.text = widget.initialData!['totalOneToThree'] ?? '';
      totalCostOfProjectController.text = widget.initialData!['totalCostOfProject'] ?? '';
      remarksController.text = widget.initialData!['remarks'] ?? '';
      igstPercentageController.text = widget.initialData!['igstPercentage'] ?? '';
      cgstPercentageController.text = widget.initialData!['cgstPercentage'] ?? '';
      sgstPercentageController.text = widget.initialData!['sgstPercentage'] ?? '';
      installmentNoController.text = widget.initialData!['installmentNo'] ?? '';


    }
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed.
    nameController.dispose();
    addressController.dispose();
    sponsorReferenceController.dispose();
    projectTitleController.dispose();
    projectLeadersController.dispose();
    projectCoordinatorController.dispose();
    paymentAmountController.dispose();
    chequeNoController.dispose();
    headOfAccountController.dispose();
    durationController.dispose();
    sponsorContributionController.dispose();
    sectionController.dispose();
    projectTypeController.dispose();
    hosController.dispose();
    horgController.dispose();
    datedController.dispose();
    codeController.dispose();
    dateOfStartController.dispose();
    completionDateController.dispose();
    equipmentController.dispose();
    consumablesController.dispose();
    servicesController.dispose();
    externalPaymentController.dispose();
    taContingenciesController.dispose();
    infrastructureFundController.dispose();
    projectFollowController.dispose();
    costOfMandaysController.dispose();
    equipmentUsageController.dispose();
    overheadController.dispose();
    handlingChargesController.dispose();
    totalExpensesController.dispose();
    laboratoryShareController.dispose();
    projectFeeController.dispose();
    totalProjectChargeController.dispose();
    igstController.dispose();
    cgstController.dispose();
    sgstController.dispose();
    amountDepositedController.dispose();
    valueOfServiceController.dispose();
    itTdsController.dispose();
    uniquecodeController.dispose();
    entryDateController.dispose();


    contingenciesController.dispose();
    totalOneToEightController.dispose();
    totalOneToFourController.dispose();
    totalOneToThreeController.dispose();
    totalCostOfProjectController.dispose();
    remarksController.dispose();
    igstPercentageController.dispose();
    cgstPercentageController.dispose();
    sgstPercentageController.dispose();
    installmentNoController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    setState(() {
      _isLoding=true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        SPFormData formData = SPFormData(
          name: nameController.text,
          address: addressController.text,
          sponsorLetterReference: sponsorReferenceController.text,
          projectTitle: projectTitleController.text,
          projectLeaders: projectLeadersController.text,
          projectCoordinator: projectCoordinatorController.text,
          paymentAmount: paymentAmountController.text,
          chequeDdNoEcs: chequeNoController.text,
          headOfAccount: headOfAccountController.text,
          duration: durationController.text,
          sponsorContribution: sponsorContributionController.text,
          section: sectionController.text,
          projectType: projectTypeController.text,
          hos: hosController.text,
          horg: horgController.text,
          dated: datedController.text,
          code: codeController.text,
          dateOfStart: dateOfStartController.text,
          completionDate: completionDateController.text,
          equipmentCapital: equipmentController.text,
          consumablesRawMaterialsComponent: consumablesController.text,
          servicesUtilities: servicesController.text,
          externalPayment: externalPaymentController.text,
          taDaContingencies: taContingenciesController.text,
          instituteInfrastructureFund: infrastructureFundController.text,
          projectFollow: projectFollowController.text,
          costOfMandays: costOfMandaysController.text,
          equipmentComputerUsage: equipmentUsageController.text,
          overhead: overheadController.text,
          handlingCharges: handlingChargesController.text,
          totalExpenses: totalExpensesController.text,
          laboratoryShare: laboratoryShareController.text,
          projectFee: projectFeeController.text,
          totalProjectCharge: totalProjectChargeController.text,
          igst: igstController.text,
          cgst: cgstController.text,
          sgst: sgstController.text,
          amountDeposited: amountDepositedController.text,
          valueOfService: valueOfServiceController.text,
          itTds: itTdsController.text,
          formId: widget.initialData!['formId'],
          uniquecode: uniquecodeController.text,
          entryDate: entryDateController.text,


          contingencies: contingenciesController.text,
          totalOneToEight: totalOneToEightController.text,
          totalOneToFour: totalOneToFourController.text,
          totalOneToThree: totalOneToThreeController.text,
          totalCostOfProject: totalCostOfProjectController.text,
          remarks: remarksController.text,
          igstPercentage: igstPercentageController.text,
          cgstPercentage: cgstPercentageController.text,
          sgstPercentage: sgstPercentageController.text,
          installmentNo: installmentNoController.text,


        );


         await FirebaseFirestore.instance.collection("spForm").doc(widget.initialData!['formId']).update(formData.toJson());
        // if (res == "success") {
          showSnackBar('Updated successfully', context);
          Navigator.pop(context);
        // } else {
        //   showSnackBar(res, context);
        // }
      } catch (err) {
        showSnackBar(err.toString(), context);
      }
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
                Text('Challan no: ${uniquecodeController.text}'),
                Text('1.By whom tendered'),
                Text('Name: ${nameController.text}'),
                Text('Address: ${addressController.text}'),
                Text('Entry Date: ${entryDateController.text}'),
                Text(
                    '2.Sponsor\'s Letter Reference: ${sponsorReferenceController.text}'),
                Text('3.Project Title: ${projectTitleController.text}'),
                Text('4.Project Leader(s): ${projectLeadersController.text}'),
                Text(
                    '5.Project Coordinator: ${projectCoordinatorController.text}'),
                Text('6.Payment Amount: ${paymentAmountController.text}'),
                Text('7.Cheque/DD No: ${chequeNoController.text}'),
                Text('8.Head of Account: ${headOfAccountController.text}'),
                Text('9.Duration: ${durationController.text}'),
                Text(
                    '10.Sponsor\'s Contribution (Rs.): ${sponsorContributionController.text}'),
                Text('Section: ${sectionController.text}'),
                Text('Project Type: ${projectTypeController.text}'),
                Text('HOS: ${hosController.text}'),
                Text('HORG: ${horgController.text}'),
                Text('Dated: ${datedController.text}'),
                Text('Code: ${codeController.text}'),
                Text('Date of Start: ${dateOfStartController.text}'),
                Text('Completion Date: ${completionDateController.text}'),
                Text('11.G.Deposit'),
                Text('i.Equipment: ${equipmentController.text}'),
                Text('ii.Consumables: ${consumablesController.text}'),
                Text('iii.Services: ${servicesController.text}'),
                Text('iv.External Payment: ${externalPaymentController.text}'),
                Text('v.TA/DA: ${taContingenciesController.text}'),
                Text('vi.Contingencies: ${contingenciesController.text}'),

                Text(
                    'vii.Infrastructure Fund (15%): ${infrastructureFundController.text}'),
                Text('viii.Project Follow: ${projectFollowController.text}'),
                Text('Total (i to viii): ${totalOneToEightController.text}'),
                Text('12.Miscellaneous:'),
                Text('i.Cost of Mandays: ${costOfMandaysController.text}'),
                Text('ii.Equipment Usage: ${equipmentUsageController.text}'),
                Text('iii.Overhead: ${overheadController.text}'),
                Text('iv.Handling Charges: ${handlingChargesController.text}'),
                Text('Total (i to iv): ${totalOneToFourController.text}'),

                Text('13.Total Expenses: ${totalExpensesController.text}'),
                Text('14.Laboratory Share: ${laboratoryShareController.text}'),
                Text('15.Project Fee: ${projectFeeController.text}'),
                Text(
                    '16.Total Project Charges (13+14+15): ${totalProjectChargeController.text}'),
                Text('17.GST'),
                Text('IGST Percentage: ${igstPercentageController.text}'),
                Text('i.IGST: ${igstController.text}'),
                Text('CGST Percentage: ${cgstPercentageController.text}'),
                Text('ii.CGST: ${cgstController.text}'),
                Text('SGST Percentage: ${sgstPercentageController.text}'),
                Text('iii.SGST: ${sgstController.text}'),
                Text('Total (i to iii): ${totalOneToThreeController.text}'),
                Text('Total Cost Of Project (16+17): ${totalCostOfProjectController.text}'),
                Text('Amount Deposited: ${amountDepositedController.text}'),
                Text(
                    'Value of Service including applicable taxes: ${valueOfServiceController.text}'),
                Text('IT TDS (10%): ${itTdsController.text}'),


                Text('Remarks: ${remarksController.text}'),
                Text('Installment No: ${installmentNoController.text}'),
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
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                setState(() {
                  _isLoding=true;
                });
                Navigator.of(context).pop();
                _submitForm();
                setState(() {
                  _isLoding=false;
                });
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
        title: Text('Sponsored Project Form'),
      ),
      body:_isLoding?  Center(
        child: CircularProgressIndicator(),
      ):Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[

              TextFormField(
                controller: uniquecodeController,
                decoration: InputDecoration(labelText: 'Challan no'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Challan no';
                  }
                  return null;
                },
              ),
              Text("1.By Whom tendered:"),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Please enter an address';
                //   }
                //   return null;
                // },
              ),
              TextFormField(
                controller: entryDateController,
                decoration: InputDecoration(labelText: 'Entry Date'),
                readOnly: true,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Please enter an address';
                //   }
                //   return null;
                // },
              ),
              TextFormField(
                controller: sponsorReferenceController,
                decoration: InputDecoration(labelText: '2.Sponsor\'s Letter Reference'),
              ),
              TextFormField(
                controller: projectTitleController,
                decoration: InputDecoration(labelText: '3.Project Title'),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Please enter a project title';
                //   }
                //   return null;
                // },
              ),
              TextFormField(
                controller: projectLeadersController,
                decoration: InputDecoration(labelText: '4.Project Leader(s)'),
              ),
              TextFormField(
                controller: projectCoordinatorController,
                decoration: InputDecoration(labelText: '5.Project Coordinator'),
              ),
              TextFormField(
                controller: paymentAmountController,
                decoration: InputDecoration(labelText: '6.Payment Amount'),
              ),
              TextFormField(
                controller: chequeNoController,
                decoration: InputDecoration(labelText: '7.Cheque/DD No'),
              ),
              TextFormField(
                controller: headOfAccountController,
                decoration: InputDecoration(labelText: '8.Head of Account'),
              ),
              TextFormField(
                controller: durationController,
                decoration: InputDecoration(labelText: '9.Duration'),
              ),
              TextFormField(
                controller: sponsorContributionController,
                decoration: InputDecoration(labelText: '10.Sponsor\'s Contribution (Rs.)'),
              ),
              TextFormField(
                controller: sectionController,
                decoration: InputDecoration(labelText: 'Section'),
              ),
              TextFormField(
                controller: projectTypeController,
                decoration: InputDecoration(labelText: 'Project Type'),
              ),
              TextFormField(
                controller: hosController,
                decoration: InputDecoration(labelText: 'HOS'),
              ),
              TextFormField(
                controller: horgController,
                decoration: InputDecoration(labelText: 'HORG'),
              ),
              TextFormField(
                controller: installmentNoController,
                decoration: InputDecoration(labelText: 'Installment No'),
              ),
              TextFormField(
                controller: datedController,
                decoration: InputDecoration(labelText: 'Dated'),
                onTap: ()=>_selectDate(context,datedController),
              ),
              TextFormField(
                controller: codeController,
                decoration: InputDecoration(labelText: 'Code'),
              ),
              TextFormField(
                controller: dateOfStartController,
                decoration: InputDecoration(labelText: 'Date of Start'),
                onTap: ()=>_selectDate(context,dateOfStartController),
              ),
              TextFormField(
                controller: completionDateController,
                decoration: InputDecoration(labelText: 'Completion Date'),
                onTap: ()=>_selectDate(context,completionDateController),
              ),
              Text("11.G.Deposit:"),
              TextFormField(
                controller: equipmentController,
                decoration: InputDecoration(labelText: 'i.Equipment'),
              ),
              TextFormField(
                controller: consumablesController,
                decoration: InputDecoration(labelText: 'ii.Consumables'),
              ),
              TextFormField(
                controller: servicesController,
                decoration: InputDecoration(labelText: 'iii.Services'),
              ),
              TextFormField(
                controller: externalPaymentController,
                decoration: InputDecoration(labelText: 'iv.External Payment'),
              ),
              TextFormField(
                controller: taContingenciesController,
                decoration: InputDecoration(labelText: 'v.TA/DA'),
              ),
              TextFormField(
                controller: contingenciesController,
                decoration: InputDecoration(labelText: 'vi.Contingencies'),
              ),
              TextFormField(
                controller: infrastructureFundController,
                decoration: InputDecoration(labelText: 'vii.Infrastructure Fund (15%)'),
              ),
              TextFormField(
                controller: projectFollowController,
                decoration: InputDecoration(labelText: 'viii.Project Follow'),
              ),
              TextFormField(
                controller: totalOneToEightController,
                decoration: InputDecoration(labelText: 'Total (i to viii)'),
              ),
              Text("12.Miscellaneous:"),
              TextFormField(
                controller: costOfMandaysController,
                decoration: InputDecoration(labelText: 'i.Cost of Mandays'),
              ),
              TextFormField(
                controller: equipmentUsageController,
                decoration: InputDecoration(labelText: 'ii.Equipment Usage'),
              ),
              TextFormField(
                controller: overheadController,
                decoration: InputDecoration(labelText: 'iii.Overhead'),
              ),
              TextFormField(
                controller: handlingChargesController,
                decoration: InputDecoration(labelText: 'iv.Handling Charges'),
              ),
              TextFormField(
                controller: totalOneToFourController,
                decoration: InputDecoration(labelText: 'Total (i to iv)'),
              ),

              TextFormField(
                controller: totalExpensesController,
                decoration: InputDecoration(labelText: '13.Total Expenses'),
              ),
              TextFormField(
                controller: laboratoryShareController,
                decoration: InputDecoration(labelText: '14.Laboratory Share'),
              ),
              TextFormField(
                controller: projectFeeController,
                decoration: InputDecoration(labelText: '15.Project Fee'),
              ),
              TextFormField(
                controller: totalProjectChargeController,
                decoration: InputDecoration(labelText: '16.Total Project Charges (13+14+15)'),
              ),
              Text('17.GST'),
              TextFormField(
                controller: igstPercentageController,
                decoration: InputDecoration(labelText: 'IGST Percentage'),
              ),
              TextFormField(
                controller: igstController,
                decoration: InputDecoration(labelText: 'i.IGST'),
              ),
              TextFormField(
                controller: cgstPercentageController,
                decoration: InputDecoration(labelText: 'CGST Percentage'),
              ),
              TextFormField(
                controller: cgstController,
                decoration: InputDecoration(labelText: 'ii.CGST'),
              ),
              TextFormField(
                controller: sgstPercentageController,
                decoration: InputDecoration(labelText: 'SGST Percentage'),
              ),
              TextFormField(
                controller: sgstController,
                decoration: InputDecoration(labelText: 'iii.SGST'),
              ),
              TextFormField(
                controller: totalOneToThreeController,
                decoration: InputDecoration(labelText: 'Total (i to iii)'),
              ),
              TextFormField(
                controller: totalCostOfProjectController,
                decoration: InputDecoration(labelText: 'Total Cost Of Project(16+17)'),
              ),
              TextFormField(
                controller: amountDepositedController,
                decoration: InputDecoration(labelText: 'Amount Deposited'),
              ),
              TextFormField(
                controller: valueOfServiceController,
                decoration: InputDecoration(labelText: 'Value of Service including applicable taxes'),
              ),
              TextFormField(
                controller: itTdsController,
                decoration: InputDecoration(labelText: 'IT TDS (10%)'),
              ),







              TextFormField(
                controller: remarksController,
                decoration: InputDecoration(labelText: 'Remarks'),
              ),




              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _showPreviewDialog,
                child: Text('Preview Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
