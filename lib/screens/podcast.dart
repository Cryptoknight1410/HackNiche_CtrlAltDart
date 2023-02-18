import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/colors.dart';

class PodcastPage extends StatefulWidget {
  const PodcastPage({super.key});

  @override
  State<PodcastPage> createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  late List<Podcast> _currentSliderValue;
  
  int selectedPod = -1;

  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentSliderValue = List.generate(5, (index) => Podcast(counter : 0.0, isRunning: false));

    timer = Timer.periodic(Duration(milliseconds: 100), (val) {
      if (selectedPod >= 0 && _currentSliderValue[selectedPod].isRunning) {
        setState(() {
          _currentSliderValue[selectedPod].counter = (_currentSliderValue[selectedPod].counter + 0.5) % 100;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
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
              Text("Podcasts", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),),
            const SizedBox(height: 16.0,),
           SizedBox(
                width: double.infinity,
),
          ]),
        ),
      backgroundColor: Colorss.black,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, podcast) =>  Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(56)),
            color: Colorss.listOfColor[podcast % 4],
            elevation: 2,
              child: Container(
              height: 0.35 * MediaQuery.of(context).size.height,
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [    
                    Container(child: Text("Podcast Title", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),),    
                    SizedBox(height: 16.0,),
                        SizedBox(
                          child: Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                      'assets/images/girl_icon.png',
                                      height: 50,
                                    )),
                                Column(
                                  children: const [
                                    Text(
                                      "Published By:",
                                      style: TextStyle(
                                          color: Colorss.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Warren buffet'),
                                  ],
                                ),
                              ],
                            ),
                        ),
                        SizedBox(height: 16.0,),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Slider(
                        value: selectedPod >= 0 ? _currentSliderValue[selectedPod].counter : 0.0,
                        max: 100,
                        divisions: 100000,
                        label: "00 : " + (selectedPod >= 0 ?  _currentSliderValue[selectedPod].counter.round().toString() : ""),
                        activeColor: Colorss.black,
                        
                        inactiveColor: Colors.white,
                        onChanged: (double value) {
                          setState(() {
                            selectedPod = podcast;
                            _currentSliderValue[selectedPod].counter = value;
                          });
                        },
                                          ),
                                          Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: SvgPicture.asset(
                                'assets/icons/backward_svg.svg',
                                height: 36,
                                color: Colors.black,
                              )),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  print(podcast);
                                  selectedPod = podcast;
                                  _currentSliderValue[podcast].isRunning = !_currentSliderValue[podcast].isRunning;
                                });
                              },
                              child:  SvgPicture.asset(selectedPod >= 0 && _currentSliderValue[selectedPod].isRunning  ? 'assets/icons/pause_svg.svg' : 'assets/icons/play_svg.svg',
                                  height: 48, color: Colors.black,),),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                });
                              },
                              child: RotatedBox(
                                quarterTurns: 90,
                                child: SvgPicture.asset(
                                    'assets/icons/backward_svg.svg',
                                    height: 36,
                                    color: Colors.black,
                                  ),
                              ),),
                        ],
                                          ),
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Podcast{

  bool isRunning;
  double counter;
  Podcast({required this.isRunning, required this.counter});
}