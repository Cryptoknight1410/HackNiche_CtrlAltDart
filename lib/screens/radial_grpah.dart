import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackniche/widgets/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RadialGraph extends StatefulWidget {
  const RadialGraph({super.key});

  @override
  State<RadialGraph> createState() => _RadialGraphState();
}

class _RadialGraphState extends State<RadialGraph> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children:  Colorss.listOfColor.map((e) =>  CircularPercentIndicator(
                  radius: 20.0 + Colorss.listOfColor.indexOf(e) * 20,
                  lineWidth: 10.0,
                  percent: 0.25 + Colorss.listOfColor.indexOf(e) * 0.20,
                backgroundColor: Colorss.black,
                progressColor: e,
                addAutomaticKeepAlive: true,
                animationDuration: 500,
              curve: Curves.easeInSine,
                ),).toList(),
    );
  }
}