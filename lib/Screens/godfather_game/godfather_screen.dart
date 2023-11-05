import 'package:flutter/material.dart';
import 'package:mafia/screens/about/about_game.dart';
import 'package:mafia/screens/home/home_screen.dart';
import 'package:mafia/screens/shared/gf_cards/last_cards_screen.dart';
import 'package:mafia/screens/shared/select-roles/roles_screen.dart';
import 'package:mafia/screens/shared/setting/settings.dart';
import 'package:mafia/utils/constants/texts.dart';
import 'package:mafia/utils/helpers/navigate_to_page.dart';
import 'package:mafia/utils/helpers/size_config.dart';

class GodfatherScreen extends StatelessWidget {
  const GodfatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            navigateToPage(context, const HomeScreen());
          },
        ),
        title: const Text(
          "پدر خوانده",
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildCardItem(
                cardName: "انتخاب نقش ها",
                imageUrl: 'assets/common_images/select_roles.png',
                onPressed: () {
                  navigateToPage(context, const SelectRolesScreen());
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              _buildCardItem(
                cardName: 'کارت های آخر',
                imageUrl: 'assets/common_images/last_cards.png',
                onPressed: () {
                  navigateToPage(
                    context,
                    const GodfatherLastCardsScreen(),
                  );
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              _buildCardItem(
                cardName: 'درباره بازی',
                imageUrl: 'assets/game_images/godfather.png',
                onPressed: () {
                  navigateToPage(context, AboutGameScreen(gameType: GameType.GODFATHER));
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              _buildCardItem(
                cardName: 'تنظیمات',
                imageUrl: '',
                onPressed: () {
                  navigateToPage(context, SettingsScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardItem({
    required String cardName,
    required String imageUrl,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      clipBehavior: Clip.hardEdge,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
        backgroundColor: const Color.fromRGBO(20, 20, 25, 1),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cardName == 'تنظیمات'
              ? Icon(
                  Icons.settings,
                  size: getProportionateScreenHeight(110),
                )
              : Container(
                  width: getProportionateScreenWidht(160),
                  height: getProportionateScreenHeight(160),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(imageUrl),
                  ),
                ),
          Text(
            cardName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
