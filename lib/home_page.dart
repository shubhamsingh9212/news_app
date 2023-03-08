import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> navBarItem = [
      "Top News",
      "India",
      "World",
      "Finance",
      "Health"
    ];
    List items = [Colors.blue, Colors.black, Colors.deepOrange, Colors.grey];
    return Scaffold(
      appBar: AppBar(title: Text("News App"), centerTitle: true),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.black12,
                  ),
                  child: Row(children: [
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: Icon(
                              Icons.search,
                              color: Colors.indigoAccent,
                            ))),
                    Expanded(
                      child: TextField(
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                          )),
                    ),
                  ]),
                ),
                Container(
                  height: 70.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: navBarItem.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                              height: 60.0,
                              width: 100,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Center(
                                  child: Text(
                                navBarItem[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                              ))),
                        );
                      }),
                ),
                CarouselSlider(
                    items: items.map((item) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                            margin: EdgeInsets.all(15),
                            child: Stack(children: [
                              ClipRRect(
                                child: Image.asset(
                                  "image/download.jpg",
                                  fit: BoxFit.fitHeight,
                                  height: double.infinity,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              Positioned(
                                  left: 8,
                                  bottom: 5,
                                  child: Text(
                                    "HeadLines",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ]));
                      });
                    }).toList(),
                    options: CarouselOptions(
                        height: 150,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true)),
                Container(padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: Text(
                      " Latest News :- ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,decoration: TextDecoration.underline
                      ),
                    )),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        child: Stack(children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                "image/download.jpg",
                                fit: BoxFit.cover,
                                width: size.width,
                              )),
                          Positioned(
                              left: 7,
                              bottom: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Colors.white, Colors.black12],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight)),
                                child: Column(
                                  children: [
                                    Text(
                                      "HeadLines",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "Description",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ))
                        ]));
                  },
                ),
                ElevatedButton(onPressed: (){}, child: Text("Show More"))
              ],
            ),
          )),
    );
  }
}
