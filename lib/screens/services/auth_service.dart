import 'package:chop_chop_flutter/models/user_account.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;
  String _verificationId;
  int _resendToken;

  AuthService(this._auth);

  //Stream of auth changes and maps the FirbaseUser to UserAccount model
  Stream<User> get myUser => _auth.authStateChanges();

  //create userAccount object based on firebaseUser
  UserAccount _userAccountFromFirebaseUser(User user) {
    return user != null
        ? UserAccount(
            uid: user.uid,
            email: user.email,
            phoneNumber: user.phoneNumber,
            displayName: user.displayName,
            emailVerified: user.emailVerified,
          )
        : null;
  }

  //Sign In email and password
  Future<String> emailSignIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Signed In");
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  //Sign Up with Email and Password
  Future<String> emailSignUp(
    String email,
    String password,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("Signed Up");
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  //Send E-Mail Verification
  Future<String> sendEmailVerification() async {
    try {
      _auth.currentUser.sendEmailVerification();
      print("Email containing code has been sent");
      return "Email containing code has been sent";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  //Sign up with phone number
  Future<String> verifyWithPhone({String phoneNo, Function changeUI}) async {
    try {
      String msg;
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNo,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
            print("Verification Completed");
          },
          verificationFailed: (FirebaseAuthException e) {
            print(e.message);
          },
          codeSent: (String verificationId, int resendToken) {
            _verificationId = verificationId;
            _resendToken = resendToken;
            changeUI();
            print("Code Sent");
          },
          codeAutoRetrievalTimeout: (String verificationId){
            _verificationId = verificationId;
            print("Autoretrieval timeout");
          });
      return msg;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  //Check SMS Code
  Future<String> checkSMSCode(String smsCode) async {
    try {
      //Create PhoneAuthCredential with SMS code
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider
          .credential(verificationId: _verificationId, smsCode: smsCode);
      
      //Link account with phone credential
      await _auth.currentUser.linkWithCredential(phoneAuthCredential);
      print("Succesfull Link");
      _auth.currentUser.reload();
      return "Succesfull Link";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  //Sign Out the user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("Sign Out succesfull");
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      return e.toString();
    }
  }
}
