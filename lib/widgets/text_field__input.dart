import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/global_variables.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width<webScreenSize? MediaQuery.of(context).size.width: MediaQuery.of(context).size.width/4,
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
              hintText: hintText,
              border: inputBorder,
              focusedBorder: inputBorder,
              enabledBorder: inputBorder,
              filled: true,
              contentPadding: const EdgeInsets.all(8)),
          keyboardType: textInputType,
          obscureText: isPass,
        ),
      ),
    );
  }
}
