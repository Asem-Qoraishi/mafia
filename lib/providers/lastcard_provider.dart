import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mafia/Models/last_card.model.dart';

class LastCardProvider extends ChangeNotifier {
  bool shouldDie = true;

  void showLastCard(LastCard card) {
    card.isUsed = true;
    notifyListeners();
  }

  /// reset all last cards in a random index in the array
  void resetAll(List<LastCard> lastCards) {
    for (int i = 0; i < lastCards.length; i++) {
      lastCards[i].isUsed = false;
    }
    for (int i = 0; i < 10; i++) {
      var randomCard = lastCards[Random().nextInt(lastCards.length)];
      lastCards.remove(randomCard);
      lastCards.add(randomCard);
    }
    notifyListeners();
  }
}
