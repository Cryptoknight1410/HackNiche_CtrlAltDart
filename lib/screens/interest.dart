import 'package:flutter/material.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

List<String> listresult = [];

var interest = [
  'Health',
  'Technology',
  'Finance',
  'Sports',
  'Politics',
  'Business',
  'Fashion',
  'Education',
  'E-commerce',
  'Medicine',
  'Life Style',
  'Health',
  'Technology',
  'Finance',
  'Sports',
  'Politics',
  'Business',
  'Fashion',
  'Education',
  'E-commerce',
  'Medicine',
  'Life Style'
];

List<Interest> interestList = List.generate(
  interest.length,
  (index) => Interest(interest: interest[index], status: false),
);

class _InterestPageState extends State<InterestPage> {
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text(
          "Select Interests:",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.pink[100],
            ),
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: interestList
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.all(5),
                      child: ListTile(
                        onTap: () {
                          setState(
                            () {
                              e.status = !e.status;
                            },
                          );
                        },
                        title: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              e.interest,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        leading: GestureDetector(
                          onTap: () {
                            setState(() {
                              e.status = !e.status;
                            });
                          },
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Container(
                                child: e.status
                                    ? Icon(
                                        Icons.check_circle,
                                        size: 40,
                                        color: Colors.black54,
                                      )
                                    : Container(),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
              decoration: BoxDecoration(
                color: Colors.black87,
                border: Border.all(),
                borderRadius: BorderRadius.circular(25),
              ),
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  for (var i = 0; i < interestList.length; i++) {
                    if (interestList[i].status) {
                      listresult.add(interestList[i].interest);
                      print(interestList[i].interest);
                    }
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Interest {
  String interest;
  bool status;

  Interest({required this.interest, required this.status});
}