
import 'package:cinemapedia_app/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia_app/infraestructure/repositories/movie_repositorie_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider de unicamente lectura la data que contiene no cambia
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDbDatasource());
});
