
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackniche/screens/interest.dart';
import 'package:hackniche/screens/line_graph.dart';
import 'package:hackniche/screens/radial_grpah.dart';
import 'package:hackniche/services/service.dart';

import '../widgets/colors.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  
  List<String> trending = ["IPL", "Mahashivratri", "hotstar", "Ronaldo", "AntManAndTheWaspQuantummania"];

  int rand = 0;
  late Widget graphInst = Container();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        graphInst = LineGraph().lineChart(context);      
      });
    
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          
          preferredSize: const Size.fromHeight(96.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const SizedBox(height: 8.0,), 
              Text("Profile", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),),
            const SizedBox(height: 16.0,),
           SizedBox(
                width: double.infinity,
),
          ]),
        ),
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            graphInst,
            SizedBox(height : 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // width: 0.5 * MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 32.0), 
                  child: const RadialGraph(),
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(color: Colorss.yellow,
                  borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: 
                       Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/game_svg.svg",color: Colors.black,height : 96,
                          ),
                          const Text("Fun", style: TextStyle(color: Colorss.black, fontWeight: FontWeight.bold, fontSize: 18),)
                        ],
                      
                    
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0,),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  color: Colorss.pink,
                  elevation: 2,
                  child:  ListView(
                    
                    children : trending.map((e) => ListTile(title: Text("#" +  e, style: TextStyle(color: Colors.black, fontSize: 22),), subtitle: Text("Trending in Mumbai", style: TextStyle(color: Colors.black54, fontSize: 14)),)).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
