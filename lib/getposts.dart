import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class getposts extends StatefulWidget {
  const getposts({Key? key}) : super(key: key);

  @override
  State<getposts> createState() => _getpostsState();
}

class _getpostsState extends State<getposts> {
  List posts = [];

  Future getposts() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    Response response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);

    setState(() {
      posts.addAll(responsebody);
    });
    print(posts);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getposts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "getpost",
            style: TextStyle(color: Colors.yellow),
          ),
          backgroundColor: Colors.black,
        ),
        body: posts == null || posts.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      color: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${posts[index]['title']}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ));
                },
                itemCount: posts.length,
              ));
  }
}
