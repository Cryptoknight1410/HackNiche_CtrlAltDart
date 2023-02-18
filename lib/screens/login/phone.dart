
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackniche/providers/controllers/phone_controller.dart';
import 'package:hackniche/screens/login/otp_page.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  bool phoneValid = false;
  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const Text(
                  "Registration",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Enter your phone number!",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                phoneNumber(),
                const SizedBox(
                  height: 20,
                ),
                button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget phoneNumber() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 64,
      child: TextFormField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          value.length == 10
              ? setState(
                  () {
                    phoneValid = true;
                  },
                )
              : setState(
                  () {
                    phoneValid = false;
                  },
                );
        },
        controller: controller,
        cursorColor: Colors.white,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        decoration: InputDecoration(
          hintText: "Phone Number",
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 21,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 32,
                child: SvgPicture.asset(
                  "assets/icons/india.svg",
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "+91",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (phoneValid) {
            if (_formKey.currentState!.validate()) {
              // verifyPhoneNumber(controller.text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OtpPage(),
                ),
              );
            }
          } else {
            showSnackBar("Enter a valid phone number");
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.all(4),
        ),
        child: const Text(
          "Send OTP",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
