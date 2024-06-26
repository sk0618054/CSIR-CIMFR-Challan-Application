// lib/screens/sign_up_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/resources/auth_methods.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/login_screen.dart';
import 'package:flutter_application_2/utils/utils.dart';
import 'package:flutter_application_2/widgets/text_field__input.dart';

import '../utils/global_variables.dart';
import '../widgets/logo.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _middleName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _empId = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _emailId = TextEditingController();
  TextEditingController _mobileNo = TextEditingController();
  TextEditingController _departmentName = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  bool _isLoding = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailId.dispose();
    _password.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoding = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailId.text,
        password: _password.text,
        confirmpassword: _confirmPassword.text,
        empid: _empId.text,
        department: _departmentName.text,
        firstname: _firstName.text,
        middlename: _middleName.text,
        lastname: _lastName.text,
        mobileno: _mobileNo.text);
    if (res != "success") {
      showSnackBar(res, context);
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      _isLoding = false;
    });
  }

  void navigateToLogin() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              LogoImage(),
              SizedBox(
                height: 24,
              ),
              TextFieldInput(
                  textEditingController: _firstName,
                  hintText: "First name",
                  textInputType: TextInputType.name),
              SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  textEditingController: _middleName,
                  hintText: "Middle name",
                  textInputType: TextInputType.name),
              SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  textEditingController: _lastName,
                  hintText: "Last name",
                  textInputType: TextInputType.name),
              SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  textEditingController: _empId,
                  hintText: "Emp id",
                  textInputType: TextInputType.name),
              SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  textEditingController: _mobileNo,
                  hintText: "Mob no",
                  textInputType: TextInputType.phone),
              SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  textEditingController: _departmentName,
                  hintText: "Department Name",
                  textInputType: TextInputType.text),
              SizedBox(
                height: 16,
              ),
              TextFieldInput(
                  textEditingController: _emailId,
                  hintText: "Email id",
                  textInputType: TextInputType.text),
              SizedBox(
                height: 16,
              ),
              TextFieldInput(
                textEditingController: _password,
                hintText: "Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 16,
              ),
              TextFieldInput(
                textEditingController: _confirmPassword,
                hintText: "Confirm password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width<webScreenSize? MediaQuery.of(context).size.width: MediaQuery.of(context).size.width/4,

                  child: InkWell(
                    onTap: signUpUser,
                    child: Container(
                      child: _isLoding
                          ? Center(
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text("Sign up"),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Have an accout?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      child: const Text(
                        "Login.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
