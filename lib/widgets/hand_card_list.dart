import 'package:flutter/material.dart';
import 'package:hack_jack/hand_type.dart';
import 'package:hack_jack/shoe_bloc.dart';
import 'package:hack_jack/widgets/playing_card.dart';

class HandCardList extends StatelessWidget {
  const HandCardList({
    required this.handType,
    required this.shoeState,
    required this.handIndex,
  });

  final HandType handType;
  final ShoeState shoeState;
  final int handIndex;

  @override
  Widget build(BuildContext context) {
    List<int> hand = List.empty(growable: true);
    List<Widget> cardList = List.empty(growable: true);

    switch (handType) {
      case HandType.dealer:
        hand = shoeState.dealerHand;
        break;
      case HandType.player:
        hand = shoeState.playerHands[handIndex];
        break;
      case HandType.other:
        hand = shoeState.otherCards;
        break;
    }

    for (int i = 0; i < hand.length; i++) {
      cardList
        ..add(
          Positioned(
            left: 10 + (i * 30),
            child: PlayingCard(
              value: hand[i],
              size: 20,
              handType: handType,
              handIndex: handIndex,
              clickable: false,
              removeCard: false,
              cardIndex: i,
            ),
          ),
        );
    }

    return Row(
      children: [
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: cardList,
          ),
        ),
      ],
    );
  }
}
