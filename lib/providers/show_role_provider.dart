import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mafia/Models/player.model.dart';

class ShowRoleProvider extends ChangeNotifier {
  late PlayerModel randomPlayer;
  bool isFliped = false;
  void showRole(bool isFliped, List<PlayerModel> players) {
    this.isFliped = isFliped;
    if (isFliped) {
      if (players.isNotEmpty) {
        var randomIndex = Random().nextInt(players.length);
        randomPlayer = players[randomIndex];
        players.remove(randomPlayer);
      }
    } else {
      isFliped = false;
    }
    notifyListeners();
  }
}
