// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GameCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          margin: EdgeInsets.only(top: 30, bottom: 40),
          width: double.infinity,
          height: 400,
          decoration: _cardBorders(),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              _BackGroundImage(),
              _GameDetails(),
              Positioned(top: 15, right: 15, child: _RatingTag())
            ],
          ),
        ));
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 6), blurRadius: 10)
          ]);
}

class _RatingTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rating = 3.5;
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      tapOnlyMode: true,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (value) {
        null;
      },
    );
  }

  BoxDecoration _ratingDesing() => BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
}

class _GameDetails extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The Witcher',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Calification',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class _BackGroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
