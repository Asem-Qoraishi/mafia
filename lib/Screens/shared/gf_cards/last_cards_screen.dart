import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mafia/Models/last_card.model.dart';
import 'package:mafia/screens/godfather_game/godfather_screen.dart';
import 'package:mafia/utils/constants/godfather.dart';
import 'package:mafia/providers/lastcard_provider.dart';
import 'package:mafia/utils/helpers/navigate_to_page.dart';
import 'package:mafia/utils/helpers/size_config.dart';
import 'package:provider/provider.dart';

class GodfatherLastCardsScreen extends StatefulWidget {
  const GodfatherLastCardsScreen({Key? key}) : super(key: key);

  @override
  State<GodfatherLastCardsScreen> createState() => _GodfatherLastCardsScreenState();
}

class _GodfatherLastCardsScreenState extends State<GodfatherLastCardsScreen> {
  late List<LastCard> lastCards = GodfatherConstants.lastCards;
  late LastCardProvider lastCardProvider;
  @override
  void initState() {
    lastCardProvider = Provider.of<LastCardProvider>(context, listen: false);
    lastCardProvider.resetAll(lastCards);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(40, 40, 45, 1),
        title: const Text(
          "کارت حرکت آخر",
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            navigateToPage(context, const GodfatherScreen());
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              lastCardProvider.resetAll(lastCards);
            },
            icon: const Icon(
              Icons.refresh_rounded,
              color: Color.fromRGBO(200, 0, 0, 1),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Consumer<LastCardProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                ..._buildLastCards(),
                _deathLotBtn(),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildLastCards() {
    return [
      Card(
        elevation: 0,
        // shadowColor: const Color.fromRGBO(200, 0, 0, 1),
        color: const Color.fromRGBO(30, 30, 35, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.expand_more_sharp,
                color: Colors.white.withOpacity(0.9),
              ),
              Text(
                'کارت های حرکت آخر',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.9),
                ),
              )
            ],
          ),
        ),
      ),
      const Divider(),
      Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: List.generate(lastCards.length, (index) => _buildLastCard(index)),
      )
    ];
  }

  Widget _buildLastCard(int cardNumber) {
    // var cardNames = lastCards.map((lastCard) => lastCard.name).toList();
    LastCard card = lastCards[cardNumber];
    var isUsed = card.isUsed;
    Color borderColor = !isUsed ? Colors.blueGrey : Colors.grey;
    return ElevatedButton(
      onPressed: isUsed
          ? null
          : () async {
              await showDialog(
                context: context,
                builder: (context) => _cardDialog(card: card),
              );
              // isLoading = false;
            },
      clipBehavior: Clip.hardEdge,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        shadowColor: borderColor,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: isUsed
            ? SizedBox(
                width: getProportionateScreenWidht(120),
                height: getProportionateScreenHeight(160),
                child: Image(
                  image: AssetImage(card.imagePath),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              )
            : Container(
                width: getProportionateScreenWidht(120),
                height: getProportionateScreenHeight(160),
                color: const Color.fromRGBO(200, 0, 0, 1),
                alignment: Alignment.center,
                child: Text(
                  '${cardNumber + 1}',
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
    );
  }

  Widget _deathLotBtn() {
    var titleTextStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(180),
      margin: const EdgeInsets.only(top: 30),
      child: ElevatedButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => _cardDialog(),
          );
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(20, 20, 25, 1),
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.transparent),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Image(
                image: AssetImage('assets/common_images/death_lot.png'),
              ),
            ),
            Text(
              'قرعه مرگ',
              style: titleTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog _cardDialog({LastCard? card}) {
    String imagePath;
    if (card == null) {
      imagePath = 'assets/common_images/life.png';
      bool isLife = Random().nextBool();
      imagePath = isLife ? imagePath : 'assets/common_images/death.png';
    } else {
      imagePath = card.imagePath;
    }

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      actionsPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.black,
      actionsAlignment: MainAxisAlignment.center,
      alignment: Alignment.center,
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: Colors.red.shade900),
      ),
      actions: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: ElevatedButton(
            onPressed: () {
              if (card != null) lastCardProvider.showLastCard(card);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(200, 0, 0, 1),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text(
              'تایید',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
      content: Image.asset(
        width: getProportionateScreenWidht(375),
        // height: getProportionateScreenHeight(400),
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }
}
