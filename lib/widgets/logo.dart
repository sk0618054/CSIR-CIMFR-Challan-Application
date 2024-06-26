import 'package:flutter/material.dart';

import '../utils/global_variables.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png",fit: BoxFit.contain,
          width:MediaQuery.of(context).size.width>webScreenSize?  MediaQuery.of(context).size.width*0.6:MediaQuery.of(context).size.width*0.8,

        ),

      ],
    );
  }
}
