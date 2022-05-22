import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prova1/home/model/character_model.dart';

class CharacterService {
  Future<List<CharacterModel>> getCharacter() async {
    final url = Uri.parse('https://rickandmortyapi.com/api/character');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['results'] as List)
            .map((e) => CharacterModel.fromJson(e))
            .toList();
      } else {
        throw 'hata';
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
