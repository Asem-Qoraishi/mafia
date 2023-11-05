import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mafia/Models/player.model.dart';
import 'package:mafia/providers/default_roles_provider.dart';
import 'package:mafia/screens/about/components/bottom_sheet.dart';
import 'package:mafia/utils/helpers/card_border_color.dart';
import 'package:mafia/utils/helpers/persian_role.dart';
import 'package:provider/provider.dart';

class SettingsCard extends StatelessWidget {
  SettingsCard({Key? key, required this.player}) : super(key: key);
  PlayerModel player;
  late DefaultRolesProvider defaultRolesProvider;
  @override
  Widget build(BuildContext context) {
    defaultRolesProvider = Provider.of<DefaultRolesProvider>(
      context,
      listen: false,
    );

    return Card(
      color: const Color.fromRGBO(20, 20, 25, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        // side: BorderSide(color: cardBorderColor(player.side), width: 0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildImage(),
            Text(
              toPersian(player.role),
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      builder: (context) => AboutBottomSheet(player: player),
                    );
                  },
                  icon: const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                CupertinoSwitch(
                  trackColor: Colors.blueGrey,
                  value: isSelected(player),
                  // value: false,
                  onChanged: (isOn) {
                    if (isOn) {
                      defaultRolesProvider.addPlayer(player);
                    } else {
                      defaultRolesProvider.removePlayer(player);
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
          side: BorderSide(
            color: cardBorderColor(player.side),
          )
          // shape: BoxShape.circle,
          ),
      child: Image.asset(
        player.imagePath,
        width: 70,
        height: 70,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }

  isSelected(PlayerModel player) {
    var index = defaultRolesProvider.defaultRoles.indexWhere((element) => element.role == player.role);
    return index == -1 ? false : true;
  }
}
