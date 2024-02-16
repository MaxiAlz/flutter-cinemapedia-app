import 'package:cinemapedia_app/config/constants/enviroment.dart';
import 'package:flutter/material.dart';

class HomeMoviesScreen extends StatelessWidget {
  static const name = 'home-movies-screen';
  const HomeMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(Enviroment.theMovieDbKey),
    ));
  }
}
