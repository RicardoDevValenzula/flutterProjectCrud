import 'dart:convert';

import 'package:crud_app/models/game.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/customsearch/v1.dart';
import 'package:googleapis_auth/auth.dart';
import 'package:http/http.dart' as http;

class GameService extends ChangeNotifier {
  final String _baseurl = 'flutter-crud-102aa-default-rtdb.firebaseio.com';
  final List<Game> games = [];
  bool isLoading = true;
  bool saving = false;

  late Game gameSelected;

  GameService() {
    loadGames();
  }

  Future<List<Game>> loadGames() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseurl, 'games.json');
    final resp = await http.get(url);
    final Map<String, dynamic> gamesMap = json.decode(resp.body);

    gamesMap.forEach((key, value) {
      final tempGame = Game.fromMap(value);
      tempGame.id = key;
      games.add(tempGame);
    });

    isLoading = false;
    notifyListeners();
    return games;
  }

  Future saveOrCreateGame(Game game) async {
    saving = true;
    notifyListeners();

    if (game.id == null) {
      await createGame(game);
    } else {
      await updateGame(game);
    }

    saving = false;
    notifyListeners();
  }

  Future<String> updateGame(Game game) async {
    final url = Uri.https(_baseurl, 'games/${game.id}.json');
    final resp = await http.put(url, body: game.toJson());
    final decodedData = resp.body;

    final index = this.games.indexWhere((element) => element.id == game.id);
    games[index] = game;

    return game.id!;
  }

  Future<String> createGame(Game game) async {
    final url = Uri.https(_baseurl, 'games.json');
    final resp = await http.post(url, body: game.toJson());
    final decodedData = json.decode(resp.body);

    game.id = decodedData['name'];
    games.add(game);

    return game.id!;
    //return '';
  }
}
