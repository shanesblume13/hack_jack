import 'dart:math';

import 'package:hack_jack/advice.dart';

class Hands {
  final List<List<int>> playerHands;
  final List<int> dealerHand;
  final List<int> otherHand;

  Hands(
    this.playerHands,
    this.dealerHand,
    this.otherHand,
  );

  int calcHandScore(List<int> hand) {
    int aceCount = hand.where((v) => v == 11).length;
    int score = hand.fold(0, (p, c) {
      int newScore = p + c;

      while (newScore > 21 && aceCount > 0) {
        newScore -= 10;
        aceCount--;
      }

      return newScore;
    });

    return score;
  }

  bool hasSoftAce(List<int> hand) {
    int aceCount = hand.where((v) => v == 11).length;
    int score = hand.fold(0, (p, c) {
      int newScore = p + c;

      while (newScore > 21 && aceCount > 0) {
        newScore -= 10;
        aceCount--;
      }

      return newScore;
    });

    return score < 21 && aceCount > 0;
  }

  List<int> playerScores() {
    List<int> playerScores = List.empty(growable: true);
    for (List<int> hand in playerHands) {
      playerScores..add(calcHandScore(hand));
    }

    return playerScores;
  }

  int dealerScore() => calcHandScore(dealerHand);

  List<Advice>? splitAdvice() {
    List<int> playerHand = List.empty(growable: true);
    List<Advice> adviceList = List.empty(growable: true);

    for (int i = 0; i < playerHands.length; i++) {
      playerHand = playerHands[i];

      if (playerHand.length != 2 || dealerHand.length != 1) return null;

      //Splits
      if (playerHand[0] == playerHand[1]) {
        // Should Split
        if ((playerHand[0] == 11) ||
            (playerHand[0] == 9 && dealerScore() < 10 && dealerScore() != 7) ||
            (playerHand[0] == 8) ||
            (playerHand[0] == 7 && dealerScore() < 8) ||
            (playerHand[0] == 6 && dealerScore() < 7 && dealerScore() > 2) ||
            (playerHand[0] == 3 && dealerScore() < 8 && dealerScore() > 3) ||
            (playerHand[0] == 2 && dealerScore() < 8 && dealerScore() > 3)) {
          adviceList..add(Advice.split);
        }
        // Conditional Split
        else if ((playerHand[0] == 6 && dealerScore() == 2) ||
            (playerHand[0] == 4 && dealerScore() < 7 && dealerScore() > 4) ||
            (playerHand[0] == 3 && dealerScore() < 4) ||
            (playerHand[0] == 2 && dealerScore() < 4)) {
          adviceList..add(Advice.dasSplit);
        }
        // No split
        else {
          adviceList..add(Advice.noSplit);
        }
      }
    }

    return adviceList;
  }

  List<Advice>? hitAdvice() {
    List<int> scores = playerScores();
    List<Advice> adviceList = List.empty(growable: true);

    for (int i = 0; i < playerHands.length; i++) {
      List<int> playerHand = playerHands[i];
      int handScore = scores[i];
      if (playerHand.length < 2 || dealerHand.length != 1) return null;

      // Need to figure out if aces are available as 11s, not just if the hand
      // contains an 11
      bool playerHasSoftAce = hasSoftAce(playerHand);

      // Hard Hands
      if (!playerHasSoftAce) {
        if ((handScore > 16) ||
            (handScore > 12 && dealerScore() < 7) ||
            (handScore == 12 && dealerScore() > 3 && dealerScore() < 7)) {
          adviceList.add(Advice.stand);
        } else if ((handScore == 11) ||
            (handScore == 10 && dealerScore() < 10) ||
            (handScore == 9 && dealerScore() < 7 && dealerScore() > 2)) {
          adviceList.add(Advice.doubleOrHit);
        } else {
          adviceList.add(Advice.hit);
        }
      }
      // Soft Hands
      else if (playerHasSoftAce) {
        if ((handScore == 20) ||
            (handScore == 19 && dealerScore() != 6) ||
            (handScore == 18 && dealerScore() < 9 && dealerScore() > 6)) {
          adviceList.add(Advice.stand);
        } else if ((handScore == 19 && dealerScore() == 6) ||
            (handScore == 18 && dealerScore() < 7)) {
          adviceList.add(Advice.doubleOrStand);
        } else if ((handScore == 17 &&
                dealerScore() > 2 &&
                dealerScore() < 7) ||
            (handScore == 16 && dealerScore() > 3 && dealerScore() < 7) ||
            (handScore == 15 && dealerScore() > 3 && dealerScore() < 7) ||
            (handScore == 14 && dealerScore() > 4 && dealerScore() < 7) ||
            (handScore == 13 && dealerScore() > 4 && dealerScore() < 7)) {
          adviceList.add(Advice.doubleOrHit);
        } else {
          adviceList.add(Advice.hit);
        }
      }
    }

    return adviceList;
  }

  List<String> adviceText() {
    List<Advice>? splitAdviceList = List.empty(growable: true);
    List<Advice>? hitAdviceList = List.empty(growable: true);
    List<String> adviceTextList = List.empty(growable: true);

    for (int i = 0;
        i <
            max(
              splitAdviceList.length,
              hitAdviceList.length,
            );
        i++) {
      String adviceText = "";
      Advice? splitAdvice = splitAdviceList[i];
      Advice? hitAdvice = hitAdviceList[i];

      switch (splitAdvice) {
        case Advice.split:
          adviceText = "SPLIT";
          break;
        case Advice.dasSplit:
          adviceText = "SPLIT if DAS allowed, otherwise ";
          break;
        default:
          adviceText = "";
      }

      if (splitAdvice != Advice.split) {
        switch (hitAdvice) {
          case Advice.hit:
            adviceText += "HIT";
            break;
          case Advice.stand:
            adviceText += "STAND";
            break;
          case Advice.doubleOrHit:
            adviceText += "DOUBLE or HIT";
            break;
          case Advice.doubleOrStand:
            adviceText += "DOUBLE or STAND";
            break;
          default:
            adviceText += "";
        }
      }

      adviceTextList..add(adviceText);
    }

    return adviceTextList;
  }
}
