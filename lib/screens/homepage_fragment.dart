import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hackniche/main.dart';
import 'package:hackniche/widgets/colors.dart';

import '../widgets/Categories.dart';

class HomepageFragment extends StatefulWidget {
  const HomepageFragment({super.key});

  @override
  State<HomepageFragment> createState() => _HomepageFragmentState();
}

class _HomepageFragmentState extends State<HomepageFragment> with SingleTickerProviderStateMixin{
  late TabController tabController;
  int tabIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: list_of_categories.length, vsync: this);
  }

  void dispose(){
    tabController.dispose();
    super.dispose();
  }

  List<String> list_of_categories = [
    "top",
    "business",
    "entertainment",
    "environment",
    "food",
    "health",
    "politics",
    "science",
    "sports"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          
          preferredSize: const Size.fromHeight(96.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const SizedBox(height: 8.0,), 
              Text("HomePage", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),),
            const SizedBox(height: 16.0,),
           SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: list_of_categories.map((e) {
                    return GestureDetector(
                      onTap: (){
                        tabController.animateTo(list_of_categories.indexOf(e));
                        setState(() {
                          tabIndex = list_of_categories.indexOf(e);                        
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(right: 16.0),
                        child: Text(e, style: TextStyle(color: tabIndex == list_of_categories.indexOf(e) ? Colorss.listOfColor[Random().nextInt(4)] :  Colorss.white,fontSize: 16, fontWeight: tabIndex == list_of_categories.indexOf(e) ? FontWeight.bold : null),)),
                    );
                  }).toList()),
                )),

          ]),
        ),
        body: TabBarView(
          
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: list_of_categories.map((e) => buildCards(context, e)).toList(),),
      ),
    );
  }
}