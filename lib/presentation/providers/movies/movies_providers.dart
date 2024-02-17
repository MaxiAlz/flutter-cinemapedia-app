import 'package:cinemapedia_app/domain/entities/movie_entitie.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

// caso de uso => para cargar las siguientes peliculas va
typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;
  bool isLoading = false;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    // cargar solo una pagina en la peticion
    // si el loading esta el true sale de la funcion
    if (isLoading) return;

    // aqui pone el loading en true para avisar que esta llamando a la api
    isLoading = true;

    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    // qui pongo un delay antes de cambiar el estado por que sino llama a la api mucho mas rapido
    await Future.delayed(const Duration(milliseconds: 300));
    // aqui avisa que la llamada ya fue hecha y cambia el estado
    isLoading = false;
  }
}
