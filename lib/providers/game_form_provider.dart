import 'package:crud_app/models/models.dart';
import 'package:flutter/material.dart';

class GameFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Game game;

  GameFormProvider(this.game);

  updateGame() {}

  bool isValidForm() {
    print(game.name);
    print(game.hours);

    return formKey.currentState?.validate() ?? false;
  }
}
