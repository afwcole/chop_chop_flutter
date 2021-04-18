import 'package:chop_chop_flutter/screens/access/sign_up/name_details_page.dart';
import 'package:chop_chop_flutter/screens/services/auth_service.dart';
import 'package:chop_chop_flutter/screens/shared/big_title.dart';
import 'package:chop_chop_flutter/screens/shared/call_to_action_button.dart';
import 'package:chop_chop_flutter/screens/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EnterNumberPage extends StatefulWidget {
  @override
  _EnterNumberPageState createState() => _EnterNumberPageState();
}

class _EnterNumberPageState extends State<EnterNumberPage> {
  final _enterNumFormKey = GlobalKey<FormState>();
  final _verifyFormKey = GlobalKey<FormState>();
  bool _smsCodeSent = false, _isButtonDisabled = true;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _smsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        leading: BackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: FlatButton(
                padding: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                color: Color(0xFFCCCCCC),
                child: Text(
                  "Logout", 
                  style: TextStyle(
                    fontSize: 14, 
                  ),
                ),
                onPressed: () { context.read<AuthService>().signOut(); },
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _smsCodeSent ? _verifyFormKey : _enterNumFormKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 36),
            children: _smsCodeSent ? verifyNumberForm() :  enterPhoneNumberForm(),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CallToActionButton(
              buttonText: _smsCodeSent ? "Verify" : "Next",
              onPressed: _isButtonDisabled ? null : () async {
                if ((_smsCodeSent ? _verifyFormKey : _enterNumFormKey).currentState.validate()) {
                  if(_smsCodeSent == true){
                    await context.read<AuthService>()
                      .checkSMSCode(_smsController.text.trim())
                      .then((value) => Navigator
                        .push(context, MaterialPageRoute(builder: (context) => NameDetailsPage())));
                  } else {
                    await context.read<AuthService>()
                      .verifyWithPhone(
                        phoneNo: "+233" + _phoneController.text.trim(),
                        changeUI: () => setState((){_smsCodeSent = true;})
                      );
                  }
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


  List<Widget> enterPhoneNumberForm() {
    return <Widget>[
      BigTitle(firstLine: "Enter Your", secondLine: "Phone Number"),
      SizedBox(height: 36,),
      Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              //border: Border.all(color: Color(0xFFFFBB00), width: 3),
              borderRadius: BorderRadius.circular(10),
              color: _isButtonDisabled ? Color(0xFFFFBB00).withOpacity(0.4) : Color(0xFFFFBB00).withOpacity(0.7),
            ),
            child: Text("+233", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _phoneController,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              decoration: textInputDecoration.copyWith(labelText: "Phone Number",),
              validator: (phoneNo) => phoneNo.isEmpty ? "Enter your phone number" : null,
              onChanged: (phoneNo) {
                setState(() {
                  _isButtonDisabled = phoneNo.isEmpty ? true 
                    : (phoneNo.length < 9 || phoneNo.length > 10);
                });
              },
            ),
          ),
        ],
      ),
      SizedBox(height: 24),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          "You will receive a SMS for verification. Message and data rates may apply.",
          style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 12,),
        ),
      ),
    ];
  }


  List<Widget> verifyNumberForm() {
    return <Widget>[
      BigTitle(firstLine: "Verify", secondLine: "Your Number"),
      SizedBox(height: 40),
      Text(
        "Enter the 6 digit code sent to you...",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      ),
      SizedBox(
        height: 16,
      ),
      PinPut(
        fieldsCount: 6,
        focusNode: FocusNode(),
        keyboardType: TextInputType.number,
        controller: _smsController,
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration,
        followingFieldDecoration: pinPutDecoration.copyWith(
          border: Border.all(color: Color(0xFFCCCCCC), width: 3),
        ),
        validator: (smsCode) =>
            smsCode.isEmpty || smsCode.length < 6 ? "Enter SMS Code" : null,
        onChanged: (smsCode) {
          setState(() {
            _isButtonDisabled = smsCode.isEmpty ? true : smsCode.length != 6;
          });
        },
      ),
      SizedBox(height: 32),
      Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () async {
            print("SMS Code Resent");
          },
          child: Text(
            "Resend SMS Code",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              decoration: TextDecoration.underline
            ),
          ),
        ),
      ),
    ];
  }
}