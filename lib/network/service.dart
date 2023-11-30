import 'dart:convert';

import 'package:example_one/network/list_comic.dart';
import 'package:http/http.dart' as http;
import 'package:example_one/model/comic.dart';

class ComicService{
  static Future<List<Comic>> getComics() async {
    final response = await http.get(
        Uri.parse('http://gateway.marvel.com/v1/public/comics?ts=10&apikey=92c28216186f6cbfc9875952e4a8e19a&hash=d3a395dd599650a665a98a520861b7ce'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final listComics = ListComics.list(jsonResponse['data']['results']);
      return listComics;
    }
    return <Comic>[];
  }
}