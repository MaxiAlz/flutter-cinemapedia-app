import 'package:cinemapedia_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeMoviesScreen.name,
      builder: (context, state) => const HomeMoviesScreen(),
    ),
  ],
);
