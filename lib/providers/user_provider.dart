

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/resources/auth_methods.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_application_2/models/user.dart';

class UserProvider with ChangeNotifier{
  User? _user;
  final AuthMethods _authMethods=AuthMethods();
  User get getUser =>_user!;
  Future<void> refershUser() async{
    User user =await _authMethods.getUserDetails();
    _user=user;
    notifyListeners();
  }


}