


// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String email;
  final String empid;
  final String department;
  final String firstname;
  final String middlename ;
  final   String lastname ;
  final String mobileno;

  const User({
    required this.email,

    required this.empid,
    required this.department,
    required this.firstname,
     this.middlename="",
     this.lastname="",
    required this.mobileno,

  });
  Map<String,dynamic>toJson()=>{
    "email":email,

    "empid":empid,
    "department":department,
    "firstname":firstname,
    "middlename":middlename,
    "lastname":lastname,
    "mobileno":mobileno,

  };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;
    return User(
      email: snapshot['email'],

      empid: snapshot['empid'],
      department: snapshot['department'],
      firstname: snapshot['firstname'],
      middlename: snapshot['middlename'],
      lastname: snapshot['lastname'],
      mobileno: snapshot['mobileno'],

    );
  }
}