import 'package:crud_app/widgets/game_card.dart';
import 'package:flutter/material.dart';
import 'package:crud_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games On Sale'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                child: GameCard(),
                onTap: () => Navigator.pushNamed(context, 'newgame'),
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
