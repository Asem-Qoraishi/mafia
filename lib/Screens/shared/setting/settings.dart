import 'package:flutter/material.dart';
import 'package:mafia/Models/player.model.dart';
import 'package:mafia/providers/default_roles_provider.dart';
import 'package:mafia/screens/shared/setting/Components/settings_card.dart';
import 'package:mafia/utils/constants/godfather.dart';
import 'package:mafia/utils/helpers/size_config.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  List<PlayerModel> allPlayers = GodfatherConstants.players;
  SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var defaultRolesProvider = Provider.of<DefaultRolesProvider>(context, listen: false);
    defaultRolesProvider.getDefaultRoles();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
        title: const Text(
          'تنظیمات',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: defaultRolesProvider.getDefaultRoles(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While waiting for data, show a loading indicator
                return Container();
              } else if (snapshot.hasError) {
                // If an error occurred, display an error message
                return Text('Error: ${snapshot.error}');
              } else {
                // If data is available, display it
                return Consumer<DefaultRolesProvider>(
                  builder: (context, provider, _) => Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        'نقش های پیش فرض انتخاب شده',
                        style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ...allPlayers
                          .map(
                            (player) => Container(
                              margin: const EdgeInsets.only(top: 8),
                              child: SettingsCard(player: player),
                            ),
                          )
                          .toList(),
                      _buildSaveBtn(context: context, provider: provider),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSaveBtn({
    required BuildContext context,
    required DefaultRolesProvider provider,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 8),
      width: getProportionateScreenWidht(300),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              backgroundColor: const Color.fromRGBO(200, 0, 0, 0.9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
          onPressed: () {
            provider.onSaveDefRoles();
            Navigator.pop(context);
          },
          child: const Text(
            'ذخیره',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
