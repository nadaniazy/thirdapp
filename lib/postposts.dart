import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
class postposts extends StatefulWidget {
  const postposts({Key? key}) : super(key: key);

  @override
  State<postposts> createState() => _postpostsState();
}

class _postpostsState extends State<postposts> {

  addposts()async{
    var url="https://jsonplaceholder.typicode.com/posts";
    var respose=await http.post(Uri.parse(url),body: {
      "title":'nada',
      "userId":"3",
      "body":"hallo world"

    });
    var responsebody=jsonDecode(respose.body);

    print(responsebody);
    return responsebody;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "addpost"
        ),

      ),
      body: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "enter your email",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "enter your password",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.local_phone),
            ),
          ),
          ElevatedButton(onPressed: (){
            addposts();}, child: Text("addpost"),),

        ],
      ),
    );
  }
}
