import 'package:flutter/material.dart';
import 'package:mafia/Models/player.model.dart';
import 'package:mafia/screens/about/components/bottom_sheet.dart';
import 'package:mafia/utils/constants/godfather.dart';
import 'package:mafia/utils/constants/texts.dart';
import 'package:mafia/utils/helpers/size_config.dart';

class AboutRoles extends StatelessWidget {
  GameType gameType;
  late List<PlayerModel> roles;
  AboutRoles({Key? key, required this.gameType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    roles = gameRoles();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(50, 50, 50, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 20, 1),
        title: const Text(
          "معرفی نقش ها",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: _buildCards(context),
      ),
    );
  }

  Widget _buildCards(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 16,
        runSpacing: 16,
        children: roles.map((player) => _card(player, context)).toList(),
      ),
    );
  }

  Widget _card(PlayerModel player, BuildContext context) {
    return ElevatedButton(
      clipBehavior: Clip.hardEdge,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color.fromRGBO(200, 0, 0, 0.9), width: 1),
        ),
      ),
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
      child: Image.asset(
        player.imagePath,
        width: getProportionateScreenWidht(150),
        height: getProportionateScreenHeight(200),
        fit: BoxFit.fill,
        // height: 200,
      ),
    );
  }

  List<PlayerModel> gameRoles() {
    switch (gameType) {
      case GameType.GODFATHER:
        return GodfatherConstants.players;
      case GameType.MAFIA:
        return GodfatherConstants.players;
      // return MafiaConstants.players;
      case GameType.ZODIAC:
        return GodfatherConstants.players;
      //return ZodiacConstants.players;
    }
  }
}
