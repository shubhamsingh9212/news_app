import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'news_response.dart';

class Category extends StatefulWidget {
  String query;

  Category({Key? key, required this.query}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  NewsResponse? newsResponse;

  void fetchNews(String query) async {
    const apiKey = "2c0c1972db374ce7b12fc847346d7a1d";
    String url = "";

    if (query == "Top News") {
      debugPrint("hello");
      url =
          "https://newsapi.org/v2/everything?q=india%20top%20news&from=2023-02-08&sortBy=publishedAt&apiKey=2c0c1972db374ce7b12fc847346d7a1d";
    } else if (query == "India") {
      url =
          "https://newsapi.org/v2/everything?q=india&from=2023-02-08&sortBy=publishedAt&apiKey=2c0c1972db374ce7b12fc847346d7a1d";
    } else if (query == "World") {
      url =
          "https://newsapi.org/v2/everything?q=World&from=2023-02-08&sortBy=publishedAt&apiKey=2c0c1972db374ce7b12fc847346d7a1d";
    } else if (query == "Finance") {
      url =
          "https://newsapi.org/v2/everything?q=Finance&from=2023-02-08&sortBy=publishedAt&apiKey=2c0c1972db374ce7b12fc847346d7a1d";
    } else if (query == "Health") {
      url =
          "https://newsapi.org/v2/everything?q=health&from=2023-02-08&sortBy=publishedAt&apiKey=2c0c1972db374ce7b12fc847346d7a1d";
    } else {
      url =
          "https://newsapi.org/v2/everything?q=tesla&from=2023-02-08&sortBy=publishedAt&apiKey=2c0c1972db374ce7b12fc847346d7a1d";
    }
    debugPrint("news url : $url");
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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNews(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("NEWS"),
        ),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
                child: const Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Text(
                    " Latest News :- ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.underline),
                  ),
                )),
            Expanded(
              child: ListView.builder(
                itemCount: newsResponse?.articles?.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.all(10),
                      child: Stack(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              newsResponse?.articles?[index].urlToImage ?? "",
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                            left: 7,
                            bottom: 8,
                            child: SizedBox(
                              width: size.width * 0.90,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    newsResponse?.articles?[index].title ?? "",
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
                                    newsResponse
                                            ?.articles?[index].description ??
                                        "",
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            ))
                      ]));
                },
              ),
            )
          ],
        ));
  }
}
