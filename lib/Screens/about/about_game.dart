import 'package:flutter/material.dart';
import 'package:mafia/utils/constants/texts.dart';

import '../../utils/helpers/size_config.dart';

class AboutGameScreen extends StatelessWidget {
  final GameType gameType;
  AboutGameScreen({Key? key, required this.gameType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: getProportionateScreenWidht(400),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/game_images/godfather.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  titleText(gameType),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white70),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  aboutGameText(gameType),
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
