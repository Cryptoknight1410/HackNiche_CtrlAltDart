import 'package:flutter/material.dart';
// import 'package:hackniche/screens/fulldetail.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/colors.dart';

enum CardStatus {
  like,
  dislike,
}

class CardProvider extends ChangeNotifier {
  BuildContext? context;
  List<Widget> _urlImage = [];
  bool _isDragging = false;
  Offset _position = Offset.zero;
  double _angle = 0;
  Size _screenSize = Size.zero;

  void setScreenSize(Size screenSize) => _screenSize = screenSize;
  List<Widget> get urlImage => _urlImage;
  Offset get position => _position;
  bool get isDragging => _isDragging;
  double get angle => _angle;

  CardProvider(BuildContext con) {
    resetUser();
    context = con;
  }

  void resetUser() {
    _urlImage = <Widget>[
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        color: Colorss.yellow,
        elevation: 2,
        child: Container(
          height: 400,
          width: double.infinity,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(
                  "Tesla Shanghai Capacity Will Exceed",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://secure.gravatar.com/avatar/4ccbe8a963ed00ce0928772f76beb349?s=40&d=blank&r=g"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Published By:",
                            style: TextStyle(
                                color: Colorss.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Steve Hanley'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: (() {}),
                      child: Text(
                        'Follow',
                        style: TextStyle(color: Colorss.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colorss.black),
                      ))
                ],
              ),
              Container(
                height: 120,
                child: const Text(
                    'Tesla began a major expansion of its Gigafactory in Shanghai late last year. Currently, it is capable of building 450,000 cars a year. That number is expected to rise to more than 1 million cars a year once the expansion in complete. The enlarged facility is scheduled to begin production in April of this year, according to sources.',
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.bookmark),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.share),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        color: Colorss.yellow,
        elevation: 2,
        child: Container(
          height: 400,
          width: double.infinity,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(
                  "Tesla recall for heater and defroster systems issue",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.teslarati.com/wp-content/uploads/2020/10/1843795E-7C50-4D98-9CA5-73E392C47C18_1_105_c-e1601883033165-80x80.jpeg"),
                      ),
                      Column(
                        children: [
                          Text(
                            " Published By:",
                            style: TextStyle(
                                color: Colorss.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Maria Merano'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: (() {}),
                      child: Text(
                        'Follow',
                        style: TextStyle(color: Colorss.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colorss.black),
                      ))
                ],
              ),
              Container(
                height: 120,
                child: const Text(
                    'Transport Canada issued a recall for the Tesla Model 3, Model Y, and Model S on February 3, 2022, the agency told Teslarati recently. The recall was issued after the agency discovered an issue with the heat system in certain Tesla vehicles.',
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.bookmark),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.share),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        color: Colorss.yellow,
        elevation: 2,
        child: Container(
          height: 400,
          width: double.infinity,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(
                  "The WPL auction has unleashed new energy",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.hindustantimes.com/rf/image_size_90x90/HT/Web/AuthorsAndColumnists/Pictures/Crop/Roshan%20Kishore-kpvB-U202949870247PKC-250x250%40HT-Web.jpg"),
                      ),
                      Column(
                        children: [
                          Text(
                            "Published By:",
                            style: TextStyle(
                                color: Colorss.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Roshan Kishore'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: (() {}),
                      child: Text(
                        'Follow',
                        style: TextStyle(color: Colorss.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colorss.black),
                      ))
                ],
              ),
              Container(
                height: 120,
                child: const Text(
                    'It has gathered, generated and released the energy of women’s sport in India and regardless of what the men may do (World Cup year, guys, tick tock), that genie is now out of the bottle',
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.bookmark),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.share),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        color: Colorss.yellow,
        elevation: 2,
        child: Container(
          height: 400,
          width: double.infinity,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(
                  "Demand of Stockmarket is increasing ",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Updated Just Now",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontFamily: 'RobotoCondensed'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.teslarati.com/wp-content/uploads/2020/10/1843795E-7C50-4D98-9CA5-73E392C47C18_1_105_c-e1601883033165-80x80.jpeg"),
                      ),
                      Column(
                        children: [
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
             ElevatedButton(
                      onPressed: (() {}),
                      child: Text('Follow',style: TextStyle(color: Colorss.white),),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colorss.black),
                      ))
                ],
              ),
              Container(
                height: 120,
                child: const Text(
                    'When looking for a job, it is important to have a resume that stands out. One way to do this is to use positive words to describe yourself and your achievements. Using persuasive language can help you to sell yourself and your skillsIn this blog post, we will provide a list of 50 positive words and examples of sentences you can use to describe yourself and stand out from other job applicants!',
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.bookmark),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.share),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        color: Colorss.pink,
        elevation: 2,
        child: Container(
          height: 400,
          width: double.infinity,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(
                  "Demand of Stockmarket is incresing  ",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Updated Just Now",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontFamily: 'RobotoCondensed'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.teslarati.com/wp-content/uploads/2020/10/1843795E-7C50-4D98-9CA5-73E392C47C18_1_105_c-e1601883033165-80x80.jpeg"),
                      ),
                      Column(
                        children: [
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
                  ElevatedButton(
                      onPressed: (() {}),
                      child: Text('Follow',style: TextStyle(color: Colorss.white),),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colorss.black),
                      ))
                ],
              ),
              Container(
                height: 120,
                child: const Text(
                    'When looking for a job, it is important to have a resume that stands out. One way to do this is to use positive words to describe yourself and your achievements. Using persuasive language can help you to sell yourself and your skillsIn this blog post, we will provide a list of 50 positive words and examples of sentences you can use to describe yourself and stand out from other job applicants!',
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.bookmark),
                  ),
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.share),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      
    ].
     reversed.toList();
  }

  void startposition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updateposition(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;

    notifyListeners();
  }

  void endposition() {
    _isDragging = false;
    notifyListeners();
    final status = getStatus();
    if (status != null) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: status.toString().split('.').last.toUpperCase(), fontSize: 36);
    }

    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      default:
        resetPosition();
    }
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width / 2, 0);
    notifyListeners();
    nextcard();
  }

  void dislike() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width / 2, 0);
    notifyListeners();
    nextcard();
  }

  Future nextcard() async {
    if (_urlImage.isEmpty) return;

    await Future.delayed(Duration(milliseconds: 200));
    _urlImage.removeLast();
    resetPosition();
  }

  CardStatus? getStatus() {
    final x = _position.dx;
    // final y= _position.dy;
    final delta = 100;
    if (x >= delta) {
      return CardStatus.like;
    } else if (x <= -delta) {
      return CardStatus.dislike;
    }
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }
}
