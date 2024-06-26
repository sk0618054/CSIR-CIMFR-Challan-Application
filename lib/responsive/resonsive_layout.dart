import 'package:flutter/material.dart';


import 'package:flutter_application_2/utils/global_variables.dart';class ResponsiveLayout extends StatefulWidget {

  final Widget webScreenLayout;
  final Widget mobileScreenLayout;


  const ResponsiveLayout({super.key,required this.webScreenLayout,required this.mobileScreenLayout});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // addData();
  }

  // addData()async{
  //   User
  // }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints) {
      if(constraints.maxWidth>webScreenSize){
        return widget.webScreenLayout;
      }
      return widget.webScreenLayout;
    });
  }
}
