import 'dart:convert';

import 'package:crud_app/models/game.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GameService extends ChangeNotifier {
  final String _baseurl = 'flutter-crud-102aa-default-rtdb.firebaseio.com';
  final List<Game> games = [];
  bool isLoading = true;

  late Game gameSelected;

  GameService(){
    loadGames();
  }

  Future<List<Game>> loadGames() async{
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseurl, 'games.json');
    final resp =  await http.get(url);
    final Map<String, dynamic> gamesMap =  json.decode( resp.body );

    gamesMap.forEach((key, value) {
      final tempGame = Game.fromMap(value);
      tempGame.id = key;
      games.add(tempGame);
    });

    isLoading = false;
    notifyListeners();
    return games;

  }
  
}
