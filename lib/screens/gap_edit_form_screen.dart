import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/gap_challan.dart';
import 'package:flutter_application_2/models/sp_challan.dart';

import '../resources/firestore_method.dart';
import '../utils/utils.dart';

class GAPEditFormPage extends StatefulWidget {
  final Map<String, dynamic>? initialData;

  GAPEditFormPage({required this.initialData});

  @override
  _GAPEditFormPageState createState() => _GAPEditFormPageState();
}

class _GAPEditFormPageState extends State<GAPEditFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoding=false;
  // Controllers for TextFormFields
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final sponsorLetterRefController = TextEditingController();
  final projectTitleController = TextEditingController();
  final projectLeaderController = TextEditingController();
  final projectCoordinatorController = TextEditingController();
  final paymentAmountController = TextEditingController();
  final chequeController = TextEditingController();
  final headOfAccountController = TextEditingController();
  final durationController = TextEditingController();
  final sponsorContributionController = TextEditingController();
  final sectionController = TextEditingController();
  final projectTypeController = TextEditingController();
  final hosController = TextEditingController();
  final horgController = TextEditingController();
  final datedController = TextEditingController();
  final codeController = TextEditingController();
  final startDateController = TextEditingController();
  final completionDateController = TextEditingController();
  final landBuildingTotalController = TextEditingController();
  final landBuilding1stYearController = TextEditingController();
  final landBuilding2ndYearController = TextEditingController();
  final landBuilding3rdYearController = TextEditingController();
  final landBuildingAmtRecController = TextEditingController();
  final equipmentTotalController = TextEditingController();
  final equipment1stYearController = TextEditingController();
  final equipment2ndYearController = TextEditingController();
  final equipment3rdYearController = TextEditingController();
  final equipmentAmtRecController = TextEditingController();
  final totalCapitalTotalController = TextEditingController();
  final totalCapital1stYearController = TextEditingController();
  final totalCapital2ndYearController = TextEditingController();
  final totalCapital3rdYearController = TextEditingController();
  final totalCapitalAmtRecController = TextEditingController();
  final personnelTotalController = TextEditingController();
  final personnel1stYearController = TextEditingController();
  final personnel2ndYearController = TextEditingController();
  final personnel3rdYearController = TextEditingController();
  final personnelAmtRecController = TextEditingController();
  final consumablesTotalController = TextEditingController();
  final consumables1stYearController = TextEditingController();
  final consumables2ndYearController = TextEditingController();
  final consumables3rdYearController = TextEditingController();
  final consumablesAmtRecController = TextEditingController();
  final travelsTotalController = TextEditingController();
  final travels1stYearController = TextEditingController();
  final travels2ndYearController = TextEditingController();
  final travels3rdYearController = TextEditingController();
  final travelsAmtRecController = TextEditingController();
  final contingencyTotalController = TextEditingController();
  final contingency1stYearController = TextEditingController();
  final contingency2ndYearController = TextEditingController();
  final contingency3rdYearController = TextEditingController();
  final contingencyAmtRecController = TextEditingController();
  final overheadsTotalController = TextEditingController();
  final overheads1stYearController = TextEditingController();
  final overheads2ndYearController = TextEditingController();
  final overheads3rdYearController = TextEditingController();
  final overheadsAmtRecController = TextEditingController();
  final devMaintTotalController = TextEditingController();
  final devMaint1stYearController = TextEditingController();
  final devMaint2ndYearController = TextEditingController();
  final devMaint3rdYearController = TextEditingController();
  final devMaintAmtRecController = TextEditingController();
  final testingTotalController = TextEditingController();
  final testing1stYearController = TextEditingController();
  final testing2ndYearController = TextEditingController();
  final testing3rdYearController = TextEditingController();
  final testingAmtRecController = TextEditingController();
  final totalRevenueTotalController = TextEditingController();
  final totalRevenue1stYearController = TextEditingController();
  final totalRevenue2ndYearController = TextEditingController();
  final totalRevenue3rdYearController = TextEditingController();
  final totalRevenueAmtRecController = TextEditingController();
  final uniquecodeController=TextEditingController();
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

  final TextEditingController entryDateController=TextEditingController();
  final TextEditingController installmentNoController=TextEditingController();
  @override
  void initState() {
    super.initState();
    print(widget.initialData);
    if (widget.initialData != null) {
      nameController.text = widget.initialData!['name'] ?? '';
      addressController.text = widget.initialData!['address'] ?? '';
      sponsorLetterRefController.text = widget.initialData!['sponsorLetterRef'] ?? '';
      projectTitleController.text = widget.initialData!['projectTitle'] ?? '';
      projectLeaderController.text = widget.initialData!['projectLeader'] ?? '';
      projectCoordinatorController.text = widget.initialData!['projectCoordinator'] ?? '';
      paymentAmountController.text = widget.initialData!['paymentAmount'] ?? '';
      chequeController.text = widget.initialData!['cheque'] ?? '';
      headOfAccountController.text = widget.initialData!['headOfAccount'] ?? '';
      durationController.text = widget.initialData!['duration'] ?? '';
      sponsorContributionController.text = widget.initialData!['sponsorContribution'] ?? '';
      sectionController.text = widget.initialData!['section'] ?? '';
      projectTypeController.text = widget.initialData!['projectType'] ?? '';
      hosController.text = widget.initialData!['hos'] ?? '';
      horgController.text = widget.initialData!['horg'] ?? '';
      datedController.text = widget.initialData!['dated'] ?? '';
      codeController.text = widget.initialData!['code'] ?? '';
      startDateController.text = widget.initialData!['startDate'] ?? '';
      completionDateController.text = widget.initialData!['completionDate'] ?? '';
      landBuildingTotalController.text = widget.initialData!['landBuildingTotal'] ?? '';
      landBuilding1stYearController.text = widget.initialData!['landBuilding1stYear'] ?? '';
      landBuilding2ndYearController.text = widget.initialData!['landBuilding2ndYear'] ?? '';
      landBuilding3rdYearController.text = widget.initialData!['landBuilding3rdYear'] ?? '';
      landBuildingAmtRecController.text = widget.initialData!['landBuildingAmtRec'] ?? '';
      equipmentTotalController.text = widget.initialData!['equipmentTotal'] ?? '';
      equipment1stYearController.text = widget.initialData!['equipment1stYear'] ?? '';
      equipment2ndYearController.text = widget.initialData!['equipment2ndYear'] ?? '';
      equipment3rdYearController.text = widget.initialData!['equipment3rdYear'] ?? '';
      equipmentAmtRecController.text = widget.initialData!['equipmentAmtRec'] ?? '';
      totalCapitalTotalController.text = widget.initialData!['totalCapitalTotal'] ?? '';
      totalCapital1stYearController.text = widget.initialData!['totalCapital1stYear'] ?? '';
      totalCapital2ndYearController.text = widget.initialData!['totalCapital2ndYear'] ?? '';
      totalCapital3rdYearController.text = widget.initialData!['totalCapital3rdYear'] ?? '';
      totalCapitalAmtRecController.text = widget.initialData!['totalCapitalAmtRec'] ?? '';
      personnelTotalController.text = widget.initialData!['personnelTotal'] ?? '';
      personnel1stYearController.text = widget.initialData!['personnel1stYear'] ?? '';
      personnel2ndYearController.text = widget.initialData!['personnel2ndYear'] ?? '';
      personnel3rdYearController.text = widget.initialData!['personnel3rdYear'] ?? '';
      personnelAmtRecController.text = widget.initialData!['personnelAmtRec'] ?? '';
      consumablesTotalController.text = widget.initialData!['consumablesTotal'] ?? '';
      consumables1stYearController.text = widget.initialData!['consumables1stYear'] ?? '';
      consumables2ndYearController.text = widget.initialData!['consumables2ndYear'] ?? '';
      consumables3rdYearController.text = widget.initialData!['consumables3rdYear'] ?? '';
      consumablesAmtRecController.text = widget.initialData!['consumablesAmtRec'] ?? '';
      travelsTotalController.text = widget.initialData!['travelsTotal'] ?? '';
      travels1stYearController.text = widget.initialData!['travels1stYear'] ?? '';
      travels2ndYearController.text = widget.initialData!['travels2ndYear'] ?? '';
      travels3rdYearController.text = widget.initialData!['travels3rdYear'] ?? '';
      travelsAmtRecController.text = widget.initialData!['travelsAmtRec'] ?? '';
      contingencyTotalController.text = widget.initialData!['contingencyTotal'] ?? '';
      contingency1stYearController.text = widget.initialData!['contingency1stYear'] ?? '';
      contingency2ndYearController.text = widget.initialData!['contingency2ndYear'] ?? '';
      contingency3rdYearController.text = widget.initialData!['contingency3rdYear'] ?? '';
      contingencyAmtRecController.text = widget.initialData!['contingencyAmtRec'] ?? '';
      overheadsTotalController.text = widget.initialData!['overheadsTotal'] ?? '';
      overheads1stYearController.text = widget.initialData!['overheads1stYear'] ?? '';
      overheads2ndYearController.text = widget.initialData!['overheads2ndYear'] ?? '';
      overheads3rdYearController.text = widget.initialData!['overheads3rdYear'] ?? '';
      overheadsAmtRecController.text = widget.initialData!['overheadsAmtRec'] ?? '';
      devMaintTotalController.text = widget.initialData!['devMaintTotal'] ?? '';
      devMaint1stYearController.text = widget.initialData!['devMaint1stYear'] ?? '';
      devMaint2ndYearController.text = widget.initialData!['devMaint2ndYear'] ?? '';
      devMaint3rdYearController.text = widget.initialData!['devMaint3rdYear'] ?? '';
      devMaintAmtRecController.text = widget.initialData!['devMaintAmtRec'] ?? '';
      testingTotalController.text = widget.initialData!['testingTotal'] ?? '';
      testing1stYearController.text = widget.initialData!['testing1stYear'] ?? '';
      testing2ndYearController.text = widget.initialData!['testing2ndYear'] ?? '';
      testing3rdYearController.text = widget.initialData!['testing3rdYear'] ?? '';
      testingAmtRecController.text = widget.initialData!['testingAmtRec'] ?? '';
      totalRevenueTotalController.text = widget.initialData!['totalRevenueTotal'] ?? '';
      totalRevenue1stYearController.text = widget.initialData!['totalRevenue1stYear'] ?? '';
      totalRevenue2ndYearController.text = widget.initialData!['totalRevenue2ndYear'] ?? '';
      totalRevenue3rdYearController.text = widget.initialData!['totalRevenue3rdYear'] ?? '';
      totalRevenueAmtRecController.text = widget.initialData!['totalRevenueAmtRec'] ?? '';
      uniquecodeController.text = widget.initialData!['uniquecode'] ?? '';
      gTotalTotalController.text=widget.initialData!['gTotalTotal'] ??'';
      gTotal1stYearController.text = widget.initialData!['gTotal1stYear'] ?? '';
      gTotal2ndYearController.text = widget.initialData!['gTotal2ndYear'] ?? '';
      gTotal3rdYearController.text = widget.initialData!['gTotal3rdYear'] ?? '';
      gTotalAmtRecController.text = widget.initialData!['gTotalAmtRec'] ?? '';
      remarksController.text = widget.initialData!['remarks'] ?? '';
      installmentNoController.text=widget.initialData!['installmentNo']??'';
      entryDateController.text=widget.initialData!['entryDate'] ??'';
    }
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed.
    nameController.dispose();
    addressController.dispose();
    sponsorLetterRefController.dispose();
    projectTitleController.dispose();
    projectLeaderController.dispose();
    projectCoordinatorController.dispose();
    paymentAmountController.dispose();
    chequeController.dispose();
    headOfAccountController.dispose();
    durationController.dispose();
    sponsorContributionController.dispose();
    sectionController.dispose();
    projectTypeController.dispose();
    hosController.dispose();
    horgController.dispose();
    datedController.dispose();
    codeController.dispose();
    startDateController.dispose();
    completionDateController.dispose();
    landBuildingTotalController.dispose();
    landBuilding1stYearController.dispose();
    landBuilding2ndYearController.dispose();
    landBuilding3rdYearController.dispose();
    landBuildingAmtRecController.dispose();
    equipmentTotalController.dispose();
    equipment1stYearController.dispose();
    equipment2ndYearController.dispose();
    equipment3rdYearController.dispose();
    equipmentAmtRecController.dispose();
    totalCapitalTotalController.dispose();
    totalCapital1stYearController.dispose();
    totalCapital2ndYearController.dispose();
    totalCapital3rdYearController.dispose();
    totalCapitalAmtRecController.dispose();
    personnelTotalController.dispose();
    personnel1stYearController.dispose();
    personnel2ndYearController.dispose();
    personnel3rdYearController.dispose();
    personnelAmtRecController.dispose();
    consumablesTotalController.dispose();
    consumables1stYearController.dispose();
    consumables2ndYearController.dispose();
    consumables3rdYearController.dispose();
    consumablesAmtRecController.dispose();
    travelsTotalController.dispose();
    travels1stYearController.dispose();
    travels2ndYearController.dispose();
    travels3rdYearController.dispose();
    travelsAmtRecController.dispose();
    contingencyTotalController.dispose();
    contingency1stYearController.dispose();
    contingency2ndYearController.dispose();
    contingency3rdYearController.dispose();
    contingencyAmtRecController.dispose();
    overheadsTotalController.dispose();
    overheads1stYearController.dispose();
    overheads2ndYearController.dispose();
    overheads3rdYearController.dispose();
    overheadsAmtRecController.dispose();
    devMaintTotalController.dispose();
    devMaint1stYearController.dispose();
    devMaint2ndYearController.dispose();
    devMaint3rdYearController.dispose();
    devMaintAmtRecController.dispose();
    testingTotalController.dispose();
    testing1stYearController.dispose();
    testing2ndYearController.dispose();
    testing3rdYearController.dispose();
    testingAmtRecController.dispose();
    totalRevenueTotalController.dispose();
    totalRevenue1stYearController.dispose();
    totalRevenue2ndYearController.dispose();
    totalRevenue3rdYearController.dispose();
    totalRevenueAmtRecController.dispose();
    uniquecodeController.dispose();

    gTotalTotalController.dispose();
    gTotal1stYearController.dispose();
    gTotal2ndYearController.dispose();
    gTotal3rdYearController.dispose();
    gTotalAmtRecController.dispose();
    remarksController.dispose();

    entryDateController.dispose();
    installmentNoController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    setState(() {
      _isLoding=true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        GAPFormData formData=GAPFormData(name: nameController.text,
            address: addressController.text,
            sponsorLetterRef: sponsorLetterRefController.text,
            projectTitle: projectTitleController.text,
            projectLeader: projectLeaderController.text,
            projectCoordinator: projectCoordinatorController.text,
            paymentAmount: paymentAmountController.text,
            cheque: chequeController.text,
            headOfAccount: headOfAccountController.text,
            duration: durationController.text,
            sponsorContribution: sponsorContributionController.text,
            section: sectionController.text,
            projectType: projectTypeController.text,
            hos: hosController.text,
            horg: horgController.text,
            dated: datedController.text,
            code: codeController.text,
            startDate: startDateController.text,
            completionDate: completionDateController.text,
            landBuildingTotal: landBuildingTotalController.text,
            landBuilding1stYear: landBuilding1stYearController.text,
            landBuilding2ndYear: landBuilding2ndYearController.text,
            landBuilding3rdYear: landBuilding3rdYearController.text,
            landBuildingAmtRec: landBuildingAmtRecController.text,
            equipmentTotal: equipmentTotalController.text,
            equipment1stYear: equipment1stYearController.text,
            equipment2ndYear: equipment2ndYearController.text,
            equipment3rdYear: equipment3rdYearController.text,
            equipmentAmtRec: equipmentAmtRecController.text,
            totalCapitalTotal: totalCapitalTotalController.text,
            totalCapital1stYear: totalCapital1stYearController.text,
            totalCapital2ndYear: totalCapital2ndYearController.text,
            totalCapital3rdYear: totalCapital3rdYearController.text,
            totalCapitalAmtRec: totalCapitalAmtRecController.text,
            personnelTotal: personnelTotalController.text,
            personnel1stYear: personnel1stYearController.text,
            personnel2ndYear: personnel2ndYearController.text,
            personnel3rdYear: personnel3rdYearController.text,
            personnelAmtRec: personnelAmtRecController.text,
            consumablesTotal: consumablesTotalController.text,
            consumables1stYear: consumables1stYearController.text,
            consumables2ndYear: consumables2ndYearController.text,
            consumables3rdYear: consumables3rdYearController.text,
            consumablesAmtRec: consumablesAmtRecController.text,
            travelsTotal: travelsTotalController.text,
            travels1stYear: travels1stYearController.text,
            travels2ndYear: travels2ndYearController.text,
            travels3rdYear: travels3rdYearController.text,
            travelsAmtRec: travelsAmtRecController.text,
            contingencyTotal: contingencyTotalController.text,
            contingency1stYear: contingency1stYearController.text,
            contingency2ndYear: contingency2ndYearController.text,
            contingency3rdYear: contingency3rdYearController.text,
            contingencyAmtRec: contingencyAmtRecController.text,
            overheadsTotal: overheadsTotalController.text,
            overheads1stYear: overheads1stYearController.text,
            overheads2ndYear: overheads2ndYearController.text,
            overheads3rdYear: overheads3rdYearController.text,
            overheadsAmtRec: overheadsAmtRecController.text,
            devMaintTotal: devMaintTotalController.text,
            devMaint1stYear: devMaint1stYearController.text,
            devMaint2ndYear: devMaint2ndYearController.text,
            devMaint3rdYear: devMaint3rdYearController.text,
            devMaintAmtRec: devMaintAmtRecController.text,
            testingTotal: testingTotalController.text,
            testing1stYear: testing1stYearController.text,
            testing2ndYear: testing2ndYearController.text,
            testing3rdYear: testing3rdYearController.text,
            testingAmtRec: testingAmtRecController.text,
            totalRevenueTotal: totalRevenueTotalController.text,
            totalRevenue1stYear: totalRevenue1stYearController.text,
            totalRevenue2ndYear: totalRevenue2ndYearController.text,
            totalRevenue3rdYear: totalRevenue3rdYearController.text,
            totalRevenueAmtRec: totalRevenueAmtRecController.text,
            formId: widget.initialData!['formId'],
          uniquecode: uniquecodeController.text,

          gTotalTotal: gTotalTotalController.text,
          gTotal1stYear: gTotal1stYearController.text,
          gTotal2ndYear: gTotal2ndYearController.text,
          gTotal3rdYear: gTotal3rdYearController.text,
          gTotalAmtRec: gTotalAmtRecController.text,
          remarks: remarksController.text,
          entryDate: entryDateController.text,
          installmentNo: installmentNoController.text,

        );
        // SPFormData formData = SPFormData(
        //   name: nameController.text,
        //   address: addressController.text,
        //   sponsorLetterReference: sponsorReferenceController.text,
        //   projectTitle: projectTitleController.text,
        //   projectLeaders: projectLeadersController.text,
        //   projectCoordinator: projectCoordinatorController.text,
        //   paymentAmount: paymentAmountController.text,
        //   chequeDdNoEcs: chequeNoController.text,
        //   headOfAccount: headOfAccountController.text,
        //   duration: durationController.text,
        //   sponsorContribution: sponsorContributionController.text,
        //   section: sectionController.text,
        //   projectType: projectTypeController.text,
        //   hos: hosController.text,
        //   horg: horgController.text,
        //   dated: datedController.text,
        //   code: codeController.text,
        //   dateOfStart: dateOfStartController.text,
        //   completionDate: completionDateController.text,
        //   equipmentCapital: equipmentController.text,
        //   consumablesRawMaterialsComponent: consumablesController.text,
        //   servicesUtilities: servicesController.text,
        //   externalPayment: externalPaymentController.text,
        //   taDaContingencies: taContingenciesController.text,
        //   instituteInfrastructureFund: infrastructureFundController.text,
        //   projectFollow: projectFollowController.text,
        //   costOfMandays: costOfMandaysController.text,
        //   equipmentComputerUsage: equipmentUsageController.text,
        //   overhead: overheadController.text,
        //   handlingCharges: handlingChargesController.text,
        //   totalExpenses: totalExpensesController.text,
        //   laboratoryShare: laboratoryShareController.text,
        //   projectFee: projectFeeController.text,
        //   totalProjectCharge: totalProjectChargeController.text,
        //   igst: igstController.text,
        //   cgst: cgstController.text,
        //   sgst: sgstController.text,
        //   amountDeposited: amountDepositedController.text,
        //   valueOfService: valueOfServiceController.text,
        //   itTds: itTdsController.text,
        //   formId: widget.initialData!['formId'],
        // );


        await FirebaseFirestore.instance.collection("gapForm").doc(widget.initialData!['formId']).update(formData.toJson());
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
                Text('1.By Whom tendered'),
                Text('Name: ${nameController.text}'),
                Text('Address: ${addressController.text}'),
                Text('Entry Date: ${entryDateController.text}'),
                Text('Installment No : ${installmentNoController.text}'),
                Text('2.Sponsor Letter Ref: ${sponsorLetterRefController.text}'),
                Text('3.Project Title: ${projectTitleController.text}'),
                Text('4.Project Leader: ${projectLeaderController.text}'),
                Text('5.Project Coordinator: ${projectCoordinatorController.text}'),
                Text('6.Payment Amount: ${paymentAmountController.text}'),
                Text('7.Cheque: ${chequeController.text}'),
                Text('8.Head of Account: ${headOfAccountController.text}'),
                Text('9.Duration: ${durationController.text}'),
                Text('Sponsor Contribution: ${sponsorContributionController.text}'),
                Text('Section: ${sectionController.text}'),
                Text('Project Type: ${projectTypeController.text}'),
                Text('HOS: ${hosController.text}'),
                Text('HORG: ${horgController.text}'),
                Text('Dated: ${datedController.text}'),
                Text('Code: ${codeController.text}'),
                Text('Start Date: ${startDateController.text}'),
                Text('Completion Date: ${completionDateController.text}'),
                Text('A.Capital Expenditure'),
                Text('1.Land Building'),
                Text('Land Building Total: ${landBuildingTotalController.text}'),
                Text('Land Building 1st Year: ${landBuilding1stYearController.text}'),
                Text('Land Building 2nd Year: ${landBuilding2ndYearController.text}'),
                Text('Land Building 3rd Year: ${landBuilding3rdYearController.text}'),
                Text('Land Building Amt Rec: ${landBuildingAmtRecController.text}'),
                Text('2.Equipment'),
                Text('Equipment Total: ${equipmentTotalController.text}'),
                Text('Equipment 1st Year: ${equipment1stYearController.text}'),
                Text('Equipment 2nd Year: ${equipment2ndYearController.text}'),
                Text('Equipment 3rd Year: ${equipment3rdYearController.text}'),
                Text('Equipment Amt Rec: ${equipmentAmtRecController.text}'),
                Text('3.Total Capital'),
                Text('Total Capital Total: ${totalCapitalTotalController.text}'),
                Text('Total Capital 1st Year: ${totalCapital1stYearController.text}'),
                Text('Total Capital 2nd Year: ${totalCapital2ndYearController.text}'),
                Text('Total Capital 3rd Year: ${totalCapital3rdYearController.text}'),
                Text('Total Capital Amt Rec: ${totalCapitalAmtRecController.text}'),
                Text('B.Revenue Expenditure'),
                Text('4.Personnel'),
                Text('Personnel Total: ${personnelTotalController.text}'),
                Text('Personnel 1st Year: ${personnel1stYearController.text}'),
                Text('Personnel 2nd Year: ${personnel2ndYearController.text}'),
                Text('Personnel 3rd Year: ${personnel3rdYearController.text}'),
                Text('Personnel Amt Rec: ${personnelAmtRecController.text}'),
                Text('5.Consumables'),
                Text('Consumables Total: ${consumablesTotalController.text}'),
                Text('Consumables 1st Year: ${consumables1stYearController.text}'),
                Text('Consumables 2nd Year: ${consumables2ndYearController.text}'),
                Text('Consumables 3rd Year: ${consumables3rdYearController.text}'),
                Text('Consumables Amt Rec: ${consumablesAmtRecController.text}'),
                Text('6.Travels'),
                Text('Travels Total: ${travelsTotalController.text}'),
                Text('Travels 1st Year: ${travels1stYearController.text}'),
                Text('Travels 2nd Year: ${travels2ndYearController.text}'),
                Text('Travels 3rd Year: ${travels3rdYearController.text}'),
                Text('Travels Amt Rec: ${travelsAmtRecController.text}'),
                Text('7.Contingency'),
                Text('Contingency Total: ${contingencyTotalController.text}'),
                Text('Contingency 1st Year: ${contingency1stYearController.text}'),
                Text('Contingency 2nd Year: ${contingency2ndYearController.text}'),
                Text('Contingency 3rd Year: ${contingency3rdYearController.text}'),
                Text('Contingency Amt Rec: ${contingencyAmtRecController.text}'),
                Text('8.Overheads'),
                Text('Overheads Total: ${overheadsTotalController.text}'),
                Text('Overheads 1st Year: ${overheads1stYearController.text}'),
                Text('Overheads 2nd Year: ${overheads2ndYearController.text}'),
                Text('Overheads 3rd Year: ${overheads3rdYearController.text}'),
                Text('Overheads Amt Rec: ${overheadsAmtRecController.text}'),
                Text('9.Dev Maint'),
                Text('Dev Maint Total: ${devMaintTotalController.text}'),
                Text('Dev Maint 1st Year: ${devMaint1stYearController.text}'),
                Text('Dev Maint 2nd Year: ${devMaint2ndYearController.text}'),
                Text('Dev Maint 3rd Year: ${devMaint3rdYearController.text}'),
                Text('Dev Maint Amt Rec: ${devMaintAmtRecController.text}'),
                Text('10.Testing'),
                Text('Testing Total: ${testingTotalController.text}'),
                Text('Testing 1st Year: ${testing1stYearController.text}'),
                Text('Testing 2nd Year: ${testing2ndYearController.text}'),
                Text('Testing 3rd Year: ${testing3rdYearController.text}'),
                Text('Testing Amt Rec: ${testingAmtRecController.text}'),
                Text('Total Revenue Total: ${totalRevenueTotalController.text}'),
                Text('Total Revenue 1st Year: ${totalRevenue1stYearController.text}'),
                Text('Total Revenue 2nd Year: ${totalRevenue2ndYearController.text}'),
                Text('Total Revenue 3rd Year: ${totalRevenue3rdYearController.text}'),
                Text('Total Revenue Amt Rec: ${totalRevenueAmtRecController.text}'),

                Text('G.Total Total: ${gTotalTotalController.text}'),
                Text('G.Total 1st Year: ${gTotal1stYearController.text}'),
                Text('G.Total 2nd Year: ${gTotal2ndYearController.text}'),
                Text('G.Total 3rd Year: ${gTotal3rdYearController.text}'),
                Text('G.Total Amt Rec: ${gTotalAmtRecController.text}'),
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
      ): Form(
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
              Text("1.By Whom tendered"),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: entryDateController,
                decoration: InputDecoration(labelText: 'Entry Date :'),
              ),
              TextFormField(
                controller: installmentNoController,
                decoration: InputDecoration(labelText: 'Installment No :'),
              ),
              TextFormField(
                controller: sponsorLetterRefController,
                decoration: InputDecoration(labelText: '2.Sponsor Letter Reference'),
              ),
              TextFormField(
                controller: projectTitleController,
                decoration: InputDecoration(labelText: '3.Project Title'),
              ),
              TextFormField(
                controller: projectLeaderController,
                decoration: InputDecoration(labelText: '4.Project Leader'),
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
                controller: chequeController,
                decoration: InputDecoration(labelText: '7.Cheque'),
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
                decoration: InputDecoration(labelText: 'Sponsor Contribution'),
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
                decoration: InputDecoration(labelText: 'Hos'),
              ),
              TextFormField(
                controller: horgController,
                decoration: InputDecoration(labelText: 'Horg'),
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
                controller: startDateController,
                decoration: InputDecoration(labelText: 'Start Date'),
                onTap: ()=>_selectDate(context,startDateController),
              ),
              TextFormField(
                controller: completionDateController,
                decoration: InputDecoration(labelText: 'Completion Date'),
                onTap: ()=>_selectDate(context,completionDateController),

              ),
              Text('A.Capital Expenditure'),
              Text('1.Land Building'),
              TextFormField(
                controller: landBuildingTotalController,
                decoration: InputDecoration(labelText: 'Land Building Total'),
              ),
              TextFormField(
                controller: landBuilding1stYearController,
                decoration: InputDecoration(labelText: 'Land Building 1st Year'),
              ),
              TextFormField(
                controller: landBuilding2ndYearController,
                decoration: InputDecoration(labelText: 'Land Building 2nd Year'),
              ),
              TextFormField(
                controller: landBuilding3rdYearController,
                decoration: InputDecoration(labelText: 'Land Building 3rd Year'),
              ),
              TextFormField(
                controller: landBuildingAmtRecController,
                decoration: InputDecoration(labelText: 'Land Building Amount Received'),
              ),
              Text('2.Equipment'),
              TextFormField(
                controller: equipmentTotalController,
                decoration: InputDecoration(labelText: 'Equipment Total'),
              ),
              TextFormField(
                controller: equipment1stYearController,
                decoration: InputDecoration(labelText: 'Equipment 1st Year'),
              ),
              TextFormField(
                controller: equipment2ndYearController,
                decoration: InputDecoration(labelText: 'Equipment 2nd Year'),
              ),
              TextFormField(
                controller: equipment3rdYearController,
                decoration: InputDecoration(labelText: 'Equipment 3rd Year'),
              ),
              TextFormField(
                controller: equipmentAmtRecController,
                decoration: InputDecoration(labelText: 'Equipment Amount Received'),
              ),
              Text('3.Total Capital'),
              TextFormField(
                controller: totalCapitalTotalController,
                decoration: InputDecoration(labelText: 'Total Capital Total'),
              ),
              TextFormField(
                controller: totalCapital1stYearController,
                decoration: InputDecoration(labelText: 'Total Capital 1st Year'),
              ),
              TextFormField(
                controller: totalCapital2ndYearController,
                decoration: InputDecoration(labelText: 'Total Capital 2nd Year'),
              ),
              TextFormField(
                controller: totalCapital3rdYearController,
                decoration: InputDecoration(labelText: 'Total Capital 3rd Year'),
              ),
              TextFormField(
                controller: totalCapitalAmtRecController,
                decoration: InputDecoration(labelText: 'Total Capital Amount Received'),
              ),
              Text('B.Revenue Expenditure'),
              Text('4.Personnel'),
              TextFormField(
                controller: personnelTotalController,
                decoration: InputDecoration(labelText: 'Personnel Total'),
              ),
              TextFormField(
                controller: personnel1stYearController,
                decoration: InputDecoration(labelText: 'Personnel 1st Year'),
              ),
              TextFormField(
                controller: personnel2ndYearController,
                decoration: InputDecoration(labelText: 'Personnel 2nd Year'),
              ),
              TextFormField(
                controller: personnel3rdYearController,
                decoration: InputDecoration(labelText: 'Personnel 3rd Year'),
              ),
              TextFormField(
                controller: personnelAmtRecController,
                decoration: InputDecoration(labelText: 'Personnel Amount Received'),
              ),
              Text('5.Consumables'),
              TextFormField(
                controller: consumablesTotalController,
                decoration: InputDecoration(labelText: 'Consumables Total'),
              ),
              TextFormField(
                controller: consumables1stYearController,
                decoration: InputDecoration(labelText: 'Consumables 1st Year'),
              ),
              TextFormField(
                controller: consumables2ndYearController,
                decoration: InputDecoration(labelText: 'Consumables 2nd Year'),
              ),
              TextFormField(
                controller: consumables3rdYearController,
                decoration: InputDecoration(labelText: 'Consumables 3rd Year'),
              ),
              TextFormField(
                controller: consumablesAmtRecController,
                decoration: InputDecoration(labelText: 'Consumables Amount Received'),
              ),
              Text('6.Travels'),
              TextFormField(
                controller: travelsTotalController,
                decoration: InputDecoration(labelText: 'Travels Total'),
              ),
              TextFormField(
                controller: travels1stYearController,
                decoration: InputDecoration(labelText: 'Travels 1st Year'),
              ),
              TextFormField(
                controller: travels2ndYearController,
                decoration: InputDecoration(labelText: 'Travels 2nd Year'),
              ),
              TextFormField(
                controller: travels3rdYearController,
                decoration: InputDecoration(labelText: 'Travels 3rd Year'),
              ),
              TextFormField(
                controller: travelsAmtRecController,
                decoration: InputDecoration(labelText: 'Travels Amount Received'),
              ),
              Text('7.Contingency'),
              TextFormField(
                controller: contingencyTotalController,
                decoration: InputDecoration(labelText: 'Contingency Total'),
              ),
              TextFormField(
                controller: contingency1stYearController,
                decoration: InputDecoration(labelText: 'Contingency 1st Year'),
              ),
              TextFormField(
                controller: contingency2ndYearController,
                decoration: InputDecoration(labelText: 'Contingency 2nd Year'),
              ),
              TextFormField(
                controller: contingency3rdYearController,
                decoration: InputDecoration(labelText: 'Contingency 3rd Year'),
              ),
              TextFormField(
                controller: contingencyAmtRecController,
                decoration: InputDecoration(labelText: 'Contingency Amount Received'),
              ),
              Text('8.Overheads'),
              TextFormField(
                controller: overheadsTotalController,
                decoration: InputDecoration(labelText: 'Overheads Total'),
              ),
              TextFormField(
                controller: overheads1stYearController,
                decoration: InputDecoration(labelText: 'Overheads 1st Year'),
              ),
              TextFormField(
                controller: overheads2ndYearController,
                decoration: InputDecoration(labelText: 'Overheads 2nd Year'),
              ),
              TextFormField(
                controller: overheads3rdYearController,
                decoration: InputDecoration(labelText: 'Overheads 3rd Year'),
              ),
              TextFormField(
                controller: overheadsAmtRecController,
                decoration: InputDecoration(labelText: 'Overheads Amount Received'),
              ),
              Text('9.Dev/Maint'),
              TextFormField(
                controller: devMaintTotalController,
                decoration: InputDecoration(labelText: 'Dev/Maint Total'),
              ),
              TextFormField(
                controller: devMaint1stYearController,
                decoration: InputDecoration(labelText: 'Dev/Maint 1st Year'),
              ),
              TextFormField(
                controller: devMaint2ndYearController,
                decoration: InputDecoration(labelText: 'Dev/Maint 2nd Year'),
              ),
              TextFormField(
                controller: devMaint3rdYearController,
                decoration: InputDecoration(labelText: 'Dev/Maint 3rd Year'),
              ),
              TextFormField(
                controller: devMaintAmtRecController,
                decoration: InputDecoration(labelText: 'Dev/Maint Amount Received'),
              ),
              Text('10.Testing'),
              TextFormField(
                controller: testingTotalController,
                decoration: InputDecoration(labelText: 'Testing Total'),
              ),
              TextFormField(
                controller: testing1stYearController,
                decoration: InputDecoration(labelText: 'Testing 1st Year'),
              ),
              TextFormField(
                controller: testing2ndYearController,
                decoration: InputDecoration(labelText: 'Testing 2nd Year'),
              ),
              TextFormField(
                controller: testing3rdYearController,
                decoration: InputDecoration(labelText: 'Testing 3rd Year'),
              ),
              TextFormField(
                controller: testingAmtRecController,
                decoration: InputDecoration(labelText: 'Testing Amount Received'),
              ),
              TextFormField(
                controller: totalRevenueTotalController,
                decoration: InputDecoration(labelText: 'Total Revenue Total'),
              ),
              TextFormField(
                controller: totalRevenue1stYearController,
                decoration: InputDecoration(labelText: 'Total Revenue 1st Year'),
              ),
              TextFormField(
                controller: totalRevenue2ndYearController,
                decoration: InputDecoration(labelText: 'Total Revenue 2nd Year'),
              ),
              TextFormField(
                controller: totalRevenue3rdYearController,
                decoration: InputDecoration(labelText: 'Total Revenue 3rd Year'),
              ),
              TextFormField(
                controller: totalRevenueAmtRecController,
                decoration: InputDecoration(labelText: 'Total Revenue Amount Received'),
              ),
              TextFormField(
                controller: gTotalTotalController,
                decoration: InputDecoration(labelText: 'G.Total Total'),
              ),
              TextFormField(
                controller: gTotal1stYearController,
                decoration: InputDecoration(labelText: 'G.Total 1st Year'),
              ),
              TextFormField(
                controller: gTotal2ndYearController,
                decoration: InputDecoration(labelText: 'G.Total 2nd Year'),
              ),
              TextFormField(
                controller: gTotal3rdYearController,
                decoration: InputDecoration(labelText: 'G.Total 3rd Year'),
              ),
              TextFormField(
                controller: gTotalAmtRecController,
                decoration: InputDecoration(labelText: 'G.Total Amount Received'),
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
