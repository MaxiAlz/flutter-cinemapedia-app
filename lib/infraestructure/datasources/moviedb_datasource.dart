import 'package:cinemapedia_app/config/constants/enviroment.dart';
import 'package:cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/movie_entitie.dart';
import 'package:cinemapedia_app/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_app/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': 'es-MX'
      }));

// creo una instancia para
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDbResponse.results
        .where((movieDb) => movieDb.posterPath != 'no-poster')
        .map((movieDb) =>
            //crea la instancia de un movie con el mapper

            MovieMapper.movieDBToEntity(movieDb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
    // final movieDbResponse = MovieDbResponse.fromJson(response.data);

    // final List<Movie> movies = movieDbResponse.results
    //     .where((movieDb) => movieDb.posterPath != 'no-poster')
    //     .map((movieDb) =>
    //         //crea la instancia de un movie con el mapper

    //         MovieMapper.movieDBToEntity(movieDb))
    //     .toList();

    // return movies;
  }

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});

    // final movieDbResponse = MovieDbResponse.fromJson(response.data);

    // final List<Movie> movies = movieDbResponse.results
    //     .where((movieDb) => movieDb.posterPath != 'no-poster')
    //     .map((movieDb) =>
    //         //crea la instancia de un movie con el mapper

    //         MovieMapper.movieDBToEntity(movieDb))
    //     .toList();

    // return movies;
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final apiResponse =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});

    return _jsonToMovies(apiResponse.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final apiResponse =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});

    return _jsonToMovies(apiResponse.data);
  }
}
