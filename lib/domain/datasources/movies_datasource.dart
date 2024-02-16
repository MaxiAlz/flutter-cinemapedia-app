import 'package:cinemapedia_app/domain/entities/movie_entitie.dart';

abstract class MovieDatasource {
  //como lucen los lugares de donde consumo la informacion
  // metodos para llamar la informacion de algun lugar

  Future<List<Movie>> getPlaying({int page = 1});
}
