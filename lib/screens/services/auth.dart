import 'package:chop_chop_flutter/screens/access/signup/email_password_page.dart';
import 'package:chop_chop_flutter/screens/access/signup/name_details_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth get auth => _auth;

  //Create phoneAuthCredential and sign in with phone
  Future verifySMSCode(BuildContext context, String verificationId, String smsCode,) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EmailPasswordPage(
                    phoneAuthCredential: phoneAuthCredential,
                  )));
    } on FirebaseAuthException catch (e) {
      print("Something went wrong with PhoneAuthCredential");
      print("This is what went wrong: ${e.toString()}");
    }
  }

  //Verify user phone number
  Future verifyUserPhoneNumber({@required BuildContext context, @required String phoneNumber, @required int resendCode, @required PhoneCodeSent codeSent}) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+233' + phoneNumber,
        codeAutoRetrievalTimeout: (String verificationId) {
          print("Code AutoRetrievalTimeout");
        },
        forceResendingToken: resendCode,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("Verification Completed");
          await _auth
              .signInWithCredential(credential)
              .then((UserCredential creds) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmailPasswordPage(
                          phoneAuthCredential: credential,
                        )));
          }).catchError((e) {
            print(e);
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification Failed");
          print(e.code);
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: codeSent,
      );
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign Up with Email and Password and link Phone Number (From Phone auth)
  Future registerWithEmailAndPassword(BuildContext context, String email,
      String password, PhoneAuthCredential phoneAuthCredential) async {
    try {
      UserCredential emailUserCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await emailUserCredential.user
          .linkWithCredential(phoneAuthCredential)
          .then((user) {
            print(user.user.uid);
            print("Linked succesfully");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NameDetailsPage()));
      }).catchError((error) {
        print("Linking failed here is the error ${error.toString()}");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
