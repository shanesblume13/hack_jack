import 'package:flutter/material.dart';
import 'package:hack_jack/hand_type.dart';
import 'package:hack_jack/shoe_bloc.dart';
import 'package:hack_jack/widgets/playing_card_body.dart';

class PlayingCardBodyInkWell extends StatelessWidget {
  const PlayingCardBodyInkWell({
    Key? key,
    required this.clickable,
    required this.handType,
    required this.value,
    required this.handIndex,
    required this.size,
    required this.valueString,
    required this.removeCard,
    required this.cardIndex,
  }) : super(key: key);

  final bool clickable;
  final HandType handType;
  final int value;
  final int handIndex;
  final double size;
  final String valueString;
  final bool removeCard;
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {
          if (clickable) {
            if (removeCard) {
              ShoeBloc.undoShoeState(
                  handType, cardIndex, value, context, handIndex);
            } else {
              ShoeBloc.updateShoeState(handType, value, context, handIndex);
            }
            Navigator.pop(context);
          }
        },
        child: PlayingCardBody(size: size, valueString: valueString),
      ),
    );
  }
}
