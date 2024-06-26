import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/picker.dart';
import 'package:intl/intl.dart';

import '../resources/firestore_method.dart';
import '../utils/utils.dart';

class SPFormPage extends StatefulWidget {
  @override
  _SPFormPageState createState() => _SPFormPageState();
}

class _SPFormPageState extends State<SPFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoding = false;

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
    // TODO: implement initState
    super.initState();
    projectTypeController.text="SPONSOR";
    // totalExpensesController.text="0";
    // laboratoryShareController.text="0";
    // projectFeeController.text="0";
    // totalProjectChargeController.text="0";
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
      _isLoding = true;
    });
    try {
      String res = await FirestoreMethods().spFormUpload(
        nameController.text,
        addressController.text,
        sponsorReferenceController.text,
        projectTitleController.text,
        projectLeadersController.text,
        projectCoordinatorController.text,
        paymentAmountController.text,
        chequeNoController.text,
        headOfAccountController.text,
        durationController.text,
        sponsorContributionController.text,
        sectionController.text,
        projectTypeController.text,
        hosController.text,
        horgController.text,
        datedController.text,
        codeController.text,
        dateOfStartController.text,
        completionDateController.text,
        equipmentController.text,
        consumablesController.text,
        servicesController.text,
        externalPaymentController.text,
        taContingenciesController.text,
        infrastructureFundController.text,
        projectFollowController.text,
        costOfMandaysController.text,
        equipmentUsageController.text,
        overheadController.text,
        handlingChargesController.text,
        totalExpensesController.text,
        laboratoryShareController.text,
        projectFeeController.text,
        totalProjectChargeController.text,
        igstController.text,
        cgstController.text,
        sgstController.text,
        amountDepositedController.text,
        valueOfServiceController.text,
        itTdsController.text,


        contingenciesController.text,
        totalOneToEightController.text,
        totalOneToFourController.text,
        totalOneToThreeController.text,
        totalCostOfProjectController.text,
        remarksController.text,
        igstPercentageController.text,
        cgstPercentageController.text,
        sgstPercentageController.text,
        installmentNoController.text,

      );
      if (res == "success") {
        showSnackBar('Added', context);
        Navigator.pop(context);
      } else {
        showSnackBar(res, context);
      }
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
    setState(() {
      _isLoding = false;
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
                Text("1.By Whom tendered :",
                  // style: TextStyle(fontSize: 18),
                ),
                Text('Name: ${nameController.text}'),
                Text('Address: ${addressController.text}'),
                Text(
                    '2.Sponsor\'s Letter Reference: ${sponsorReferenceController.text}'),
                Text('3.Project Title: ${projectTitleController.text}'),
                Text('4.Project Leader/s: ${projectLeadersController.text}'),
                Text(
                    '5.Project Coordinator: ${projectCoordinatorController.text}'),
                Text('6.Payment Amount: ${paymentAmountController.text}'),
                Text('7.Cheque/DD No./ECS: ${chequeNoController.text}'),
                Text(
                    '8.Head of Account/Project: ${headOfAccountController.text}'),
                Text('9.Duration: ${durationController.text}'),
                Text(
                    '10.Sponsor Contribution: ${sponsorContributionController.text}'),
                Text('Section: ${sectionController.text}'),
                Text('Project Type: ${projectTypeController.text}'),
                Text('HOS: ${hosController.text}'),
                Text('HORG: ${horgController.text}'),
                Text('Installment No: ${installmentNoController.text}'),
                Text('Dated: ${datedController.text}'),
                Text('Code: ${codeController.text}'),
                Text('Date of Start: ${dateOfStartController.text}'),
                Text('Completion Date: ${completionDateController.text}'),
                Text('11.G.Deposit:'),
                Text('i.Equipment/Capital: ${equipmentController.text}'),
                Text(
                    'ii.Consumables/Raw Materials/Component: ${consumablesController.text}'),
                Text('iii.Services/Utilities: ${servicesController.text}'),
                Text('iv.External Payment: ${externalPaymentController.text}'),
                Text('v.TA/DA: ${taContingenciesController.text}'),
                Text('vi.Contingencies: ${contingenciesController.text}'),
                Text(
                    'vii.Institute Infrastructure Fund: ${infrastructureFundController.text}'),
                Text('viii.Project Follow: ${projectFollowController.text}'),
                Text('Total (i to viii): ${totalOneToEightController.text}'),
                Text('12.Miscellaneous:'),
                Text('i.Cost of Mandays: ${costOfMandaysController.text}'),
                Text(
                    'ii.Equipment/Computer Usage: ${equipmentUsageController.text}'),
                Text('iii.Overhead: ${overheadController.text}'),
                Text('iv.Handling Charges: ${handlingChargesController.text}'),
                Text('Total (i to iv): ${totalOneToFourController.text}'),
                Text('13.Total Expenses: ${totalExpensesController.text}'),
                Text('14.Laboratory Share: ${laboratoryShareController.text}'),
                Text('15.Project Fee: ${projectFeeController.text}'),
                Text(
                    'Total Project Charge(13+14+15): ${totalProjectChargeController.text}'),
                Text('17.GST'),
                Text('IGST Percentage: ${igstPercentageController.text}'),
                Text('i.IGST: ${igstController.text}'),
                Text('CGST Percentage: ${cgstPercentageController.text}'),
                Text('ii.CGST: ${cgstController.text}'),
                Text('SGST Percentage: ${sgstPercentageController.text}'),
                Text('iii.SGST: ${sgstController.text}'),
                Text('Total (i to iii): ${totalOneToThreeController.text}'),
                Text('Total Cost Of Project(16+17): ${totalCostOfProjectController.text}'),
                Text('Amount Deposited: ${amountDepositedController.text}'),
                Text('Value of Service: ${valueOfServiceController.text}'),
                Text('IT_TDS: ${itTdsController.text}'),







                Text('Remarks: ${remarksController.text}'),

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

  String getValue(String cur){
    return cur.length==0?"0":cur;
  }

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context, field) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        field.text = _selectedDate!.toLocal().toString().split(' ')[0];
        // date=_selectedDate!.toLocal().toString().split(' ')[0];
        // DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse('${date}'+" 00:00:00");
        // print(tempDate);
      });
    }
  }

  // Future<Null> _selectDate(BuildContext context) async {
  //   DateFormat formatter = DateFormat('dd/MM/yyyy');//specifies day/month/year format
  //
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: new DateTime(),
  //       firstDate: DateTime(1901, 1),
  //       lastDate: DateTime(2100));
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //       _date.value = TextEditingValue(text: formatter.format(picked));//Use formatter to format selected date and assign to text field
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challan Form'),
      ),
      body: _isLoding
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Text("1.By Whom tendered :",style: TextStyle(fontSize: 18),),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(labelText: 'Address'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: sponsorReferenceController,
                      decoration: InputDecoration(
                          labelText: '2.Sponsor\'s Letter Reference'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the sponsor\'s letter reference';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: projectTitleController,
                      decoration: InputDecoration(labelText: '3.Project Title'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the project title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: projectLeadersController,
                      decoration:
                          InputDecoration(labelText: '4.Project Leader/s'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the project leaders';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: projectCoordinatorController,
                      decoration:
                          InputDecoration(labelText: '5.Project Coordinator'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the project coordinator';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: paymentAmountController,
                      decoration: InputDecoration(labelText: '6.Payment Amount'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the payment amount';
                        }
                        return null;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextFormField(
                      controller: chequeNoController,
                      decoration:
                          InputDecoration(labelText: '7.Cheque/DD No./ECS'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the cheque/DD No./ECS';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: headOfAccountController,
                      decoration:
                          InputDecoration(labelText: '8.Head of Account/Project'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the head of account/project';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                        controller: durationController,
                        decoration: InputDecoration(labelText: '9.Duration'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the duration';
                          }
                          return null;
                        },
                      // Picker
                      //   onTap: () {
                      //     Picker(
                      //       adapter:
                      //           NumberPickerAdapter(data: <NumberPickerColumn>[
                      //         const NumberPickerColumn(
                      //             begin: 0, end: 999, suffix: Text(' hours')),
                      //         const NumberPickerColumn(
                      //             begin: 0,
                      //             end: 60,
                      //             suffix: Text(' minutes'),
                      //             jump: 15),
                      //       ]),
                      //       delimiter: <PickerDelimiter>[
                      //         PickerDelimiter(
                      //           child: Container(
                      //             width: 30.0,
                      //             alignment: Alignment.center,
                      //             child: Icon(Icons.more_vert),
                      //           ),
                      //         )
                      //       ],
                      //       hideHeader: true,
                      //       confirmText: 'OK',
                      //       confirmTextStyle: TextStyle(
                      //           inherit: false,
                      //           color: Colors.red,
                      //           fontSize: 22),
                      //       title: const Text('Select duration'),
                      //       selectedTextStyle: TextStyle(color: Colors.blue),
                      //       onConfirm: (Picker picker, List<int> value) {
                      //         // You get your duration here
                      //         print(value);
                      //         print(picker);
                      //
                      //         Duration _duration = Duration(
                      //             hours: picker.getSelectedValues()[0],
                      //             minutes: picker.getSelectedValues()[1]);
                      //       },
                      //
                      //     ).showDialog(context);
                      //   }
                        ),
                    TextFormField(
                      controller: sponsorContributionController,
                      decoration:
                          InputDecoration(labelText: '10.Sponsor Contribution'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the sponsor contribution';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: sectionController,
                      decoration: InputDecoration(labelText: 'Section'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the section';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: projectTypeController,
                      decoration: InputDecoration(labelText: 'Project Type'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the project type';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: hosController,
                      decoration: InputDecoration(labelText: 'HOS'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the HOS';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: horgController,
                      decoration: InputDecoration(labelText: 'HORG'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the HORG';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: installmentNoController,
                      decoration: InputDecoration(labelText: 'Installment No'),
                    ),
                    TextFormField(
                      controller: datedController,
                      decoration: InputDecoration(labelText: 'Dated'),
                      keyboardType: TextInputType.datetime,
                      // onTap: () => _selectDate(context, datedController),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the date';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: codeController,
                      decoration: InputDecoration(labelText: 'Code'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the code';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: dateOfStartController,
                      decoration: InputDecoration(labelText: 'Date of Start'),
                      onTap: () => _selectDate(context, dateOfStartController),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the date of start';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: completionDateController,
                      decoration: InputDecoration(labelText: 'Completion Date'),
                      onTap: () =>
                          _selectDate(context, completionDateController),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the completion date';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15,),
                    Text("11.Deposit",style: TextStyle(fontSize: 18),),
                    TextFormField(
                      controller: equipmentController,
                      // onChanged: (value)=>{
                      //
                      //   totalOneToEightController.text=(int.parse(getValue(equipmentController.text))+int.parse(getValue(consumablesController.text))+int.parse(getValue(servicesController.text))+int.parse(getValue(externalPaymentController.text))+int.parse(getValue(taContingenciesController.text))+int.parse(getValue(contingenciesController.text))+int.parse(getValue(infrastructureFundController.text))+int.parse(getValue(projectFollowController.text))).toString(),
                      //
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      decoration:
                          InputDecoration(labelText: 'i.Equipment/Capital'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the equipment/capital';
                        }
                        return null;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextFormField(
                      controller: consumablesController,
                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalOneToEightController.text=(int.parse(getValue(equipmentController.text))+int.parse(getValue(consumablesController.text))+int.parse(getValue(servicesController.text))+int.parse(getValue(externalPaymentController.text))+int.parse(getValue(taContingenciesController.text))+int.parse(getValue(contingenciesController.text))+int.parse(getValue(infrastructureFundController.text))+int.parse(getValue(projectFollowController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      decoration: InputDecoration(
                          labelText: 'ii.Consumables/Raw Materials/Component'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the consumables/raw materials/component';
                        }
                        return null;
                      },

                    ),
                    TextFormField(
                      controller: servicesController,
                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalOneToEightController.text=(int.parse(getValue(equipmentController.text))+int.parse(getValue(consumablesController.text))+int.parse(getValue(servicesController.text))+int.parse(getValue(externalPaymentController.text))+int.parse(getValue(taContingenciesController.text))+int.parse(getValue(contingenciesController.text))+int.parse(getValue(infrastructureFundController.text))+int.parse(getValue(projectFollowController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      decoration:
                          InputDecoration(labelText: 'iii.Services/Utilities'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the services/utilities';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: externalPaymentController,
                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalOneToEightController.text=(int.parse(getValue(equipmentController.text))+int.parse(getValue(consumablesController.text))+int.parse(getValue(servicesController.text))+int.parse(getValue(externalPaymentController.text))+int.parse(getValue(taContingenciesController.text))+int.parse(getValue(contingenciesController.text))+int.parse(getValue(infrastructureFundController.text))+int.parse(getValue(projectFollowController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      decoration:
                          InputDecoration(labelText: 'iv.External Payment'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the external payment';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: taContingenciesController,
                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalOneToEightController.text=(int.parse(getValue(equipmentController.text))+int.parse(getValue(consumablesController.text))+int.parse(getValue(servicesController.text))+int.parse(getValue(externalPaymentController.text))+int.parse(getValue(taContingenciesController.text))+int.parse(getValue(contingenciesController.text))+int.parse(getValue(infrastructureFundController.text))+int.parse(getValue(projectFollowController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      decoration:
                          InputDecoration(labelText: 'v.TA/DA'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the TA/DA contingencies';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: contingenciesController,
                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalOneToEightController.text=(int.parse(getValue(equipmentController.text))+int.parse(getValue(consumablesController.text))+int.parse(getValue(servicesController.text))+int.parse(getValue(externalPaymentController.text))+int.parse(getValue(taContingenciesController.text))+int.parse(getValue(contingenciesController.text))+int.parse(getValue(infrastructureFundController.text))+int.parse(getValue(projectFollowController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      decoration:
                      InputDecoration(labelText: 'vi.Contingencies'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the contingencies';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: infrastructureFundController,
                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalOneToEightController.text=(int.parse(getValue(equipmentController.text))+int.parse(getValue(consumablesController.text))+int.parse(getValue(servicesController.text))+int.parse(getValue(externalPaymentController.text))+int.parse(getValue(taContingenciesController.text))+int.parse(getValue(contingenciesController.text))+int.parse(getValue(infrastructureFundController.text))+int.parse(getValue(projectFollowController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      decoration: InputDecoration(
                          labelText: 'vii.Institute Infrastructure Fund'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the institute infrastructure fund';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: projectFollowController,
                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalOneToEightController.text=(int.parse(getValue(equipmentController.text))+int.parse(getValue(consumablesController.text))+int.parse(getValue(servicesController.text))+int.parse(getValue(externalPaymentController.text))+int.parse(getValue(taContingenciesController.text))+int.parse(getValue(contingenciesController.text))+int.parse(getValue(infrastructureFundController.text))+int.parse(getValue(projectFollowController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      decoration: InputDecoration(labelText: 'viii.Project Follow'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the project follow';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: totalOneToEightController,
                      // readOnly: true,
                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },

                      decoration: InputDecoration(labelText: 'Total (i to viii)'),
                    ),
                    SizedBox(height: 15,),
                    Text("12.Miscellaneous",style: TextStyle(fontSize: 18),),
                    TextFormField(
                      controller: costOfMandaysController,
                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalOneToFourController.text=(int.parse(getValue(costOfMandaysController.text))+int.parse(getValue(equipmentUsageController.text))+int.parse(getValue(overheadController.text))+int.parse(getValue(handlingChargesController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      decoration: InputDecoration(labelText: 'i.Cost of Mandays'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the cost of mandays';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: equipmentUsageController,
                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalOneToFourController.text=(int.parse(getValue(costOfMandaysController.text))+int.parse(getValue(equipmentUsageController.text))+int.parse(getValue(overheadController.text))+int.parse(getValue(handlingChargesController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      decoration: InputDecoration(
                          labelText: 'ii.Equipment/Computer Usage'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the equipment/computer usage';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: overheadController,
                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalOneToFourController.text=(int.parse(getValue(costOfMandaysController.text))+int.parse(getValue(equipmentUsageController.text))+int.parse(getValue(overheadController.text))+int.parse(getValue(handlingChargesController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      decoration: InputDecoration(labelText: 'iii.Overhead'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the overhead';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: handlingChargesController,
                      decoration:
                          InputDecoration(labelText: 'iv.Handling Charges'),

                      // onChanged: (value)=>{
                      //   totalExpensesController.text=(int.parse(getValue(totalOneToEightController.text))+int.parse(getValue(totalOneToFourController.text))).toString(),
                      //
                      //   totalOneToFourController.text=(int.parse(getValue(costOfMandaysController.text))+int.parse(getValue(equipmentUsageController.text))+int.parse(getValue(overheadController.text))+int.parse(getValue(handlingChargesController.text))).toString(),
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      //
                      // },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the handling charges';
                        }
                        return null;
                      },
                    ),

                    TextFormField(
                      controller: totalOneToFourController,
                      // readOnly: true,
                      decoration: InputDecoration(labelText: 'Total (i to iv)'),
                    ),
                    TextFormField(
                      controller: totalExpensesController,
                      // readOnly: true,
                      decoration: InputDecoration(labelText: '13.Total Expenses'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the total expenses';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: laboratoryShareController,
                      // onChanged: (value)=>{
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString()
                      // },
                      decoration:
                          InputDecoration(labelText: '14.Laboratory Share'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the laboratory share';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      // onTap: (){
                      //   print("clicked"+(int.parse(projectFeeController.text)+1).toString());
                      // },

                      // onChanged:(){
                      //   print("clicked"+(int.parse(projectFeeController.text)+1).toString());
                      // } ,
                      // onChanged: (value)=>{
                      //   totalProjectChargeController.text=(int.parse(getValue(projectFeeController.text))+int.parse(getValue(laboratoryShareController.text))+int.parse(getValue(totalExpensesController.text))).toString(),
                      // },
                      controller: projectFeeController,
                      decoration: InputDecoration(labelText: '15.Project Fee'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the project fee';
                        }
                        return null;
                      },
                      // onTap: (){
                      //   print((int.parse(projectFeeController.text)+int.parse(laboratoryShareController.text)+int.parse(totalExpensesController.text)).toString());
                      //   totalProjectChargeController.text=(int.parse(projectFeeController.text)+int.parse(laboratoryShareController.text)+int.parse(totalExpensesController.text)).toString();
                      // },
                    ),

                    TextFormField(
                      controller: totalProjectChargeController,
                      // readOnly: true,
                      decoration:
                          InputDecoration(labelText: '16.Total Project Charge (13+14+15)'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the total project charge';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    Text("17.GST",style: TextStyle(fontSize: 15),),
                    TextFormField(
                      controller: igstPercentageController,
                      decoration: InputDecoration(labelText: 'IGST Percentage'),
                    ),
                    TextFormField(
                      controller: igstController,
                      decoration: InputDecoration(labelText: 'i.IGST'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the IGST';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: cgstPercentageController,
                      decoration: InputDecoration(labelText: 'CGST Percentage'),
                    ),
                    TextFormField(
                      controller: cgstController,
                      decoration: InputDecoration(labelText: 'ii.CGST'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the CGST';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: sgstPercentageController,
                      decoration: InputDecoration(labelText: 'SGST Percentage'),
                    ),
                    TextFormField(
                      controller: sgstController,
                      decoration: InputDecoration(labelText: 'iii.SGST'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the SGST';
                        }
                        return null;
                      },
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
                      decoration:
                          InputDecoration(labelText: 'Amount Deposited'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the amount deposited';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: valueOfServiceController,
                      decoration:
                          InputDecoration(labelText: 'Value of Service'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the value of service';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: itTdsController,
                      decoration: InputDecoration(labelText: 'IT_TDS'),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter the IT_TDS';
                      //   }
                      //   return null;
                      // },
                    ),








                    TextFormField(
                      controller: remarksController,
                      decoration: InputDecoration(labelText: 'Remarks'),
                    ),





                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _submitForm,
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
}
