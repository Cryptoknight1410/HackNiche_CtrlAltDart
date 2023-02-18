
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackniche/screens/analytics.dart';
import 'package:hackniche/screens/homepage_fragment.dart';
import 'package:hackniche/screens/podcast.dart';

import '../main.dart';

class Fragment extends StatefulWidget {
  const Fragment({super.key});

  @override
  State<Fragment> createState() => _FragmentState();
}

class _FragmentState extends State<Fragment> with TickerProviderStateMixin {
  late TabController tabController;
  int tapped = 0;
  List<FloatingIcon> floatingButtonIcon = [
    FloatingIcon(
      assets: "assets/icons/home_svg.svg",
      onTapped: () {
        print("home");
      },
      index: 0,
    ),
    FloatingIcon(
      assets: "assets/icons/podcast_svg.svg",
      onTapped: () {
        print("home");
      },
      index: 1,
    ),
    FloatingIcon(
      assets: "assets/icons/analytics_svg.svg",
      onTapped: () {
        print("bookmark");
      },
      index: 2,
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: floatingButtonIcon.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    tabController.animateTo(tapped);
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children:  [
          HomepageFragment(),
          PodcastPage(),
          AnalyticsPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding : const EdgeInsets.only(bottom: 16.0),
        width: 0.5 * MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: floatingButtonIcon.map(
            (e) => GestureDetector(
              onTap: () {
                setState(() {
                  tapped = e.index;
                });
              },
              child: _buildCircularAvatar(
                rad: 24,
                pic: e.assets,
                isTapped: e.index == tapped,
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }

  Widget _buildCircularAvatar({
    bool isTapped = false,
    double rad = 0,
    String pic = "",
  }) {
    return CircleAvatar(
      radius: rad,
      backgroundColor:
          isTapped ? Colors.white : Color.fromARGB(255, 51, 50, 50),
      child: SvgPicture.asset(
        pic,
        color: isTapped ? Colors.black : Colors.white,
      ),
    );
  }
}

class FloatingIcon {
  String assets;
  dynamic onTapped;

  int index;

  FloatingIcon(
      {required this.assets, required this.onTapped, required,required this.index});
}