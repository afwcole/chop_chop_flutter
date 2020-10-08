import 'package:chop_chop_flutter/screens/services/auth.dart';
import 'package:chop_chop_flutter/screens/shared/big_title.dart';
import 'package:chop_chop_flutter/screens/shared/call_to_action_button.dart';
import 'package:chop_chop_flutter/screens/shared/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EmailPasswordPage extends StatefulWidget {
  final PhoneAuthCredential phoneAuthCredential;
  EmailPasswordPage({ Key key, @required this.phoneAuthCredential }) : super(key: key);

  @override
  _EmailPasswordPageState createState() => _EmailPasswordPageState();
}

class _EmailPasswordPageState extends State<EmailPasswordPage> {
  final _signUpFormKey = GlobalKey<FormState>();
  String _email, _password;
  final AuthService _authService = AuthService();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  
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
              BigTitle(firstLine: "Enter Email", secondLine: "& Password"),
              SizedBox(height: 36,),
              TextFormField(
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                decoration: textInputDecoration.copyWith(labelText: "E-Mail"),
                validator: (val) =>
                    EmailValidator.validate(val) ? null : "Invalid E-Mail address",
                onChanged: (val) => setState(() => _email = val),
                onSaved: (val) => setState(() => _email = val),
                onFieldSubmitted: (val){
                  fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
                },
              ),
              SizedBox(height: 32),
              TextFormField(
                focusNode: _passwordFocusNode,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                obscureText: true,
                decoration: textInputDecoration.copyWith(labelText: "Password"),
                validator: (val) {
                  Pattern pattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{8,}$';
                  RegExp regex = new RegExp(pattern);
                  if(!regex.hasMatch(val)) return 'Invalid Password, password must include: \n - Atleast 8 characters\n - Atleast 1 number \n - Atleast 1 capital letter';
                  else return null;
                },
                onChanged: (val) => setState(() => _password = val),
                onSaved: (val) => setState(() => _password = val),
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
              buttonText: "Next",
              onPressed: () async {
                if (_signUpFormKey.currentState.validate()) {
                  await _authService.registerWithEmailAndPassword(
                    context, _email, _password, widget.phoneAuthCredential);
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: AnimatedSmoothIndicator(
                activeIndex: 2,
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
