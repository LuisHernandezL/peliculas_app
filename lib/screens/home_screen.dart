import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              //main card
              CardSwiper(),

              //movie slider
              MovieSlider(),
            ],
          ),
        ));
  }
}
