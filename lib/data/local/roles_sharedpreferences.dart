import 'dart:convert';

import 'package:mafia/Models/player.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RoleSharedPreferences {
  static const String _DEFAULT_SELECTED_ROLES = 'selected_roles';

  /// This save the roles as default,
  /// when you got to the selection roles screen this default roles are selected as default.
  void saveDefaultRoles(List<PlayerModel> players) async {
    var sp = await SharedPreferences.getInstance();
    //this line convert the player models to json and save it to the list.
    List<String> playerList = players.map((player) => jsonEncode(player.toJson())).toList();
    sp.setStringList(_DEFAULT_SELECTED_ROLES, playerList);
  }

  Future<List<PlayerModel>> getDefaultRoles() async {
    var sp = await SharedPreferences.getInstance();
    //this is a json playerModel List
    List<String>? json = sp.getStringList(_DEFAULT_SELECTED_ROLES);
    List<PlayerModel> selectedPlayers = [];
    if (json != null) {
      selectedPlayers = json.map((player) => PlayerModel.fromJson(jsonDecode(player))).toList();
    }
    return selectedPlayers;
  }
}
