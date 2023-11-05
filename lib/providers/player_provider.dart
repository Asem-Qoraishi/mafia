import 'package:flutter/material.dart';
import 'package:mafia/Models/player.model.dart';
import 'package:mafia/data/local/roles_sharedpreferences.dart';

class PlayerProvider extends ChangeNotifier {
  late List<PlayerModel> selectedPlayers = [];

  void getDefaultData() async {
    selectedPlayers = await RoleSharedPreferences().getDefaultRoles();
    notifyListeners();
  }

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
