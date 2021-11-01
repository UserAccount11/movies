import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies/providers/movies_provider.dart';
import 'package:movies/models/models.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards(this.movieId);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {

        if(!snapshot.hasData) {
          return Container(
            width: double.infinity,
            height: size.height * 0.3,
            margin: EdgeInsets.only(top: 10),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          width: double.infinity,
          height: size.height * 0.3,
          margin: EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: cast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) {
              return _CastCard(cast[index]);
            },
          ),
        );
      },
    );   
  }
}

class _CastCard extends StatelessWidget {
  
  final Cast actor;

  const _CastCard(this.actor);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: size.width * 0.3,
      height: size.height * 0.3,    
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(actor.fullProfilePath),
              height: size.height * 0.22,
              width: size.width * 0.3,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 5),
          
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}