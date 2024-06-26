// lib/screens/home_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/cp_form_screen.dart';
import 'package:flutter_application_2/screens/cp_viewAllForm_screen.dart';
import 'package:flutter_application_2/screens/login_screen.dart';
import 'package:flutter_application_2/screens/sp_form_screen.dart';
import 'package:flutter_application_2/screens/sp_viewAllForm_screen.dart';

import '../utils/global_variables.dart';
import '../widgets/logo.dart';
import 'gap_form_screen.dart';
import 'gap_viewAllForm_screen.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LogoImage(),
            SizedBox(
              height: 140,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.all(MediaQuery.of(context).size.width>webScreenSize?16.0:3.0),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(MediaQuery.of(context).size.width>webScreenSize?16.0:3.0),
                        child: Container(
                          child: Row(
                            children: [
                              Text("Sponsored Project"),
                              SizedBox(
                                height: 16,
                                width: MediaQuery.of(context).size.width>webScreenSize?100:50,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SPFormPage()),
                                    );
                                  },
                                  child: Text("New")),
                              SizedBox(
                                height: 16,
                                width: MediaQuery.of(context).size.width>webScreenSize?100:20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => AllFormViewPage()),
                                    );
                                  },
                                  child: Text("View")),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(MediaQuery.of(context).size.width>webScreenSize?16.0:3.0),
                        child: Container(
                          child: Row(
                            children: [
                              Text("Grant-Aid Projects"),
                              SizedBox(
                                height: 16,
                                width: MediaQuery.of(context).size.width>webScreenSize?100:50,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyForm()),
                                    );
                                  },
                                  child: Text("New")),
                              SizedBox(
                                height: 16,
                                width: MediaQuery.of(context).size.width>webScreenSize?100:20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => GAPAllFormViewPage()),
                                    );
                                  },
                                  child: Text("View")),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(MediaQuery.of(context).size.width>webScreenSize?16.0:3.0),
                        child: Container(
                          child: Row(
                            children: [
                              Text("Consultancy Projects"),
                              SizedBox(
                                height: 16,
                                width: MediaQuery.of(context).size.width>webScreenSize?85:43,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CPFormPage()),
                                    );
                                  },
                                  child: Text("New")),
                              SizedBox(
                                height: 16,
                                width: MediaQuery.of(context).size.width>webScreenSize?100:20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CPAllFormViewPage()),
                                    );
                                  },
                                  child: Text("View")),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      ElevatedButton(
                        child: Text('logged out'),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          await FirebaseAuth.instance.currentUser;
                          //print('$user');
                          runApp(new MaterialApp(
                            debugShowCheckedModeBanner: false,
                            home: new LoginPage(),
                          ));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
