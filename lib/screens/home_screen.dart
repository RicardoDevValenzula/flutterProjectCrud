import 'package:crud_app/screens/screens.dart';
import 'package:crud_app/widgets/game_card.dart';
import 'package:flutter/material.dart';
import 'package:crud_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadGames = Provider.of<GameService>(context);
    if(loadGames.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
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
        onPressed: () {},
      ),
    );
  }
}
