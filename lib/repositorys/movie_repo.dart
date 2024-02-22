import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:screening2/model/movie_model.dart';

class MovieRepo {
  Future<moviemodel> getMovies() async {
    final response = await http.post(
      Uri.parse('https://hoblist.com/api/movieList'),
      body: {
        "category": "movies",
        "language": "telugu",
        "genre": "all",
        "sort": "voting"
      },
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map<String, dynamic> result = jsonDecode(response.body);
      final movie = moviemodel.fromJson(result);
      return movie;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
