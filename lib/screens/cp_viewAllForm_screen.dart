import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/resources/firestore_method.dart';
import 'package:flutter_application_2/screens/cp_individual_form_view_screen.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/print_try_cp.dart';
import 'package:flutter_application_2/screens/sp_individual_form_view_screen.dart';

import '../models/sp_challan.dart';

class CPAllFormViewPage extends StatefulWidget {

  @override
  State<CPAllFormViewPage> createState() => _CPAllFormViewPageState();
}

class _CPAllFormViewPageState extends State<CPAllFormViewPage> {
  var allForm=[];
  bool _isLoding = false;
  bool _isSearching = false;
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;

  void fetchAllForm() async{
    setState(() {
      _isLoding=true;
    });
    QuerySnapshot<Map<String, dynamic>> querySnapshot =await FirebaseFirestore.instance.collection('cpForm').get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    setState(() {
      allForm=allData;
      _isLoding=false;
    });
    // var obj=tt[0];
    print(allForm[0]  );

  }


  // Map<String,dynamic> change(){
  //
  // }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllForm();
  }
  final String s="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextFormField(
          controller: searchController,
          decoration: const InputDecoration(labelText: 'Search for a challan'),
          onFieldSubmitted: (String _) {
            setState(() {
              isShowUsers = true;
            });
          },
        ) : Text('All CP Challan'),

        actions: <Widget>[
          _isSearching
              ? IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                isShowUsers=false;
                _isSearching = false;
                // _searchQueryController.clear();
              });
            },
          )
              : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = true;
              });
            },
          ),
        ],
        bottom:_isLoding? PreferredSize(
            preferredSize: Size(double.infinity, 4.0),
            child: SizedBox(
                height: 4.0,
                child: LinearProgressIndicator()
            )
        ):null,
      ),
      body:isShowUsers
          ? FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('cpForm')
            .where('name',
            isGreaterThanOrEqualTo: searchController.text)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title:Text('${(snapshot.data! as dynamic).docs[index]['uniquecode']}'),
                subtitle: Text('${(snapshot.data! as dynamic).docs[index]['name']}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CPFormDataViewPrint(formId: allForm[index]['formId'],)
                      )
                  );
                },
                // title: Text((snapshot.data! as dynamic).docs[index]['username']),
              );
            },
          );
        },
      ): ListView.builder(
        itemCount: allForm.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${allForm[index]['uniquecode']}'),
            subtitle: Text('${allForm[index]['name']}'),

            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CPFormDataViewPrint(formId: allForm[index]['formId'],)
                  )
              );
            },
          );
        },
      ),
    );
  }
}

