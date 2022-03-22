import 'package:flutter/material.dart';
import 'package:hack_jack/hand_type.dart';
import 'package:hack_jack/shoe_bloc.dart';
import 'package:hack_jack/widgets/playing_card.dart';

class CardSelectList extends StatelessWidget {
  CardSelectList({
    Key? key,
    required this.handType,
    required this.handIndex,
    required this.removeCard,
    required this.shoeState,
  }) : super(key: key);

  final HandType handType;
  final int handIndex;
  final bool removeCard;
  final ShoeState shoeState;

  @override
  Widget build(BuildContext context) {
    List<int> cardValueList = List.empty(growable: true);
    List<PlayingCard> cardList = List.empty(growable: true);

    if (!removeCard) {
      cardValueList = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    } else {
      switch (handType) {
        case HandType.dealer:
          cardValueList = shoeState.dealerHand;
          break;
        case HandType.other:
          cardValueList = shoeState.otherCards;
          break;
        case HandType.player:
          cardValueList = shoeState.playerHands[handIndex];
          break;
        default:
          cardValueList = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
      }
    }

    for (int i = 0; i < cardValueList.length; i++) {
      cardList
        ..add(
          PlayingCard(
            value: cardValueList[i],
            size: 30,
            handType: handType,
            handIndex: handIndex,
            clickable: true,
            removeCard: removeCard,
            cardIndex: i,
          ),
        );
    }

    return Wrap(
      spacing: 5,
      runSpacing: 5,
      alignment: WrapAlignment.center,
      children: cardList,
    );
  }
}
