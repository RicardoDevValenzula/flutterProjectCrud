import 'package:crud_app/models/game.dart';
import 'package:flutter/material.dart';

class GameService extends ChangeNotifier {
  final String _baseurl = 'flutter-crud-102aa-default-rtdb.firebaseio.com/';
  final List<Game> Games = [];
  //ToDo: Make fetch games
}
