import 'dart:convert';
import 'package:http/http.dart';
import '../api/url.dart';
import '../methods/get_response.dart';
import '../models/song_model.dart';
import '../models/user.dart';

class GetHomePage {
  Future<List<User>> getUsers() async {
    final Map<String, String> query = {
      "page": 0.toString(),
      "limit": 26.toString()
    };
    final res = await getResponse(Uri.https(baseUrl, '$basePath/users', query));
    print(res.statusCode.toString());
    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      final users = (body['results'] as List)
          .map<User>((user) => User.fromJson(user))
          .toList();
      return users;
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<List<SongModel>> getSongs() async {
    final query = {"limit": 30.toString()};
    Response value = await getResponse(Uri.https(
      baseUrl,
      '$basePath/songs/random/all',
      query,
    ));
    if (value.statusCode == 200) {
      var body = jsonDecode(value.body);
      final songs =
          (body['results'] as List).map((v) => SongModel.fromJson(v)).toList();
      print(songs);
      return songs;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
