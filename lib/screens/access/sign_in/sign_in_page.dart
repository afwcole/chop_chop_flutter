import 'package:chop_chop_flutter/screens/services/auth_service.dart';
import 'package:chop_chop_flutter/screens/shared/big_title.dart';
import 'package:chop_chop_flutter/screens/shared/call_to_action_button.dart';
import 'package:chop_chop_flutter/screens/shared/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _signInFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
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
          key: _signInFormKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 36),
            children: <Widget>[
              BigTitle(firstLine: "Sign In",),
              SizedBox(height: 36,),
              TextFormField(
                focusNode: _emailFocusNode,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                decoration: textInputDecoration.copyWith(labelText: "E-Mail"),
                validator: (val) => EmailValidator.validate(val)
                    ? null
                    : "Invalid E-Mail address",
                onFieldSubmitted: (val) {
                  fieldFocusChange(
                      context, _emailFocusNode, _passwordFocusNode);
                },
              ),
              SizedBox(height: 32),
              TextFormField(
                focusNode: _passwordFocusNode,
                controller: _passwordController,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                obscureText: true,
                decoration: textInputDecoration.copyWith(labelText: "Password"),
                validator: (val) {
                  Pattern pattern =
                      r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{8,}$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(val))
                    return 'Invalid Password';
                  else
                    return null;
                },
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, right: 24.0),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.black, 
                        fontSize: 16, 
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(36.0, 0.0, 36.0, 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CallToActionButton(
              buttonText: "Sign In",
              onPressed: () async {
                if (_signInFormKey.currentState.validate()) {
                  context.read<AuthService>().emailSignIn(
                    _emailController.text.trim(), 
                    _passwordController.text.trim(),
                  ).then((value) => Navigator.of(context).pop());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
