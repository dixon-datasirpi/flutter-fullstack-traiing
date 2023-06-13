import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post extends StatefulWidget {
  const Post({
    super.key,
  });

  @override
  State<Post> createState() => _Posts();
}

class _Posts extends State<Post> {
  List<dynamic> postData = [];

  fetchData() async {
    // Free API from typecode
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responseMap =
            jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
        setState(() {
          postData = responseMap;
        });
      }
    } catch (error) {
      print('Error: $error');
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(), // The asynchronous operation
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return postData.isNotEmpty
            ? ListView.builder(
                itemCount: postData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        "${postData[index]['title']} - ${postData[index]['body']}"),
                  );
                },
              )
            : const Text("Loading");
      },
    );
  }
}
