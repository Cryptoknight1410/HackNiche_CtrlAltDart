import 'package:flutter/material.dart';

class FullDetails extends StatelessWidget {
  Color backgroundColor;
  FullDetails({required this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: backgroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          height: double.infinity,
          width: double.infinity,
          color: Colors.amber[200],
          child: Container(
            height: MediaQuery.of(context).size.height * 4 / 3,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                    child: Text(
                  "Tesla Shanghai Capacity Will Exceed 1 Million Cars In 2022",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'Shantell_Sans'
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: NetworkImage(
                      'https://cleantechnica.com/files/2021/10/Tesla-China-Sales-e1642076454693.jpeg',
                    ),
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround, 
                        children: [
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://secure.gravatar.com/avatar/4ccbe8a963ed00ce0928772f76beb349?s=40&d=blank&r=g")),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            children: [
                              Text(
                                "Published By:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('Steve Hanley'),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Published Date:",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "February 14, 2022",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: 'RobotoCondensed'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  child: const Text('Tesla began a major expansion of its Gigafactory in Shanghai late last year. Currently, it is capable of building 450,000 cars a year. That number is expected to rise to more than 1 million cars a year once the expansion in complete. The enlarged facility is scheduled to begin production in April of this year, according to sources.' +
                      "Tesla said when the expansion project began it would achieve capacity increases by increasing work hours, increasing the number of employees, and increasing the frequency of material turnover. It expects to add 4,000 employees to its payroll, bringing the total workforce at the Shanghai factory to 19,000." +
                      "This month, on the first day of the Chinese New Year, Tesla posted openings for 1,523 new positions in 11 categories including sales and delivery, service, R&D, manufacturing, infrastructure, and supply chain. The production line optimization will focus on expanding the press shop, body shop, paint shop, final assembly shop, and logistics operation center." +
                      "BYD Blade Battery Order" +
                      "Rumors have been circulating for some time that Tesla China has placed a large order for BYD Blade batteries. Recently, a source within China posted on social media that BYD will begin mass production of its C112F LFP batteries in March and that Teslas fitted with the new batteries are scheduled to begin shipping from Giga Shanghai in the second quarter. Later, the post was deleted. It’s not clear if that was because the information was inaccurate or because BYD wished to make the official announcement itself." +
                      "If Tesla does indeed expand its Giga Shanghai capacity to 1 million cars, BYD could be the battery supplier for about 20% of them. Cars built in China won’t be reserved exclusively for in-country sales but will be shipped to other markets in Asia. The standard range versions of the Model 3 and Model Y currently produced at Tesla’s Shanghai use LFP batteries manufactured by CATL at its factory located just a few blocks away from Giga Shanghai." +
                      "Tesla has indicated that LFP batteries will be used in both the standard and long range versions of its Model 3 and Model Y cars manufactured in the US and in Europe. BYD already has a US battery factory that manufactures LFP batteries. We leave it to our readers to connect the dots.'),"),
                ),
              ]),
            ),
          ),
        ));
  }
}