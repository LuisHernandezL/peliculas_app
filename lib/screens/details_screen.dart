// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(),
            _Overview(),
            _Overview(),
            _Overview(),
            CastingCards()
          ]),
        ),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.gif'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title',
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
              Text('movie.Originaltitle',
                  style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  SizedBox(width: 5),
                  Text('movie.voteAverage', style: textTheme.caption)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras rhoncus fermentum ligula, sit amet auctor tellus rutrum vitae. Maecenas auctor maximus magna in interdum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean hendrerit vulputate lacus, ac mattis sapien convallis ac. Pellentesque scelerisque lobortis porttitor. Mauris vitae tristique enim. Nam ligula arcu, aliquet ut quam nec, pharetra facilisis diam. Vestibulum vulputate imperdiet dolor, auctor vehicula dui tempor ut. Nam eget justo ac ante venenatis ornare vel at quam. Quisque in convallis nisl. Curabitur tincidunt faucibus placerat.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
