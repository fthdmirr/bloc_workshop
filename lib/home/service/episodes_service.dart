import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prova1/home/model/character_model.dart';
import 'package:prova1/home/model/episodes_model.dart';

class EpisodesService {
  Future<List<EpisodesModel>> getEpisodes() async {
    final url = Uri.parse('https://rickandmortyapi.com/api/episode');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['results'] as List)
            .map((e) => EpisodesModel.fromJson(e))
            .toList();
      } else {
        throw 'hata';
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
