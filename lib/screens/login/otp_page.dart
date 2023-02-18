

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackniche/providers/controllers/otp_controller.dart';
import 'package:hackniche/screens/fragments.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  var otpController = TextEditingController();
  var smsCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const Text(
                  "Verification",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Enter your OTP number!",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                otp(),
                const SizedBox(
                  height: 15,
                ),
                button(),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Didn't receive the code?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => enableResend ? _resendCode() : null,
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          color: enableResend ? Colors.grey : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      " in $secondsRemaining s",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget otp() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width * 0.9,
      fieldWidth: 50,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.white,
        focusBorderColor: Colors.black,
        enabledBorderColor: Colors.black,
        disabledBorderColor: Colors.black,
      ),
      fieldStyle: FieldStyle.box,
      textFieldAlignment: MainAxisAlignment.spaceAround,
      onCompleted: (code) {
        setState(
          () {
            smsCode = code;
            signInWithCredential("", smsCode);
          },
        );
      },
    );
  }

  Widget button() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(
            builder : (context) => Fragment()
          ));
          // signInWithCredential("", smsCode);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.all(4),
        ),
        child: const Text(
          "Verify",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (secondsRemaining != 0) {
          setState(
            () {
              secondsRemaining--;
            },
          );
        } else {
          setState(
            () {
              enableResend = true;
            },
          );
        }
      },
    );
  }

  void _resendCode() {
    setState(
      () {
        secondsRemaining = 30;
        enableResend = false;
      },
    );
  }

  @override
  dispose() {
    timer?.cancel();
    super.dispose();
  }
}
