import 'package:cloud_firestore/cloud_firestore.dart';

class GAPFormData {
  final String name;
  final String address;
  final String sponsorLetterRef;
  final String projectTitle;
  final String projectLeader;
  final String projectCoordinator;
  final String paymentAmount;
  final String cheque;
  final String headOfAccount;
  final String duration;
  final String sponsorContribution;
  final String section;
  final String projectType;
  final String hos;
  final String horg;
  final String dated;
  final String code;
  final String startDate;
  final String completionDate;

  // Financial Fields
  final String landBuildingTotal;
  final String landBuilding1stYear;
  final String landBuilding2ndYear;
  final String landBuilding3rdYear;
  final String landBuildingAmtRec;
  final String equipmentTotal;
  final String equipment1stYear;
  final String equipment2ndYear;
  final String equipment3rdYear;
  final String equipmentAmtRec;
  final String totalCapitalTotal;
  final String totalCapital1stYear;
  final String totalCapital2ndYear;
  final String totalCapital3rdYear;
  final String totalCapitalAmtRec;
  final String personnelTotal;
  final String personnel1stYear;
  final String personnel2ndYear;
  final String personnel3rdYear;
  final String personnelAmtRec;
  final String consumablesTotal;
  final String consumables1stYear;
  final String consumables2ndYear;
  final String consumables3rdYear;
  final String consumablesAmtRec;
  final String travelsTotal;
  final String travels1stYear;
  final String travels2ndYear;
  final String travels3rdYear;
  final String travelsAmtRec;
  final String contingencyTotal;
  final String contingency1stYear;
  final String contingency2ndYear;
  final String contingency3rdYear;
  final String contingencyAmtRec;
  final String overheadsTotal;
  final String overheads1stYear;
  final String overheads2ndYear;
  final String overheads3rdYear;
  final String overheadsAmtRec;
  final String devMaintTotal;
  final String devMaint1stYear;
  final String devMaint2ndYear;
  final String devMaint3rdYear;
  final String devMaintAmtRec;
  final String testingTotal;
  final String testing1stYear;
  final String testing2ndYear;
  final String testing3rdYear;
  final String testingAmtRec;
  final String totalRevenueTotal;
  final String totalRevenue1stYear;
  final String totalRevenue2ndYear;
  final String totalRevenue3rdYear;
  final String totalRevenueAmtRec;
  final String gTotalTotal;
  final String gTotal1stYear;
  final String gTotal2ndYear;
  final String gTotal3rdYear;
  final String gTotalAmtRec;
  final String formId;
  final String uniquecode;
  final String remarks;
  final String installmentNo;
  final String entryDate;
  GAPFormData({
    this.name = '',
    this.address = '',
    this.sponsorLetterRef = '',
    this.projectTitle = '',
    this.projectLeader = '',
    this.projectCoordinator = '',
    this.paymentAmount = '',
    this.cheque = '',
    this.headOfAccount = '',
    this.duration = '',
    this.sponsorContribution = '',
    this.section = '',
    this.projectType = '',
    this.hos = '',
    this.horg = '',
    this.dated = '',
    this.code = '',
    this.startDate = '',
    this.completionDate = '',

    // Financial Fields
    this.landBuildingTotal = '',
    this.landBuilding1stYear = '',
    this.landBuilding2ndYear = '',
    this.landBuilding3rdYear = '',
    this.landBuildingAmtRec = '',
    this.equipmentTotal = '',
    this.equipment1stYear = '',
    this.equipment2ndYear = '',
    this.equipment3rdYear = '',
    this.equipmentAmtRec = '',
    this.totalCapitalTotal = '',
    this.totalCapital1stYear = '',
    this.totalCapital2ndYear = '',
    this.totalCapital3rdYear = '',
    this.totalCapitalAmtRec = '',
    this.personnelTotal = '',
    this.personnel1stYear = '',
    this.personnel2ndYear = '',
    this.personnel3rdYear = '',
    this.personnelAmtRec = '',
    this.consumablesTotal = '',
    this.consumables1stYear = '',
    this.consumables2ndYear = '',
    this.consumables3rdYear = '',
    this.consumablesAmtRec = '',
    this.travelsTotal = '',
    this.travels1stYear = '',
    this.travels2ndYear = '',
    this.travels3rdYear = '',
    this.travelsAmtRec = '',
    this.contingencyTotal = '',
    this.contingency1stYear = '',
    this.contingency2ndYear = '',
    this.contingency3rdYear = '',
    this.contingencyAmtRec = '',
    this.overheadsTotal = '',
    this.overheads1stYear = '',
    this.overheads2ndYear = '',
    this.overheads3rdYear = '',
    this.overheadsAmtRec = '',
    this.devMaintTotal = '',
    this.devMaint1stYear = '',
    this.devMaint2ndYear = '',
    this.devMaint3rdYear = '',
    this.devMaintAmtRec = '',
    this.testingTotal = '',
    this.testing1stYear = '',
    this.testing2ndYear = '',
    this.testing3rdYear = '',
    this.testingAmtRec = '',
    this.totalRevenueTotal = '',
    this.totalRevenue1stYear = '',
    this.totalRevenue2ndYear = '',
    this.totalRevenue3rdYear = '',
    this.totalRevenueAmtRec = '',
    this.gTotalTotal = '',
    this.gTotal1stYear = '',
    this.gTotal2ndYear = '',
    this.gTotal3rdYear = '',
    this.gTotalAmtRec = '',
    required this.formId,
    this.uniquecode='',
    this.remarks='',
    this.entryDate='',
    this.installmentNo='',
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "sponsorLetterRef": sponsorLetterRef,
      "projectTitle": projectTitle,
      "projectLeader": projectLeader,
      "projectCoordinator": projectCoordinator,
      "paymentAmount": paymentAmount,
      "cheque": cheque,
      "headOfAccount": headOfAccount,
      "duration": duration,
      "sponsorContribution": sponsorContribution,
      "section": section,
      "projectType": projectType,
      "hos": hos,
      "horg": horg,
      "dated": dated,
      "code": code,
      "startDate": startDate,
      "completionDate": completionDate,
      "landBuildingTotal": landBuildingTotal,
      "landBuilding1stYear": landBuilding1stYear,
      "landBuilding2ndYear": landBuilding2ndYear,
      "landBuilding3rdYear": landBuilding3rdYear,
      "landBuildingAmtRec": landBuildingAmtRec,
      "equipmentTotal": equipmentTotal,
      "equipment1stYear": equipment1stYear,
      "equipment2ndYear": equipment2ndYear,
      "equipment3rdYear": equipment3rdYear,
      "equipmentAmtRec": equipmentAmtRec,
      "totalCapitalTotal": totalCapitalTotal,
      "totalCapital1stYear": totalCapital1stYear,
      "totalCapital2ndYear": totalCapital2ndYear,
      "totalCapital3rdYear": totalCapital3rdYear,
      "totalCapitalAmtRec": totalCapitalAmtRec,
      "personnelTotal": personnelTotal,
      "personnel1stYear": personnel1stYear,
      "personnel2ndYear": personnel2ndYear,
      "personnel3rdYear": personnel3rdYear,
      "personnelAmtRec": personnelAmtRec,
      "consumablesTotal": consumablesTotal,
      "consumables1stYear": consumables1stYear,
      "consumables2ndYear": consumables2ndYear,
      "consumables3rdYear": consumables3rdYear,
      "consumablesAmtRec": consumablesAmtRec,
      "travelsTotal": travelsTotal,
      "travels1stYear": travels1stYear,
      "travels2ndYear": travels2ndYear,
      "travels3rdYear": travels3rdYear,
      "travelsAmtRec": travelsAmtRec,
      "contingencyTotal": contingencyTotal,
      "contingency1stYear": contingency1stYear,
      "contingency2ndYear": contingency2ndYear,
      "contingency3rdYear": contingency3rdYear,
      "contingencyAmtRec": contingencyAmtRec,
      "overheadsTotal": overheadsTotal,
      "overheads1stYear": overheads1stYear,
      "overheads2ndYear": overheads2ndYear,
      "overheads3rdYear": overheads3rdYear,
      "overheadsAmtRec": overheadsAmtRec,
      "devMaintTotal": devMaintTotal,
      "devMaint1stYear": devMaint1stYear,
      "devMaint2ndYear": devMaint2ndYear,
      "devMaint3rdYear": devMaint3rdYear,
      "devMaintAmtRec": devMaintAmtRec,
      "testingTotal": testingTotal,
      "testing1stYear": testing1stYear,
      "testing2ndYear": testing2ndYear,
      "testing3rdYear": testing3rdYear,
      "testingAmtRec": testingAmtRec,
      "totalRevenueTotal": totalRevenueTotal,
      "totalRevenue1stYear": totalRevenue1stYear,
      "totalRevenue2ndYear": totalRevenue2ndYear,
      "totalRevenue3rdYear": totalRevenue3rdYear,
      "totalRevenueAmtRec": totalRevenueAmtRec,
      "gTotalTotal": gTotalTotal,
      "gTotal1stYear": gTotal1stYear,
      "gTotal2ndYear": gTotal2ndYear,
      "gTotal3rdYear": gTotal3rdYear,
      "gTotalAmtRec": gTotalAmtRec,
      "formId":formId,
      "uniquecode":uniquecode,
      "remarks":remarks,
      "entryDate":entryDate,
      "installmentNo":installmentNo,
    };
  }

  static GAPFormData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return GAPFormData(
      name: snapshot['name'],
      address: snapshot['address'],
      sponsorLetterRef: snapshot['sponsorLetterRef'],
      projectTitle: snapshot['projectTitle'],
      projectLeader: snapshot['projectLeader'],
      projectCoordinator: snapshot['projectCoordinator'],
      paymentAmount: snapshot['paymentAmount'],
      cheque: snapshot['cheque'],
      headOfAccount: snapshot['headOfAccount'],
      duration: snapshot['duration'],
      sponsorContribution: snapshot['sponsorContribution'],
      section: snapshot['section'],
      projectType: snapshot['projectType'],
      hos: snapshot['hos'],
      horg: snapshot['horg'],
      dated: snapshot['dated'],
      code: snapshot['code'],
      startDate: snapshot['startDate'],
      completionDate: snapshot['completionDate'],
      landBuildingTotal: snapshot['landBuildingTotal'],
      landBuilding1stYear: snapshot['landBuilding1stYear'],
      landBuilding2ndYear: snapshot['landBuilding2ndYear'],
      landBuilding3rdYear: snapshot['landBuilding3rdYear'],
      landBuildingAmtRec: snapshot['landBuildingAmtRec'],
      equipmentTotal: snapshot['equipmentTotal'],
      equipment1stYear: snapshot['equipment1stYear'],
      equipment2ndYear: snapshot['equipment2ndYear'],
      equipment3rdYear: snapshot['equipment3rdYear'],
      equipmentAmtRec: snapshot['equipmentAmtRec'],
      totalCapitalTotal: snapshot['totalCapitalTotal'],
      totalCapital1stYear: snapshot['totalCapital1stYear'],
      totalCapital2ndYear: snapshot['totalCapital2ndYear'],
      totalCapital3rdYear: snapshot['totalCapital3rdYear'],
      totalCapitalAmtRec: snapshot['totalCapitalAmtRec'],
      personnelTotal: snapshot['personnelTotal'],
      personnel1stYear: snapshot['personnel1stYear'],
      personnel2ndYear: snapshot['personnel2ndYear'],
      personnel3rdYear: snapshot['personnel3rdYear'],
      personnelAmtRec: snapshot['personnelAmtRec'],
      consumablesTotal: snapshot['consumablesTotal'],
      consumables1stYear: snapshot['consumables1stYear'],
      consumables2ndYear: snapshot['consumables2ndYear'],
      consumables3rdYear: snapshot['consumables3rdYear'],
      consumablesAmtRec: snapshot['consumablesAmtRec'],
      travelsTotal: snapshot['travelsTotal'],
      travels1stYear: snapshot['travels1stYear'],
      travels2ndYear: snapshot['travels2ndYear'],
      travels3rdYear: snapshot['travels3rdYear'],
      travelsAmtRec: snapshot['travelsAmtRec'],
      contingencyTotal: snapshot['contingencyTotal'],
      contingency1stYear: snapshot['contingency1stYear'],
      contingency2ndYear: snapshot['contingency2ndYear'],
      contingency3rdYear: snapshot['contingency3rdYear'],
      contingencyAmtRec: snapshot['contingencyAmtRec'],
      overheadsTotal: snapshot['overheadsTotal'],
      overheads1stYear: snapshot['overheads1stYear'],
      overheads2ndYear: snapshot['overheads2ndYear'],
      overheads3rdYear: snapshot['overheads3rdYear'],
      overheadsAmtRec: snapshot['overheadsAmtRec'],
      devMaintTotal: snapshot['devMaintTotal'],
      devMaint1stYear: snapshot['devMaint1stYear'],
      devMaint2ndYear: snapshot['devMaint2ndYear'],
      devMaint3rdYear: snapshot['devMaint3rdYear'],
      devMaintAmtRec: snapshot['devMaintAmtRec'],
      testingTotal: snapshot['testingTotal'],
      testing1stYear: snapshot['testing1stYear'],
      testing2ndYear: snapshot['testing2ndYear'],
      testing3rdYear: snapshot['testing3rdYear'],
      testingAmtRec: snapshot['testingAmtRec'],
      totalRevenueTotal: snapshot['totalRevenueTotal'],
      totalRevenue1stYear: snapshot['totalRevenue1stYear'],
      totalRevenue2ndYear: snapshot['totalRevenue2ndYear'],
      totalRevenue3rdYear: snapshot['totalRevenue3rdYear'],
      totalRevenueAmtRec: snapshot['totalRevenueAmtRec'],
      gTotalTotal: snapshot['gTotalTotal'],
      gTotal1stYear: snapshot['gTotal1stYear'],
      gTotal2ndYear: snapshot['gTotal2ndYear'],
      gTotal3rdYear: snapshot['gTotal3rdYear'],
      gTotalAmtRec: snapshot['gTotalAmtRec'],
      formId: snapshot['formId'],
      uniquecode:snapshot['uniquecode'],
        remarks:snapshot['remarks'],
      entryDate: snapshot['entryDate'],
      installmentNo: snapshot['installmentNo'],
    );
  }


}
