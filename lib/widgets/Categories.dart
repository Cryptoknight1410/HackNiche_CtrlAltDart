
import 'package:flutter/material.dart';


class Containerr extends StatelessWidget {
      final category;
      Containerr(this.category);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(136, 187, 179, 179),),
      

      child: Text(category,style: TextStyle(color: Colors.white,)),
    );
  }
}