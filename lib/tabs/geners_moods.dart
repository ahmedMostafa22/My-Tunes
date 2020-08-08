import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GenersAndMoods extends StatefulWidget {
  @override
  _GenersAndMoodsState createState() => _GenersAndMoodsState();
}

class _GenersAndMoodsState extends State<GenersAndMoods> {
  String token;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: FutureBuilder(
          future:http.get('https://api.spotify.com/v1/me',
                  headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}),
          builder: (c, s) {
            if (s.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else
              return Center(child: Text(s.data.body.toString()));
          }),
    );
  }
}
