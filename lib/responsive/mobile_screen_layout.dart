import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/home_screen.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String firstname="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  void getName()async{
    DocumentSnapshot snap =await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();

    setState(() {
      firstname=(snap.data() as Map<String,dynamic>)['firstname'];
      print(snap.data());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Please open in full screen'+'$firstname'),
      ),
    );
  }
}
