import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../models/cp_challan.dart';
import '../models/gap_challan.dart';
import '../models/sp_challan.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> spFormUpload(
    String name,
    String address,
    String sponsorLetterReference,
    String projectTitle,
    String projectLeaders,
    String projectCoordinator,
    String paymentAmount,
    String chequeDdNoEcs,
    String headOfAccount,
    String duration,
    String sponsorContribution,
    String section,
    String projectType,
    String hos,
    String horg,
    String dated,
    String code,
    String dateOfStart,
    String completionDate,
    String equipmentCapital,
    String consumablesRawMaterialsComponent,
    String servicesUtilities,
    String externalPayment,
    String taDaContingencies,
    String instituteInfrastructureFund,
    String projectFollow,
    String costOfMandays,
    String equipmentComputerUsage,
    String overhead,
    String handlingCharges,
    String totalExpenses,
    String laboratoryShare,
    String projectFee,
    String totalProjectCharge,
    String igst,
    String cgst,
    String sgst,
    String amountDeposited,
    String valueOfService,
    String itTds,




    String contingencies,
    String totalOneToEight,
    String totalOneToFour,
    String totalOneToThree,
    String totalCostOfProject,
    String remarks,
    String igstPercentage,
    String cgstPercentage,
    String sgstPercentage,
    String installmentNo,
  ) async {
    String res = "some error occured";

    try {
      String formId = const Uuid().v1();
      String entryDate = new DateTime(new DateTime.now().year,
              new DateTime.now().month, new DateTime.now().day)
          .toString()
          .substring(0, 10);
      final collection = FirebaseFirestore.instance.collection("spForm");
      final countQuery = collection.count();
      final AggregateQuerySnapshot snapshot = await countQuery.get();
      final len = snapshot.count;

      // debugPrint("Count: ${snapshot.count}");

      SPFormData formData = SPFormData(
        name: name,
        address: address,
        sponsorLetterReference: sponsorLetterReference,
        projectTitle: projectTitle,
        projectLeaders: projectLeaders,
        projectCoordinator: projectCoordinator,
        paymentAmount: paymentAmount,
        chequeDdNoEcs: chequeDdNoEcs,
        headOfAccount: headOfAccount,
        duration: duration,
        sponsorContribution: sponsorContribution,
        section: section,
        projectType: projectType,
        hos: hos,
        horg: horg,
        dated: dated,
        code: code,
        dateOfStart: dateOfStart,
        completionDate: completionDate,
        equipmentCapital: equipmentCapital,
        consumablesRawMaterialsComponent: consumablesRawMaterialsComponent,
        servicesUtilities: servicesUtilities,
        externalPayment: externalPayment,
        taDaContingencies: taDaContingencies,
        instituteInfrastructureFund: instituteInfrastructureFund,
        projectFollow: projectFollow,
        costOfMandays: costOfMandays,
        equipmentComputerUsage: equipmentComputerUsage,
        overhead: overhead,
        handlingCharges: handlingCharges,
        totalExpenses: totalExpenses,
        laboratoryShare: laboratoryShare,
        projectFee: projectFee,
        totalProjectCharge: totalProjectCharge,
        igst: igst,
        cgst: cgst,
        sgst: sgst,
        amountDeposited: amountDeposited,
        valueOfService: valueOfService,
        itTds: itTds,
        formId: formId,
        uniquecode: 'SP/${len! + 1}/' + entryDate.substring(0, 4),




        entryDate: entryDate,
        contingencies: contingencies,
        totalOneToEight: totalOneToEight,
        totalOneToFour: totalOneToFour,
        totalOneToThree: totalOneToThree,
        totalCostOfProject: totalCostOfProject,
        remarks: remarks,
        igstPercentage: igstPercentage,
        cgstPercentage: cgstPercentage,
        sgstPercentage: sgstPercentage,
        installmentNo: installmentNo,
      );
      _firestore.collection('spForm').doc(formId).set(formData.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> gapFormUpload(
    String name,
    address,
    sponsorLetterRef,
    projectTitle,
    projectLeader,
    projectCoordinator,
    paymentAmount,
    cheque,
    headOfAccount,
    duration,
    sponsorContribution,
    section,
    projectType,
    hos,
    horg,
    dated,
    code,
    startDate,
    completionDate,

// Financial Fields
    String landBuildingTotal,
    landBuilding1stYear,
    landBuilding2ndYear,
    landBuilding3rdYear,
    landBuildingAmtRec,
    equipmentTotal,
    equipment1stYear,
    equipment2ndYear,
    equipment3rdYear,
    equipmentAmtRec,
    totalCapitalTotal,
    totalCapital1stYear,
    totalCapital2ndYear,
    totalCapital3rdYear,
    totalCapitalAmtRec,
    personnelTotal,
    personnel1stYear,
    personnel2ndYear,
    personnel3rdYear,
    personnelAmtRec,
    consumablesTotal,
    consumables1stYear,
    consumables2ndYear,
    consumables3rdYear,
    consumablesAmtRec,
    travelsTotal,
    travels1stYear,
    travels2ndYear,
    travels3rdYear,
    travelsAmtRec,
    contingencyTotal,
    contingency1stYear,
    contingency2ndYear,
    contingency3rdYear,
    contingencyAmtRec,
    overheadsTotal,
    overheads1stYear,
    overheads2ndYear,
    overheads3rdYear,
    overheadsAmtRec,
    devMaintTotal,
    devMaint1stYear,
    devMaint2ndYear,
    devMaint3rdYear,
    devMaintAmtRec,
    testingTotal,
    testing1stYear,
    testing2ndYear,
    testing3rdYear,
    testingAmtRec,
    totalRevenueTotal,
    totalRevenue1stYear,
    totalRevenue2ndYear,
    totalRevenue3rdYear,
    totalRevenueAmtRec,
      gTotalTotal,
      gTotal1stYear,
      gTotal2ndYear,
      gTotal3rdYear,
      gTotalAmtRec,
      remarks,
      installmentNo,
  ) async {
    String res = "some error occured";

    try {
      String formId = const Uuid().v1();
      String entryDate = new DateTime(new DateTime.now().year,
          new DateTime.now().month, new DateTime.now().day)
          .toString()
          .substring(0, 10);
      final collection = FirebaseFirestore.instance.collection("gapForm");
      final countQuery = collection.count();
      final AggregateQuerySnapshot snapshot = await countQuery.get();
      final len = snapshot.count;

      GAPFormData formData = GAPFormData(
        name: name,
        address: address,
        sponsorLetterRef: sponsorLetterRef,
        projectTitle: projectTitle,
        projectLeader: projectLeader,
        projectCoordinator: projectCoordinator,
        paymentAmount: paymentAmount,
        cheque: cheque,
        headOfAccount: headOfAccount,
        duration: duration,
        sponsorContribution: sponsorContribution,
        section: section,
        projectType: projectType,
        hos: hos,
        horg: horg,
        dated: dated,
        code: code,
        startDate: startDate,
        completionDate: completionDate,

// Financial Fields
        landBuildingTotal: landBuildingTotal,
        landBuilding1stYear: landBuilding1stYear,
        landBuilding2ndYear: landBuilding2ndYear,
        landBuilding3rdYear: landBuilding3rdYear,
        landBuildingAmtRec: landBuildingAmtRec,
        equipmentTotal: equipmentTotal,
        equipment1stYear: equipment1stYear,
        equipment2ndYear: equipment2ndYear,
        equipment3rdYear: equipment3rdYear,
        equipmentAmtRec: equipmentAmtRec,
        totalCapitalTotal: totalCapitalTotal,
        totalCapital1stYear: totalCapital1stYear,
        totalCapital2ndYear: totalCapital2ndYear,
        totalCapital3rdYear: totalCapital3rdYear,
        totalCapitalAmtRec: totalCapitalAmtRec,
        personnelTotal: personnelTotal,
        personnel1stYear: personnel1stYear,
        personnel2ndYear: personnel2ndYear,
        personnel3rdYear: personnel3rdYear,
        personnelAmtRec: personnelAmtRec,
        consumablesTotal: consumablesTotal,
        consumables1stYear: consumables1stYear,
        consumables2ndYear: consumables2ndYear,
        consumables3rdYear: consumables3rdYear,
        consumablesAmtRec: consumablesAmtRec,
        travelsTotal: travelsTotal,
        travels1stYear: travels1stYear,
        travels2ndYear: travels2ndYear,
        travels3rdYear: travels3rdYear,
        travelsAmtRec: travelsAmtRec,
        contingencyTotal: contingencyTotal,
        contingency1stYear: contingency1stYear,
        contingency2ndYear: contingency2ndYear,
        contingency3rdYear: contingency3rdYear,
        contingencyAmtRec: contingencyAmtRec,
        overheadsTotal: overheadsTotal,
        overheads1stYear: overheads1stYear,
        overheads2ndYear: overheads2ndYear,
        overheads3rdYear: overheads3rdYear,
        overheadsAmtRec: overheadsAmtRec,
        devMaintTotal: devMaintTotal,
        devMaint1stYear: devMaint1stYear,
        devMaint2ndYear: devMaint2ndYear,
        devMaint3rdYear: devMaint3rdYear,
        devMaintAmtRec: devMaintAmtRec,
        testingTotal: testingTotal,
        testing1stYear: testing1stYear,
        testing2ndYear: testing2ndYear,
        testing3rdYear: testing3rdYear,
        testingAmtRec: testingAmtRec,
        totalRevenueTotal: totalRevenueTotal,
        totalRevenue1stYear: totalRevenue1stYear,
        totalRevenue2ndYear: totalRevenue2ndYear,
        totalRevenue3rdYear: totalRevenue3rdYear,
        totalRevenueAmtRec: totalRevenueAmtRec,
        gTotalTotal: gTotalTotal,
        gTotal1stYear: gTotal1stYear,
        gTotal2ndYear: gTotal2ndYear,
        gTotal3rdYear: totalRevenue3rdYear,
        gTotalAmtRec: gTotalAmtRec,
        formId: formId,
        uniquecode: 'GAP/${len! + 1}/' + entryDate.substring(0, 4),
          remarks:remarks,
        entryDate: entryDate,
        installmentNo: installmentNo,
      );
      // SPFormData formData=SPFormData(name: name, address: address, sponsorLetterReference: sponsorLetterReference, projectTitle: projectTitle, projectLeaders: projectLeaders, projectCoordinator: projectCoordinator, paymentAmount: paymentAmount, chequeDdNoEcs: chequeDdNoEcs, headOfAccount: headOfAccount, duration: duration, sponsorContribution: sponsorContribution, section: section, projectType: projectType, hos: hos, horg: horg, dated: dated, code: code, dateOfStart: dateOfStart, completionDate: completionDate, equipmentCapital: equipmentCapital, consumablesRawMaterialsComponent: consumablesRawMaterialsComponent, servicesUtilities: servicesUtilities, externalPayment: externalPayment, taDaContingencies: taDaContingencies, instituteInfrastructureFund: instituteInfrastructureFund, projectFollow: projectFollow, costOfMandays: costOfMandays, equipmentComputerUsage: equipmentComputerUsage, overhead: overhead, handlingCharges: handlingCharges, totalExpenses: totalExpenses, laboratoryShare: laboratoryShare, projectFee: projectFee, totalProjectCharge: totalProjectCharge, igst: igst, cgst: cgst, sgst: sgst, amountDeposited: amountDeposited, valueOfService: valueOfService, itTds: itTds,formId:formId,);
      _firestore.collection('gapForm').doc(formId).set(formData.toJson());

      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> cpFormUpload(
    String name,
    String address,
    String sponsorLetterReference,
    String projectTitle,
    String projectLeaders,
    String projectCoordinator,
    String paymentAmount,
    String chequeDdNoEcs,
    String headOfAccount,
    String duration,
    String sponsorContribution,
    String section,
    String projectType,
    String hos,
    String horg,
    String dated,
    String code,
    String dateOfStart,
    String completionDate,
    String equipmentCapital,
    String consumablesRawMaterialsComponent,
    String servicesUtilities,
    String externalPayment,
    String taDaContingencies,
    String instituteInfrastructureFund,
    String projectFollow,
    String costOfMandays,
    String equipmentComputerUsage,
    String overhead,
    String handlingCharges,
    String totalExpenses,
    String laboratoryShare,
    String projectFee,
    String totalProjectCharge,
    String igst,
    String cgst,
    String sgst,
    String amountDeposited,
    String valueOfService,
    String itTds,


      String contingencies,
      String totalOneToEight,
      String totalOneToFour,
      String totalOneToThree,
      String totalCostOfProject,
      String remarks,
      String igstPercentage,
      String cgstPercentage,
      String sgstPercentage,
      String installmentNo,
  ) async {
    String res = "some error occured";

    try {
      String formId = const Uuid().v1();
      String entryDate = new DateTime(new DateTime.now().year,
          new DateTime.now().month, new DateTime.now().day)
          .toString()
          .substring(0, 10);
      final collection = FirebaseFirestore.instance.collection("cpForm");
      final countQuery = collection.count();
      final AggregateQuerySnapshot snapshot = await countQuery.get();
      final len = snapshot.count;

      // debugPrint("Count: ${snapshot.count}");

      CPFormData formData = CPFormData(
        name: name,
        address: address,
        sponsorLetterReference: sponsorLetterReference,
        projectTitle: projectTitle,
        projectLeaders: projectLeaders,
        projectCoordinator: projectCoordinator,
        paymentAmount: paymentAmount,
        chequeDdNoEcs: chequeDdNoEcs,
        headOfAccount: headOfAccount,
        duration: duration,
        sponsorContribution: sponsorContribution,
        section: section,
        projectType: projectType,
        hos: hos,
        horg: horg,
        dated: dated,
        code: code,
        dateOfStart: dateOfStart,
        completionDate: completionDate,
        equipmentCapital: equipmentCapital,
        consumablesRawMaterialsComponent: consumablesRawMaterialsComponent,
        servicesUtilities: servicesUtilities,
        externalPayment: externalPayment,
        taDaContingencies: taDaContingencies,
        instituteInfrastructureFund: instituteInfrastructureFund,
        projectFollow: projectFollow,
        costOfMandays: costOfMandays,
        equipmentComputerUsage: equipmentComputerUsage,
        overhead: overhead,
        handlingCharges: handlingCharges,
        totalExpenses: totalExpenses,
        laboratoryShare: laboratoryShare,
        projectFee: projectFee,
        totalProjectCharge: totalProjectCharge,
        igst: igst,
        cgst: cgst,
        sgst: sgst,
        amountDeposited: amountDeposited,
        valueOfService: valueOfService,
        itTds: itTds,
        formId: formId,
        uniquecode: 'SP/${len! + 1}/' + entryDate.substring(0, 4),



        entryDate: entryDate,
        contingencies: contingencies,
        totalOneToEight: totalOneToEight,
        totalOneToFour: totalOneToFour,
        totalOneToThree: totalOneToThree,
        totalCostOfProject: totalCostOfProject,
        remarks: remarks,
        igstPercentage: igstPercentage,
        cgstPercentage: cgstPercentage,
        sgstPercentage: sgstPercentage,
        installmentNo: installmentNo,
      );
      _firestore.collection('cpForm').doc(formId).set(formData.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
