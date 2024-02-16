import 'package:cinemapedia_app/config/constants/enviroment.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeMoviesScreen extends StatelessWidget {
  static const name = 'home-movies-screen';
  const HomeMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayinMovies = ref.watch(nowPlayingMoviesProvider);
    return ListView.builder(
      itemCount: nowPlayinMovies.length,
      itemBuilder: (BuildContext context, int index) {
        final movie = nowPlayinMovies[index];
        return ListTile(
          title: Text(movie.title),
        );
      },
    );
  }
}
