import 'dart:convert';

import 'package:mafia/utils/constants/godfather.dart';

class PlayerModel {
  late String? name;
  late Side side;
  late String role;
  late String imagePath;
  late String description;

  PlayerModel({
    this.name,
    required this.side,
    required this.role,
    required this.imagePath,
    required this.description,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        name: json['name'],
        side: _toSide[json['side']]!,
        role: json['role'],
        imagePath: json['imagePath'],
        description: json['description'],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "side": side.name,
        "role": role,
        "imagePath": imagePath,
        "description": description,
      };

  static final Map<String, Side> _toSide = {
    'mafia': Side.mafia,
    'citizin': Side.citizin,
    'independent': Side.independent
  };
}
