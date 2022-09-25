import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/seach/search_delegate.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: const Icon(Icons.search_outlined),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //main card
              CardSwiper(
                movies: moviesProvider.onDisplayMovies,
              ),

              //movie slider
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
