import 'package:cinemapedia_app/domain/entities/movie_entitie.dart';

abstract class MoviesRepository {
// los que va a llamar al datasource
// permite cambiar el datasource

  Future<List<Movie>> getNowPlaying({int page = 1});
}
