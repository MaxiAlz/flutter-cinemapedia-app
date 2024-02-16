import 'package:cinemapedia_app/domain/entities/movie_entitie.dart';

abstract class MovieRepository {
// los que va a llamar al datasource
// permite cambiar el datasource

  Future<List<Movie>> getPlaying({int page = 1});
}
