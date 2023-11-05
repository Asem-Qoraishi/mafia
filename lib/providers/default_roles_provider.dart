import 'package:flutter/material.dart';
import 'package:mafia/Models/player.model.dart';
import 'package:mafia/data/local/roles_sharedpreferences.dart';

class DefaultRolesProvider extends ChangeNotifier {
  late List<PlayerModel> defaultRoles = [];

  void onSaveDefRoles() {
    var roleSP = RoleSharedPreferences();
    roleSP.saveDefaultRoles(defaultRoles);
    notifyListeners();
  }

  Future<List<PlayerModel>> getDefaultRoles() async {
    var roleSP = RoleSharedPreferences();
    defaultRoles = await roleSP.getDefaultRoles();
    print(defaultRoles.length);
    return defaultRoles;
  }

  void addPlayer(PlayerModel player) {
    defaultRoles.add(player);
    notifyListeners();
  }

  void removePlayer(PlayerModel player) {
    int index = defaultRoles.indexWhere((element) => element.role == player.role);
    defaultRoles.removeAt(index);
    notifyListeners();
  }
}
