// ignore_for_file: unnecessary_new

import 'package:crud_app/models/game.dart';
import 'package:crud_app/screens/screens.dart';
import 'package:crud_app/widgets/game_card.dart';
import 'package:flutter/material.dart';
import 'package:crud_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'package:googleapis/customsearch/v1.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadGames = Provider.of<GameService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);
    if (loadGames.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
        leading: IconButton(
          onPressed: () {
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');
          },
          icon: Icon(Icons.login_outlined),
        ),
      ),
      body: ListView.builder(
          itemCount: loadGames.games.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                child: GameCard(
                  game: loadGames.games[index],
                ),
                onTap: () {
                  loadGames.gameSelected = loadGames.games[index].copy();
                  Navigator.pushNamed(context, 'newgame');
                },
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          loadGames.gameSelected = new Game(
            available: true,
            name: '',
            hours: 0,
            rating: 0.0,
          );
          Navigator.pushNamed(context, 'newgame');
        },
      ),
    );
  }
}
