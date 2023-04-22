import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/songs_model.dart';
import 'package:http/http.dart' as http;

class SongService with ChangeNotifier{
  List<Songs>? _songsList;
  fetchSongs() async{
    try {
      const url = 'http://localhost:8080/api/v1/songs';

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _songsList = [];
        var decodedData = jsonDecode(response.body) as List<dynamic>;
        for (var json in decodedData) {
          _songsList?.add(Songs.fromJson(json));
        }
      } else {
        throw Exception("Error loading data");
      }
    } catch (e) {
      throw Exception("Error loading data");
    }
    notifyListeners();
  }



  Future<List<Songs>> getSongs() async{
    if(_songsList == null){
      await fetchSongs();
      notifyListeners();
    }

    notifyListeners();
    return _songsList ?? [];

  }

}