import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
Future<void> signInWithCredential(String verificationId, String smsCode) async {
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
    verificationId: verificationId,
    smsCode: smsCode,
  );

  // Sign in with the PhoneAuthCredential
  await auth.signInWithCredential(credential);
}
