import 'package:flutter/material.dart';
import 'package:flutter_application_2/resources/auth_methods.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/signup_screen.dart';
import 'package:flutter_application_2/utils/utils.dart';
import 'package:flutter_application_2/widgets/text_field__input.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/resonsive_layout.dart';
import '../responsive/web_screen_layout.dart';
import '../utils/global_variables.dart';
import '../widgets/logo.dart';
import 'forgot_password_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _emailId = TextEditingController();
  bool _isLoding = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _password.dispose();
    _emailId.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoding = true;
    });
    String res = await AuthMethods()
        .loginUser(email: _emailId.text, password: _password.text);
    if (res == "success") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              )));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoding = false;
    });
  }

  void navigateToSignUp() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => const SignUpPage()));
  }

  void navigateToForgot() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              LogoImage(),
              SizedBox(
                height: 200,
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
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width<webScreenSize? MediaQuery.of(context).size.width: MediaQuery.of(context).size.width/4,
                  child: InkWell(
                    onTap: loginUser,
                    child: Container(
                      child: _isLoding
                          ? Center(
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text("Log in"),
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
                    child: const Text("Don't have an account ? "),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: navigateToSignUp,
                    child: Container(
                      child: const Text(
                        "Sign up.",
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: navigateToForgot,
                    child: Container(
                      child: const Text(
                        "Forgot Password?",
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
    ));
  }
}
