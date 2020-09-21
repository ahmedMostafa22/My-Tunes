import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GenersProvider with ChangeNotifier {
  List<String> geners = [];
  Future fetchGeners(String token) async {
    if(geners.isEmpty){
    var response, data;
    response = await http.get(
        'https://api.spotify.com/v1/recommendations/available-genre-seeds',
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    data = json.decode(response.body);
    data['genres'].forEach((ge) => geners.add(ge));
    print('SSSSSSSSSSSSSSSSSSSSSSSSSS'+geners.length.toString());
    }
  }
}
