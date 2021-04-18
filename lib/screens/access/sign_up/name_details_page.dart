import 'package:chop_chop_flutter/screens/shared/big_title.dart';
import 'package:chop_chop_flutter/screens/shared/call_to_action_button.dart';
import 'package:chop_chop_flutter/screens/shared/constants.dart';
import 'package:chop_chop_flutter/screens/shared/functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NameDetailsPage extends StatefulWidget {
  @override
  _NameDetailsPageState createState() => _NameDetailsPageState();
}

class _NameDetailsPageState extends State<NameDetailsPage> {
  final _signUpFormKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  FocusNode _firstNameFocusNode = FocusNode();
  FocusNode _lastNameFocusNode = FocusNode();
  
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
                focusNode: _firstNameFocusNode,
                controller: _firstNameController,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                decoration: textInputDecoration.copyWith(labelText: "First Name"),
                validator: (firstName) =>
                    firstName.isEmpty ? "Please provide your first name" : null,
                onFieldSubmitted: (firstName) {
                  fieldFocusChange(context, _firstNameFocusNode, _lastNameFocusNode);
                },
              ),
              SizedBox(height: 32),
              TextFormField(
                focusNode: _lastNameFocusNode,
                controller: _lastNameController,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                decoration: textInputDecoration.copyWith(labelText: "Last Name"),
                validator: (lastName) => lastName.isEmpty ? "Enter yout last name" : null,
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
                if (_signUpFormKey.currentState.validate()) {
                  print("Update Profile");
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
