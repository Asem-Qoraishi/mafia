import 'package:flutter/material.dart';
import 'package:mafia/Models/player.model.dart';

class PlayerProvider extends ChangeNotifier {
  late List<PlayerModel> selectedPlayers = [];

  void addPlayer(PlayerModel player) {
    selectedPlayers.add(player);
    notifyListeners();
  }

  void removePlayer(PlayerModel player) {
    selectedPlayers.remove(player);
    notifyListeners();
  }

  void clear() {
    selectedPlayers.clear();
    notifyListeners();
  }
}
