import 'dart:convert';

import 'package:http/http.dart' as http;

class WordDetails {
  String? word;
  WordDetails({this.word});

  Future<dynamic> fetchWord() async {
    String link = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';
    final url = Uri.parse(link);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);

        final wordData = jsonResponse[0];

        return wordData; // Return the fetched word data
      }
    } catch (error) {
      print(error);
    }

    return null; // Return null if there was an error or the response was not successful
  }
}
