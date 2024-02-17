import 'package:cinemapedia_app/domain/entities/movie_entitie.dart';

abstract class MoviesDatasource {
  //como lucen los lugares de donde consumo la informacion
  // metodos para llamar la informacion de algun lugar

  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopularMovies({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});
}
