import 'package:chop_chop_flutter/screens/services/auth_service.dart';
import 'package:chop_chop_flutter/screens/shared/big_title.dart';
import 'package:chop_chop_flutter/screens/shared/call_to_action_button.dart';
import 'package:chop_chop_flutter/screens/shared/constants.dart';
import 'package:chop_chop_flutter/screens/shared/functions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

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
              BigTitle(firstLine: "Sign Up",),
              SizedBox(height: 36,),
              TextFormField(
                focusNode: _emailFocusNode,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                decoration: textInputDecoration.copyWith(labelText: "E-Mail"),
                validator: (email) => EmailValidator.validate(email)
                    ? null
                    : "Invalid E-Mail address",
                onFieldSubmitted: (email) {
                  fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
                },
              ),
              SizedBox(height: 32),
              TextFormField(
                focusNode: _passwordFocusNode,
                controller: _passwordController,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                obscureText: true,
                decoration: textInputDecoration.copyWith(labelText: "Password"),
                validator: (password) {
                  Pattern pattern =
                      r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{8,}$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(password))
                    return 'Invalid Password, password must include: \n - Atleast 8 characters\n - Atleast 1 number \n - Atleast 1 capital letter';
                  else
                    return null;
                },
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
              buttonText: "Sign Up",
              onPressed: () async {
                if (_signUpFormKey.currentState.validate()) {
                  context.read<AuthService>().emailSignUp(
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
