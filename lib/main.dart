
import 'package:flutter/material.dart';
import 'package:hackniche/screens/authentication.dart';
import 'package:hackniche/screens/fragments.dart';

import 'package:hackniche/screens/fulldetail.dart';
import 'package:hackniche/screens/login/phone.dart';
import 'package:hackniche/screens/sudoku.dart';
import 'package:hackniche/screens/sudoku_three_screen.dart';
import 'package:hackniche/screens/sudokuscreen.dart';
import 'package:hackniche/screens/wrapper.dart';
import 'package:hackniche/widgets/Categories.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';
import './providers/cardproviders.dart';
import './widgets/cards.dart';
import 'package:provider/provider.dart';
import './screens/sudokutwo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardProvider(context),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'RaleWay',
          primarySwatch: Colors.amber,
        ),
        home: Wrapper(),
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        child: Wrapper()
      ),
    );
  }
}




Widget buildCards(BuildContext context, String category) {
   
      final provider = Provider.of<CardProvider>(context);
      final urlImages = provider.urlImage;
      
      return Scaffold(

        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                      Container(
                        // color: Colors.green,
                        margin: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Stack(
                          children: urlImages.map((e) {
                            return Container(
                              height:MediaQuery.of(context).size.height * 4 / 6 ,
                              margin: urlImages.indexOf(e) == urlImages.length - 1  ? const EdgeInsets.only(top: 116.0) : urlImages.indexOf(e) == urlImages.length - 2 ? const EdgeInsets.only(bottom: 152.0) :urlImages.indexOf(e) == urlImages.length - 3  ? const EdgeInsets.only(top: 182.0) :null,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) {
                                        return FullDetails(
                                          backgroundColor: Colors.black,
                                        );
                                      },
                                    ));
                                  },
                                  child: Hero(
                                      tag: e.hashCode,
                                      child: Cards(
                                          isFront: e == urlImages.last, urlImage: e))),
                            );
                          }).toList(),
                        ),
                      ),
          ],
        ),
      );
    }
