// ignore_for_file: prefer_const_constructors

import 'package:crud_app/providers/game_form_provider.dart';
import 'package:crud_app/services/game_service.dart';
import 'package:crud_app/ui/inputDecorations.dart';
import 'package:flutter/material.dart';
import 'package:crud_app/widgets/widgets.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final gameService = Provider.of<GameService>(context);
    return 
    ChangeNotifierProvider(
    create: (_)=> GameFormProvider(gameService.gameSelected),
    child: _NewGameBody(gameService: gameService),
    );
  }
}

class _NewGameBody extends StatelessWidget {
  const _NewGameBody({
    Key? key,
    required this.gameService,
  }) : super(key: key);

  final GameService gameService;

  @override
  Widget build(BuildContext context) {
   final gameFormProvider =  Provider.of<GameFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                GameImage(url: gameService.gameSelected.picture,),
                Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    )),
                Positioned(
                    top: 60,
                    right: 25,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ))
              ],
            ),
            _GameForm(),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: () {
          gameFormProvider.isValidForm();
        },
      ),
    );
  }
}

class _GameForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final gameForm = Provider.of<GameFormProvider>(context);
  final game = gameForm.game;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                initialValue: game.name,
                onChanged: (value) => game.name = value,
                validator: (value){
                  if(value == null || value.length <1){
                    return 'Name: REQUIRED';
                  }
                },
                decoration: InputDecorations.authInputDecorations(
                    hintText: 'Game Name', labelText: 'Name: '),
              ),
              SizedBox(height: 30),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?'))
                ],
                initialValue: '${game.hours}',
                onChanged: (value) => game.hours = int.tryParse(value) ==null ? game.hours = 0 : game.hours = int.parse(value),
                validator: (value){
                  if(value == null || value.length <1){
                    return 'Name: REQUIRED';
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecorations(
                    hintText: 'Hours Played', labelText: 'Hours: '),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)));
}
