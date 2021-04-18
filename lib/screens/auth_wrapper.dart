import 'package:chop_chop_flutter/models/user_account.dart';
import 'package:chop_chop_flutter/pages/home_page.dart';
import 'package:chop_chop_flutter/screens/access/onboarding_page.dart';
import 'package:chop_chop_flutter/screens/access/sign_up/enter_phone_number.dart';
import 'package:chop_chop_flutter/screens/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User myUser = context.watch<User>();
    if(myUser != null){ //Signed In
      if(myUser.phoneNumber == null){
        return EnterNumberPage();
      } else {
        return HomePage();
      }
    } else { //Not Signed in
      return OnboardingPage();
    }
  }
}