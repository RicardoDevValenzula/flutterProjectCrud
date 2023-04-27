// To parse this JSON data, do
//
//     final game = gameFromMap(jsonString);

import 'dart:convert';

class Game {
    bool available;
    String name;
    String? picture;
    double? rating;
    String? id;
    int? hours;

    Game({
        required this.available,
        required this.name,
        this.picture,
        this.rating,
        this.hours,
        this.id
    });

    factory Game.fromJson(String str) => Game.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Game.fromMap(Map<String, dynamic> json) => Game(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        hours: json["hours"],
        rating: json["rating"]?.toDouble()
    );

    Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "rating": rating?.toDouble(),
        "hours" : hours
    };

    Game copy() => Game(available: available, name: name, rating: rating,picture: picture, hours: hours, id: id);
}
