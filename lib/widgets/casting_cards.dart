import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: size.height * 0.3,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          return _CastCard();
        },
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  
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
              image: NetworkImage('https://via.placeholder.com/150x300'),
              height: size.height * 0.25,
              width: size.width * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'actor.name kjsdaksbdakjsdakjdbkasjbdaksnda dakdsfjnask',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}