import 'package:flutter/material.dart';
import 'package:hack_jack/hand_type.dart';
import 'package:hack_jack/my_colors.dart';
import 'package:hack_jack/shoe_bloc.dart';
import 'package:hack_jack/widgets/card_select_list.dart';
import 'package:hack_jack/widgets/hand_card_list.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HandArea extends StatelessWidget {
  const HandArea({
    Key? key,
    required this.areaName,
    required this.flex,
    required this.handType,
    required this.shoeState,
    required this.handIndex,
  }) : super(key: key);

  final String areaName;
  final int flex;
  final HandType handType;
  final ShoeState shoeState;
  final int handIndex;

  @override
  Widget build(BuildContext context) {
    Color handAreaColor;

    switch (handType) {
      case HandType.dealer:
        handAreaColor = myAccentColor;
        break;
      case HandType.other:
        handAreaColor = myPrimaryColor;
        break;
      default:
        handAreaColor = Colors.white;
    }

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(2), //(8, 4, 8, 4),
        child: Material(
          type: MaterialType.card,
          elevation: 5,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          color: handAreaColor,
          child: Ink(
            child: InkWell(
              onTap: () => _onHandAreaTap(context, handType, handIndex, false),
              onLongPress: () =>
                  _onHandAreaTap(context, handType, handIndex, true),
              child: Column(
                children: [
                  getHandAreaLabel(context, shoeState, handType, areaName),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: HandCardList(
                            handType: handType,
                            shoeState: shoeState,
                            handIndex: handIndex,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded getHandAreaLabel(BuildContext context, ShoeState shoeState,
      HandType handType, String areaName) {
    String areaNameLabel = areaName;

    if (handType == HandType.player) {
      areaNameLabel += " ([Some Advice])";
    }

    return Expanded(
      child: Row(
        children: [
          Text("$areaNameLabel"),
        ],
      ),
    );
  }

  _onHandAreaTap(
      BuildContext context, HandType handType, int handIndex, bool removeCard) {
    String handTypeText = "";

    switch (removeCard) {
      case true:
        handTypeText = "Remove card from ";
        break;
      case false:
        handTypeText = "Add card to ";
        break;
    }

    switch (handType) {
      case HandType.dealer:
        handTypeText += "DEALER:";
        break;
      case HandType.other:
        handTypeText += "OTHER:";
        break;
      case HandType.player:
        handTypeText += "PLAYER (${handIndex + 1}):";
        break;
    }

    Alert(
      context: context,
      type: AlertType.none,
      title: handTypeText,
      content: Column(
        children: [
          CardSelectList(
            handType: handType,
            handIndex: handIndex,
            removeCard: removeCard,
            shoeState: shoeState,
          ),
        ],
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: myAccentColor,
        ),
      ],
    ).show();
  }
}
