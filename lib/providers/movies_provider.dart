import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('movies provider inicializado');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    print('getOndisplayMovies');
  }
}
