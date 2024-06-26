import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails()async{
    User currentUser=_auth.currentUser!;
    DocumentSnapshot snap=await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String confirmpassword,
    required String empid,
    required String department,
    required String firstname,
    String middlename = "",
    String lastname = "",
    required String mobileno,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          confirmpassword.isNotEmpty ||
          empid.isNotEmpty ||
          department.isNotEmpty ||
          firstname.isNotEmpty ||
          mobileno.isNotEmpty ||
          password != confirmpassword) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        // _firestore.collection("users").doc(cred.user!.uid).set({
        //   'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'following': [],
        // });
        model.User user =model.User(email: email, empid: empid, department: department, firstname: firstname, mobileno: mobileno);
        _firestore.collection("users").doc(cred.user!.uid).set(user.toJson());

        // _firestore.collection("users").doc(cred.user!.uid).set({
        //   'firstname': firstname,
        //   'middlename': middlename,
        //   'lastname': lastname,
        //   'mobileno': mobileno,
        //   'department': department,
        //   'empid': empid,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'challan': [],
        // });

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter allthe fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
