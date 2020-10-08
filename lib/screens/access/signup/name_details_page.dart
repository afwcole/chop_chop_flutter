import 'package:chop_chop_flutter/pages/home_page.dart';
import 'package:chop_chop_flutter/screens/services/auth.dart';
import 'package:chop_chop_flutter/screens/shared/big_title.dart';
import 'package:chop_chop_flutter/screens/shared/call_to_action_button.dart';
import 'package:chop_chop_flutter/screens/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NameDetailsPage extends StatefulWidget {
  @override
  _NameDetailsPageState createState() => _NameDetailsPageState();
}

class _NameDetailsPageState extends State<NameDetailsPage> {
  final _signUpFormKey = GlobalKey<FormState>();
  String _firstName, _lastName;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: BackButton(),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _signUpFormKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 36),
            children: <Widget>[
              BigTitle(firstLine: "Enter", secondLine: "Your Name"),
              SizedBox(height: 36,),
              TextFormField(
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal),
                decoration: textInputDecoration.copyWith(
                    labelText: "First Name"),
                validator: (val) =>
                    val.isEmpty ? "Please provide your first name" : null,
                onChanged: (val) {
                  setState(() => _firstName = val);
                },
              ),
              SizedBox(height: 32),
              TextFormField(
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal),
                decoration:
                    textInputDecoration.copyWith(labelText: "Last Name"),
                validator: (val) =>
                    val.isEmpty ? "Enter yout last name" : null,
                onChanged: (val) {
                  setState(() => _lastName= val);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CallToActionButton(
              buttonText: "Complete Sign Up",
              onPressed: () async {
                User myUser = _authService.auth.currentUser;
                if (_signUpFormKey.currentState.validate()) {
                  print("Yayyy $_firstName Welcome to Chop Chop Mr. $_lastName");
                  myUser.updateProfile(displayName: "$_firstName $_lastName");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: AnimatedSmoothIndicator(
                activeIndex: 0,
                count: 3,
                effect: ScaleEffect(
                  activeDotColor: Color(0xFFFFBB00),
                  dotColor: Color(0xFFFFBB00),
                  dotHeight: 8,
                  dotWidth: 8,
                  scale: 1.75,
                  spacing: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
