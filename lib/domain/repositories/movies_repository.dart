import 'package:cinemapedia_app/domain/entities/movie_entitie.dart';

abstract class MoviesRepository {
// los que va a llamar al datasource
// permite cambiar el datasource

  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopularMovies({int page = 1});
  
  Future<List<Movie>> getUpcoming({int page = 1});
}
