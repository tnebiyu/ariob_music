import 'package:ariob_music/model/songs_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SongManagement {
  List<Songs>? songs;
 // List<RegisteredStudent> registeredList = [];

  fetchStudent() async {
    try {
      const url = 'http://10.0.2.2:8080/api/v1/students';

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
       songs = [];
        var decodedData = jsonDecode(response.body) as List<dynamic>;
        for (var json in decodedData) {
          songs?.add(Songs.fromJson(json));
        }
      } else {
        throw Exception("Error loading data");
      }
    } catch (e) {
      throw Exception("Error loading data");
    }
  }

  Future<List<Songs>> getStudent() async {
    if (songs == null) {
      await fetchStudent();
    }
    return songs!;
  }
}