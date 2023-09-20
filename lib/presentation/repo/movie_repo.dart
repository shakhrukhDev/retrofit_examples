

import 'package:dio/dio.dart';
import 'package:retrofit_examples/presentation/models/movie_model.dart';
class MovieRepo {
  String url = "https://api.themoviedb.org/3/movie/now_playing?api_key=1500496dcaf1512b62894bd98ba83f9d&language=en-US";

  MovieRepo() {
    _dio = Dio();
  }

  Dio _dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/movie/now_playing?api_key=1500496dcaf1512b62894bd98ba83f9d&language=en-US",
      contentType: "application/json"
  ));

  Future<List<Results>> getData() async {
    List<Results> list = [];
    final res = await _dio.get(url);
    List listResponse = [];
    for (var item in listResponse) {
      Results results = Results(
          posterPath: item['poster_path'],
          originalTitle: item["original_title"],
          releaseDate: item["release_date"]
      );
      list.add(results);
    }
    return list;
  }
}
