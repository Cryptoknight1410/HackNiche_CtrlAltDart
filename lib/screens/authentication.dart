import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackniche/widgets/colors.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorss.black,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Text("Login", style: TextStyle(fontSize: 24, color: Colorss.white),),
                    Row(
                      children: [
                        Container(
                          child: Text("Login in with your"),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(color: Colorss.pink,borderRadius: BorderRadius.circular(32.0)),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  width: 0.5 * MediaQuery.of(context).size.width,
                  
                  child: Center(child: Text("Submit",style: TextStyle(fontSize: 24, color: Colorss.black)))),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}