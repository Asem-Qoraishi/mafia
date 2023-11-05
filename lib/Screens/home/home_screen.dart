import 'package:flutter/material.dart';
import 'package:mafia/Screens/home/components/games_card.dart';
import 'package:mafia/screens/godfather_game/godfather_screen.dart';
import 'package:mafia/screens/mafia_game/mafia_screen.dart';
import 'package:mafia/utils/helpers/navigate_to_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
      appBar: AppBar(
        elevation: 0,
        leading: null,
        title: const Text(
          'بازی های مافیا',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GamesCard(
                onPressed: () {
                  navigateToPage(context, const GodfatherScreen());
                },
                imageUrl: 'assets/game_images/godfather.png',
              ),
              GamesCard(
                onPressed: () {
                  navigateToPage(context, const MafiaScreen());
                },
                imageUrl: 'assets/game_images/mafia.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
