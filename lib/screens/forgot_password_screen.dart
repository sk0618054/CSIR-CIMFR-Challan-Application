import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/otpverificationpage.dart';
import 'package:flutter_application_2/utils/utils.dart';

import '../widgets/text_field__input.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verificationId;

  Future forgotPassword({required String email}) async {
    try {

      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (err) {
      throw Exception(err.message.toString());
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  void _sendOTP() async {
    String phone = phoneController.text.trim();
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-completion feature for Android
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message!)));
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPVerificationPage(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future forgotPasswordByPhone({required String phone}) async {
    try {
      // await _firebaseAuth.sendPasswordResetEmail(email: email);
      // await _firebaseAuth.
    } on FirebaseAuthException catch (err) {
      throw Exception(err.message.toString());
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Handle the form submission logic
      final email = emailController.text;
      final phone = phoneController.text;
      if(email!=""){
        print("email is in");
        forgotPassword(email: email);
        showSnackBar("please check your email", context);
        Navigator.pop(context);

      }else if(phone!=""){
        _sendOTP();
        print("phone is in");
      }
      print('Email: $email');
      print('Phone: $phone');
      // Add your forgot password logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              TextFieldInput(textEditingController: emailController,hintText: "Email id", textInputType: TextInputType.emailAddress,),
              Text(
                "Or",
                style: TextStyle(fontSize: 15),

              ),
              TextFieldInput(textEditingController: phoneController,hintText: "Mob no", textInputType: TextInputType.phone,),

              // TextFormField(
              //   controller: emailController,
              //   decoration: InputDecoration(
              //     labelText: 'Email',
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty && phoneController.text.isEmpty) {
              //       return 'Please enter email or phone number';
              //     }
              //     return null;
              //   },
              // ),
              // Text(
              //   "Or",
              //   style: TextStyle(fontSize: 20),
              //
              // ),
              // TextFormField(
              //   controller: phoneController,
              //   decoration: InputDecoration(
              //     labelText: 'Phone Number',
              //
              //   ),
              //   validator: (value) {
              //     if (value!.isEmpty && emailController.text.isEmpty) {
              //       return 'Please enter email or phone number';
              //     }
              //     return null;
              //   },
              // ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}