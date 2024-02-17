import 'package:cinemapedia_app/domain/entities/movie_entitie.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  
  final nowPlayinMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayinMovies.isEmpty) return [];

  return nowPlayinMovies.sublist(0, 6);
});
