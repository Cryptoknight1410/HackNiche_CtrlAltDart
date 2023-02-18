import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> verifyPhoneNumber(String phoneNumber) async {
  await _auth.verifyPhoneNumber(
    phoneNumber: '+91$phoneNumber',
    verificationCompleted: (PhoneAuthCredential credential) {
      // Auto-retrieve the SMS code and sign-in
      _auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }
    },
    codeSent: (String verificationId, int? resendToken) async {
      String smsCode = 'xxxx';
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: "",
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      // Auto-resolution timed out...
    },
  );
}
