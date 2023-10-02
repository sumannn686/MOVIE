import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/constrain/api/api.dart';
import 'package:movie/constrain/models/movie.dart';

//create future provider
final moviePopular = FutureProvider(
    (ref) => MovieService.getPopularMovieData(apiPath: Api.popularMovie));
final movieTopRated = FutureProvider(
    (ref) => MovieService.getPopularMovieData(apiPath: Api.topRatedMovie));
final movieUpComing = FutureProvider(
    (ref) => MovieService.getPopularMovieData(apiPath: Api.upcomingMovie));

class MovieService {
  static final dio = Dio();
  static Future<List<Movie>> getPopularMovieData(
      {required String apiPath}) async {
    try {
      final response =
          await dio.get(apiPath,
              options: Options(headers: {
                'Authorization':
                    'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NTczYmRhYWFlMDY2NTA2ZjIwMGIzN2M4ZGM1NGU1MSIsInN1YiI6IjY0ZGM2YzI5ZDEwMGI2MDBlMjZiZWQ1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.quY1jPUT9pq7a8YcoPmZRycZ5OJVYO_6fvlGfYGYgPo'
              }));
      return (response.data['results'] as List)
          .map((e) => Movie.fromJson(e))
          .toList(); //important-- connect model with api
    } on DioException catch (err) {
      throw '${err.message}';
    }
  }
}
