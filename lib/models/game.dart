// To parse this JSON data, do
//
//     final game = gameFromJson(jsonString);
import 'dart:convert';

class Game {
  bool available;
  String name;
  String? picture;
  int rating;

  Game({
    required this.available,
    required this.name,
    this.picture,
    required this.rating,
  });

  factory Game.fromRawJson(String str) => Game.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "name": name,
        "picture": picture,
        "rating": rating,
      };
}
