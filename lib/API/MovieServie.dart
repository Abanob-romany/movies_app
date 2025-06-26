import 'dart:convert';
import 'package:http/http.dart' as http;import 'Models/MovieModel.dart';

Future<Movie?> fetchMovieDetails(String queryTerm) async {
  final response = await http.get(
    Uri.parse('https://yts.mx/api/v2/list_movies.json?query_term=$queryTerm'),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final movies = data['data']['movies'] as List?;
    if (movies != null && movies.isNotEmpty) {
      return Movie.fromJson(movies[0]);
    }
  }
  return null;
}
