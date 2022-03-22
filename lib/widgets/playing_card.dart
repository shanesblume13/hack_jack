import 'package:flutter/material.dart';
import 'package:hack_jack/hand_type.dart';
import 'package:hack_jack/my_colors.dart';
import 'package:hack_jack/widgets/playing_card_body.dart';
import 'package:hack_jack/widgets/playing_card_body_ink_well.dart';

class PlayingCard extends StatelessWidget {
  const PlayingCard({
    Key? key,
    required this.value,
    required this.size,
    required this.handType,
    required this.handIndex,
    required this.clickable,
    required this.removeCard,
    required this.cardIndex,
  }) : super(key: key);

  final int value;
  final double size;
  final HandType handType;
  final int handIndex;
  final bool clickable;
  final bool removeCard;
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    String valueString = value.toString();
    if (value == 11) valueString = "A";

    Widget playingCard = clickable
        ? PlayingCardBodyInkWell(
            clickable: clickable,
            handType: handType,
            value: value,
            handIndex: handIndex,
            size: size,
            valueString: valueString,
            removeCard: removeCard,
            cardIndex: cardIndex,
          )
        : PlayingCardBody(size: size, valueString: valueString);

    return Material(
      type: MaterialType.canvas,
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: myAccentColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: playingCard,
    );
  }
}
