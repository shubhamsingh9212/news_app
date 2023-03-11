import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/cachedImage.dart';
import 'package:untitled/news_response.dart';
import 'package:untitled/webView.dart';

import 'category.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> navBarItem = ["Top News", "India", "World", "Finance", "Health"];
  bool loading = true;
  NewsResponse? newsResponse;
  NewsResponse? newsResponseCarousel;
  TextEditingController textEditingController= TextEditingController();

  void fetchNews() async {
    const apiKey = "868c3f8599fe4ece9974bf166ec9171f";
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2023-02-11&sortBy=publishedAt&apiKey=$apiKey";
    var response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        setState(() {
          newsResponse = NewsResponse.fromJson(json);
        });
      } else {
        Fluttertoast.showToast(msg: "Error in fetching news");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "e");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
    carousalNews();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  void carousalNews() async {
    const apiKey = "868c3f8599fe4ece9974bf166ec9171f";
    String url =
        "https://newsapi.org/v2/everything?q=Top&from=2023-02-11&sortBy=publishedAt&apiKey=$apiKey";
    var response1 = await http.get(Uri.parse(url));
    try {
      if (response1.statusCode == 200) {
        var json = jsonDecode(response1.body);
        setState(() {
          newsResponseCarousel = NewsResponse.fromJson(json);
        });
      } else {
        Fluttertoast.showToast(msg: "Error in fetching news");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "e");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text("News App"), centerTitle: true),
      body: (loading)
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.black12,
                    ),
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.search,
                            color: Colors.indigoAccent,
                          )),
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (val) {
                              if( val.isNotEmpty){
                                textEditingController.text = "";
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Category(query: val);
                              }));
                            }},
                            decoration: const InputDecoration(
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
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Category(query: navBarItem[index]);
                              }));
                            },
                            child: Container(
                                height: 60.0,
                                width: 100,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                    child: Text(
                                  navBarItem[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white),
                                ))),
                          );
                        }),
                  ),
                  if (newsResponseCarousel?.articles != null)
                    CarouselSlider(
                        items: newsResponseCarousel?.articles?.map((item) {
                          return Builder(builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return WebView(url: item.url ?? "");
                                }));
                              },
                              child: Container(
                                  margin: const EdgeInsets.all(15),
                                  width: size.width,
                                  child: Stack(children: [
                                    ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: CachedImage(
                                            height: double.infinity,
                                            imageUrl: item.urlToImage ?? "")),
                                    Positioned(
                                        left: 8,
                                        bottom: 5,
                                        child: SizedBox(
                                          width: size.width * 0.6,
                                          child: Text(
                                            item.title ?? "",
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ))
                                  ])),
                            );
                          });
                        }).toList(),
                        options: CarouselOptions(
                            autoPlay: true, enlargeCenterPage: true)),
                  Container(
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        " Latest News :- ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            decoration: TextDecoration.underline),
                      )),
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return WebView(
                                url: newsResponse?.articles?[index].url ?? "");
                          }));
                        },
                        child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: CachedImage(
                                  imageUrl: newsResponse
                                          ?.articles?[index].urlToImage ??
                                      "",
                                  width: size.width,
                                  height: size.height * 0.3,
                                ),
                              ),
                              Positioned(
                                  left: 7,
                                  bottom: 8,
                                  child: SizedBox(
                                    width: size.width * 0.90,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          newsResponse
                                                  ?.articles?[index].title ??
                                              "",
                                          maxLines: 1,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          newsResponse?.articles?[index]
                                                  .description ??
                                              "",
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              overflow: TextOverflow.ellipsis),
                                        )
                                      ],
                                    ),
                                  ))
                            ])),
                      );
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Category(
                                      query: "India",
                                    )));
                      },
                      child: const Text("Show More"))
                ],
              ),
            ),
    );
  }
}
