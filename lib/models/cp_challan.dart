import 'package:cloud_firestore/cloud_firestore.dart';

class CPFormData {
  final String name;
  final String address;
  final String sponsorLetterReference;
  final String projectTitle;
  final String projectLeaders;
  final String projectCoordinator;
  final String paymentAmount;
  final String chequeDdNoEcs;
  final String headOfAccount;
  final String duration;
  final String sponsorContribution;
  final String section;
  final String projectType;
  final String hos;
  final String horg;
  final String dated;
  final String code;
  final String dateOfStart;
  final String completionDate;
  final String equipmentCapital;
  final String consumablesRawMaterialsComponent;
  final String servicesUtilities;
  final String externalPayment;
  final String taDaContingencies;
  final String instituteInfrastructureFund;
  final String projectFollow;
  final String costOfMandays;
  final String equipmentComputerUsage;
  final String overhead;
  final String handlingCharges;
  final String totalExpenses;
  final String laboratoryShare;
  final String projectFee;
  final String totalProjectCharge;
  final String igst;
  final String cgst;
  final String sgst;
  final String amountDeposited;
  final String valueOfService;
  final String itTds;
  final String formId;
  final String uniquecode;
  final String entryDate;

  final String contingencies;
  final String totalOneToEight;
  final String totalOneToFour;
  final String totalOneToThree;
  final String totalCostOfProject;
  final String remarks;
  final String igstPercentage;
  final String cgstPercentage;
  final String sgstPercentage;
  final String installmentNo;

  CPFormData({
    this.name = "",
    this.address = "",
    this.sponsorLetterReference = "",
    this.projectTitle = "",
    this.projectLeaders = "",
    this.projectCoordinator = "",
    this.paymentAmount = "",
    this.chequeDdNoEcs = "",
    this.headOfAccount = "",
    this.duration = "",
    this.sponsorContribution = "",
    this.section = "",
    this.projectType = "",
    this.hos = "",
    this.horg = "",
    this.dated = "",
    this.code = "",
    this.dateOfStart = "",
    this.completionDate = "",
    this.equipmentCapital = "",
    this.consumablesRawMaterialsComponent = "",
    this.servicesUtilities = "",
    this.externalPayment = "",
    this.taDaContingencies = "",
    this.instituteInfrastructureFund = "",
    this.projectFollow = "",
    this.costOfMandays = "",
    this.equipmentComputerUsage = "",
    this.overhead = "",
    this.handlingCharges = "",
    this.totalExpenses = "",
    this.laboratoryShare = "",
    this.projectFee = "",
    this.totalProjectCharge = "",
    this.igst = "",
    this.cgst = "",
    this.sgst = "",
    this.amountDeposited = "",
    this.valueOfService = "",
    this.itTds = "",
    required this.formId,
    this.uniquecode="",
    this.entryDate="",


    this.contingencies="",
    this.totalOneToEight="",
    this.totalOneToFour="",
    this.totalOneToThree="",
    this.totalCostOfProject="",
    this.remarks="",
    this.igstPercentage="",
    this.cgstPercentage="",
    this.sgstPercentage="",
    this.installmentNo="",
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "sponsorLetterReference": sponsorLetterReference,
    "projectTitle": projectTitle,
    "projectLeaders": projectLeaders,
    "projectCoordinator": projectCoordinator,
    "paymentAmount": paymentAmount,
    "chequeDdNoEcs": chequeDdNoEcs,
    "headOfAccount": headOfAccount,
    "duration": duration,
    "sponsorContribution": sponsorContribution,
    "section": section,
    "projectType": projectType,
    "hos": hos,
    "horg": horg,
    "dated": dated,
    "code": code,
    "dateOfStart": dateOfStart,
    "completionDate": completionDate,
    "equipmentCapital": equipmentCapital,
    "consumablesRawMaterialsComponent": consumablesRawMaterialsComponent,
    "servicesUtilities": servicesUtilities,
    "externalPayment": externalPayment,
    "taDaContingencies": taDaContingencies,
    "instituteInfrastructureFund": instituteInfrastructureFund,
    "projectFollow": projectFollow,
    "costOfMandays": costOfMandays,
    "equipmentComputerUsage": equipmentComputerUsage,
    "overhead": overhead,
    "handlingCharges": handlingCharges,
    "totalExpenses": totalExpenses,
    "laboratoryShare": laboratoryShare,
    "projectFee": projectFee,
    "totalProjectCharge": totalProjectCharge,
    "igst": igst,
    "cgst": cgst,
    "sgst": sgst,
    "amountDeposited": amountDeposited,
    "valueOfService": valueOfService,
    "itTds": itTds,
    "formId":formId,
    "uniquecode":uniquecode,
    "entryDate":entryDate,

    "contingencies": contingencies,
    "totalOneToEight": totalOneToEight,
    "totalOneToFour": totalOneToFour,
    "totalOneToThree": totalOneToThree,
    "totalCostOfProject": totalCostOfProject,
    "remarks": remarks,
    "igstPercentage": igstPercentage,
    "cgstPercentage":cgstPercentage,
    "sgstPercentage":sgstPercentage,
    "installmentNo":installmentNo,
  };

  static CPFormData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CPFormData(
      name: snapshot['name'],
      address: snapshot['address'],
      sponsorLetterReference: snapshot['sponsorLetterReference'],
      projectTitle: snapshot['projectTitle'],
      projectLeaders: snapshot['projectLeaders'],
      projectCoordinator: snapshot['projectCoordinator'],
      paymentAmount: snapshot['paymentAmount'],
      chequeDdNoEcs: snapshot['chequeDdNoEcs'],
      headOfAccount: snapshot['headOfAccount'],
      duration: snapshot['duration'],
      sponsorContribution: snapshot['sponsorContribution'],
      section: snapshot['section'],
      projectType: snapshot['projectType'],
      hos: snapshot['hos'],
      horg: snapshot['horg'],
      dated: snapshot['dated'],
      code: snapshot['code'],
      dateOfStart: snapshot['dateOfStart'],
      completionDate: snapshot['completionDate'],
      equipmentCapital: snapshot['equipmentCapital'],
      consumablesRawMaterialsComponent: snapshot['consumablesRawMaterialsComponent'],
      servicesUtilities: snapshot['servicesUtilities'],
      externalPayment: snapshot['externalPayment'],
      taDaContingencies: snapshot['taDaContingencies'],
      instituteInfrastructureFund: snapshot['instituteInfrastructureFund'],
      projectFollow: snapshot['projectFollow'],
      costOfMandays: snapshot['costOfMandays'],
      equipmentComputerUsage: snapshot['equipmentComputerUsage'],
      overhead: snapshot['overhead'],
      handlingCharges: snapshot['handlingCharges'],
      totalExpenses: snapshot['totalExpenses'],
      laboratoryShare: snapshot['laboratoryShare'],
      projectFee: snapshot['projectFee'],
      totalProjectCharge: snapshot['totalProjectCharge'],
      igst: snapshot['igst'],
      cgst: snapshot['cgst'],
      sgst: snapshot['sgst'],
      amountDeposited: snapshot['amountDeposited'],
      valueOfService: snapshot['valueOfService'],
      itTds: snapshot['itTds'],
      formId:snapshot['formId'],
      uniquecode:snapshot['uniquecode'],
      entryDate:snapshot['entryDate'],

      contingencies: snapshot['contingencies'],
      totalOneToEight: snapshot['totalOneToEight'],
      totalOneToFour: snapshot['totalOneToFour'],
      totalOneToThree: snapshot['totalOneToThree'],
      totalCostOfProject: snapshot['totalCostOfProject'],
      remarks: snapshot['remarks'],
      igstPercentage: snapshot['igstPercentage'],
      cgstPercentage:snapshot['cgstPercentage'],
      sgstPercentage:snapshot['sgstPercentage'],
      installmentNo:snapshot['installmentNo'],

    );
  }
}
