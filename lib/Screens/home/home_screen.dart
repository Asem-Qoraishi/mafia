import 'package:flutter/material.dart';
import 'package:mafia/Screens/home/components/games_card.dart';
import 'package:mafia/helpers/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(50, 50, 50, 1),
      appBar: AppBar(
        title: const Text(
          'Mafia Games',
          style: TextStyle(fontSize: 24, color: Color.fromRGBO(200, 0, 0, 1)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0, 0, 20, 1),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              GamesCard(
                onPressed: () {},
                imageUrl: 'assets/game_images/godfather.png',
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              GamesCard(
                onPressed: () {},
                imageUrl: 'assets/game_images/mafia.png',
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
