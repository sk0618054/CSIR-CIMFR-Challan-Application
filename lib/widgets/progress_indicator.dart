import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/global_variables.dart';

class ProgressIndicatorBar extends StatelessWidget {

  const ProgressIndicatorBar(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return  PreferredSize(
        preferredSize: Size(double.infinity, 4.0),
        child: SizedBox(
            height: 4.0,
            child: LinearProgressIndicator()
        )
    );
  }
}
