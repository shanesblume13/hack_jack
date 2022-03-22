import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_jack/hand_type.dart';
import 'package:hack_jack/shoe_event.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  /// {@macro counter_bloc}
  ShoeBloc()
      : super(new ShoeState(
          HandType.dealer,
          8 * 52,
          0,
          List.empty(growable: true),
          List.empty(growable: true)
            ..add(
              List.empty(growable: true),
            ),
          List.empty(growable: true),
          1,
          5,
          0,
          0,
        ));

  @override
  Stream<ShoeState> mapEventToState(ShoeEvent event) async* {
    //update cardsRemaining
    switch (event) {
      case ShoeEvent.removeCardRemaining:
        yield state.copyWith(cardsRemaining: state.cardsRemaining - 1);
        break;
      case ShoeEvent.addCardRemaining:
        yield state.copyWith(cardsRemaining: state.cardsRemaining + 1);
        break;
      case ShoeEvent.plusHalfRawCount:
        yield state.copyWith(rawCount: state.rawCount + .5);
        break;
      case ShoeEvent.plusOneRawCount:
        yield state.copyWith(rawCount: state.rawCount + 1);
        break;
      case ShoeEvent.plusTwoRawCount:
        yield state.copyWith(rawCount: state.rawCount + 2);
        break;
      case ShoeEvent.minusHalfRawCount:
        yield state.copyWith(rawCount: state.rawCount - .5);
        break;
      case ShoeEvent.minusOneRawCount:
        yield state.copyWith(rawCount: state.rawCount - 1);
        break;
      case ShoeEvent.minusTwoRawCount:
        yield state.copyWith(rawCount: state.rawCount - 2);
        break;
      case ShoeEvent.targetDealer:
        yield state.copyWith(handType: HandType.dealer);
        break;
      case ShoeEvent.targetPlayer:
        yield state.copyWith(handType: HandType.player);
        break;
      case ShoeEvent.targetOther:
        yield state.copyWith(handType: HandType.other);
        break;
      case ShoeEvent.updateHandIndex:
        yield state.copyWith(handIndex: state.handIndex);
        break;
      case ShoeEvent.newShoe:
        yield state.copyWith(
          cardsRemaining: 8 * 52,
          rawCount: 0,
          dealerHand: List.empty(growable: true),
          playerHands: List.empty(growable: true)
            ..add(
              List.empty(
                growable: true,
              ),
            ),
          otherCards: List.empty(growable: true),
        );
        break;
      case ShoeEvent.clearHands:
        yield state.copyWith(
          dealerHand: List.empty(growable: true),
          playerHands: List.empty(growable: true)
            ..add(
              List.empty(
                growable: true,
              ),
            ),
          otherCards: List.empty(growable: true),
        );
        break;
      case ShoeEvent.addTwoCard:
        if (state.handType == HandType.dealer)
          yield state.copyWith(dealerHand: state.dealerHand..add(2));
        if (state.handType == HandType.player) {
          List<List<int>> playerHands = state.playerHands;
          List<int> newPlayerHand = playerHands[state.handIndex]..add(2);
          playerHands[state.handIndex] = newPlayerHand;
          yield state.copyWith(playerHands: playerHands);
        }
        if (state.handType == HandType.other)
          yield state.copyWith(otherCards: state.otherCards..add(2));
        break;
      case ShoeEvent.addThreeCard:
        if (state.handType == HandType.dealer)
          yield state.copyWith(dealerHand: state.dealerHand..add(3));
        if (state.handType == HandType.player) {
          List<List<int>> playerHands = state.playerHands;
          List<int> newPlayerHand = playerHands[state.handIndex]..add(3);
          playerHands[state.handIndex] = newPlayerHand;
          yield state.copyWith(playerHands: playerHands);
        }
        if (state.handType == HandType.other)
          yield state.copyWith(otherCards: state.otherCards..add(3));
        break;
      case ShoeEvent.addFourCard:
        if (state.handType == HandType.dealer)
          yield state.copyWith(dealerHand: state.dealerHand..add(4));
        if (state.handType == HandType.player) {
          List<List<int>> playerHands = state.playerHands;
          List<int> newPlayerHand = playerHands[state.handIndex]..add(4);
          playerHands[state.handIndex] = newPlayerHand;
          yield state.copyWith(playerHands: playerHands);
        }
        if (state.handType == HandType.other)
          yield state.copyWith(otherCards: state.otherCards..add(4));
        break;
      case ShoeEvent.addFiveCard:
        if (state.handType == HandType.dealer)
          yield state.copyWith(dealerHand: state.dealerHand..add(5));
        if (state.handType == HandType.player) {
          List<List<int>> playerHands = state.playerHands;
          List<int> newPlayerHand = playerHands[state.handIndex]..add(5);
          playerHands[state.handIndex] = newPlayerHand;
          yield state.copyWith(playerHands: playerHands);
        }
        if (state.handType == HandType.other)
          yield state.copyWith(otherCards: state.otherCards..add(5));
        break;
      case ShoeEvent.addSixCard:
        if (state.handType == HandType.dealer)
          yield state.copyWith(dealerHand: state.dealerHand..add(6));
        if (state.handType == HandType.player) {
          List<List<int>> playerHands = state.playerHands;
          List<int> newPlayerHand = playerHands[state.handIndex]..add(6);
          playerHands[state.handIndex] = newPlayerHand;
          yield state.copyWith(playerHands: playerHands);
        }
        if (state.handType == HandType.other)
          yield state.copyWith(otherCards: state.otherCards..add(6));
        break;
      case ShoeEvent.addSevenCard:
        if (state.handType == HandType.dealer)
          yield state.copyWith(dealerHand: state.dealerHand..add(7));
        if (state.handType == HandType.player) {
          List<List<int>> playerHands = state.playerHands;
          List<int> newPlayerHand = playerHands[state.handIndex]..add(7);
          playerHands[state.handIndex] = newPlayerHand;
          yield state.copyWith(playerHands: playerHands);
        }
        if (state.handType == HandType.other)
          yield state.copyWith(otherCards: state.otherCards..add(7));
        break;
      case ShoeEvent.addEightCard:
        if (state.handType == HandType.dealer)
          yield state.copyWith(dealerHand: state.dealerHand..add(8));
        if (state.handType == HandType.player) {
          List<List<int>> playerHands = state.playerHands;
          List<int> newPlayerHand = playerHands[state.handIndex]..add(8);
          playerHands[state.handIndex] = newPlayerHand;
          yield state.copyWith(playerHands: playerHands);
        }
        if (state.handType == HandType.other)
          yield state.copyWith(otherCards: state.otherCards..add(8));
        break;
      case ShoeEvent.addNineCard:
        if (state.handType == HandType.dealer)
          yield state.copyWith(dealerHand: state.dealerHand..add(9));
        if (state.handType == HandType.player) {
          List<List<int>> playerHands = state.playerHands;
          List<int> newPlayerHand = playerHands[state.handIndex]..add(9);
          playerHands[state.handIndex] = newPlayerHand;
          yield state.copyWith(playerHands: playerHands);
        }
        if (state.handType == HandType.other)
          yield state.copyWith(otherCards: state.otherCards..add(9));
        break;
      case ShoeEvent.addTenCard:
        if (state.handType == HandType.dealer)
          yield state.copyWith(dealerHand: state.dealerHand..add(10));
        if (state.handType == HandType.player) {
          List<List<int>> playerHands = state.playerHands;
          List<int> newPlayerHand = playerHands[state.handIndex]..add(10);
          playerHands[state.handIndex] = newPlayerHand;
          yield state.copyWith(playerHands: playerHands);
        }
        if (state.handType == HandType.other)
          yield state.copyWith(otherCards: state.otherCards..add(10));
        break;
      case ShoeEvent.addAceCard:
        if (state.handType == HandType.dealer)
          yield state.copyWith(dealerHand: state.dealerHand..add(11));
        if (state.handType == HandType.player) {
          List<List<int>> playerHands = state.playerHands;
          List<int> newPlayerHand = playerHands[state.handIndex]..add(11);
          playerHands[state.handIndex] = newPlayerHand;
          yield state.copyWith(playerHands: playerHands);
        }
        if (state.handType == HandType.other)
          yield state.copyWith(otherCards: state.otherCards..add(11));
        break;
      case ShoeEvent.removeCardIndex:
        if (state.handType == HandType.dealer)
          yield state.copyWith(
              dealerHand: state.dealerHand..removeAt(state.cardIndex));
        if (state.handType == HandType.player) {
          List<List<int>> playerHands = state.playerHands;
          List<int> newPlayerHand = playerHands[state.handIndex]
            ..removeAt(state.cardIndex);
          playerHands[state.handIndex] = newPlayerHand;
          playerHands.removeWhere((x) => x.length == 0);
          yield state.copyWith(playerHands: playerHands);
        }
        if (state.handType == HandType.other)
          yield state.copyWith(
              otherCards: state.otherCards..removeAt(state.cardIndex));
        break;
      case ShoeEvent.split:
        List<int> lastHand = List.empty(growable: true)
          ..add(state.playerHands[state.handIndex][0]);
        List<int> nextHand = List.empty(growable: true)
          ..add(state.playerHands[state.handIndex][1]);
        List<List<int>> playerHands = state.playerHands;

        playerHands[state.handIndex] = lastHand;
        playerHands..add(nextHand);

        yield state.copyWith(playerHands: playerHands);
    }
  }

  static void updateShoeState(
    HandType handType,
    int value,
    BuildContext context,
    int handIndex,
  ) {
    updateHandType(
      handType,
      context,
    );
    updateHandIndex(
      handIndex,
      context,
    );
    updateRawCount(
      value,
      context,
    );
    updateCardsRemaining(
      context,
    );
    updateHands(
      value,
      context,
    );
  }

  static void undoShoeState(
    HandType handType,
    int cardIndex,
    int value,
    BuildContext context,
    int handIndex,
  ) {
    updateHandType(
      handType,
      context,
    );
    updateHandIndex(
      handIndex,
      context,
    );
    updateCardIndex(
      cardIndex,
      context,
    );
    undoRawCount(
      value,
      context,
    );
    undoCardsRemaining(
      context,
    );
    undoHands(
      cardIndex,
      context,
    );
  }

  static void updateHands(int value, BuildContext context) {
    if (value == 2) context.read<ShoeBloc>().add(ShoeEvent.addTwoCard);
    if (value == 3) context.read<ShoeBloc>().add(ShoeEvent.addThreeCard);
    if (value == 4) context.read<ShoeBloc>().add(ShoeEvent.addFourCard);
    if (value == 5) context.read<ShoeBloc>().add(ShoeEvent.addFiveCard);
    if (value == 6) context.read<ShoeBloc>().add(ShoeEvent.addSixCard);
    if (value == 7) context.read<ShoeBloc>().add(ShoeEvent.addSevenCard);
    if (value == 8) context.read<ShoeBloc>().add(ShoeEvent.addEightCard);
    if (value == 9) context.read<ShoeBloc>().add(ShoeEvent.addNineCard);
    if (value == 10) context.read<ShoeBloc>().add(ShoeEvent.addTenCard);
    if (value == 11) context.read<ShoeBloc>().add(ShoeEvent.addAceCard);
  }

  static void clearHands(BuildContext context) {
    context.read<ShoeBloc>().add(ShoeEvent.clearHands);
  }

  static void newShoe(BuildContext context) {
    context.read<ShoeBloc>().add(ShoeEvent.newShoe);
  }

  static void undoHands(int cardIndex, BuildContext context) {
    context.read<ShoeBloc>().add(ShoeEvent.removeCardIndex);
  }

  static void updateCardsRemaining(BuildContext context) {
    context.read<ShoeBloc>().add(ShoeEvent.removeCardRemaining);
  }

  static void undoCardsRemaining(BuildContext context) {
    context.read<ShoeBloc>().add(ShoeEvent.addCardRemaining);
  }

  static void updateRawCount(int value, BuildContext context) {
    if (value == 3 || value == 4 || value == 5 || value == 6)
      context.read<ShoeBloc>().add(ShoeEvent.plusOneRawCount);
    if (value == 2 || value == 7)
      context.read<ShoeBloc>().add(ShoeEvent.plusHalfRawCount);
    if (value == 9) context.read<ShoeBloc>().add(ShoeEvent.minusHalfRawCount);
    if (value >= 10) context.read<ShoeBloc>().add(ShoeEvent.minusOneRawCount);
  }

  static void undoRawCount(int value, BuildContext context) {
    if (value == 3 || value == 4 || value == 5 || value == 6)
      context.read<ShoeBloc>().add(ShoeEvent.minusOneRawCount);
    if (value == 2 || value == 7)
      context.read<ShoeBloc>().add(ShoeEvent.minusHalfRawCount);
    if (value == 9) context.read<ShoeBloc>().add(ShoeEvent.plusHalfRawCount);
    if (value >= 10) context.read<ShoeBloc>().add(ShoeEvent.plusOneRawCount);
  }

  static void updateHandType(HandType handType, BuildContext context) {
    if (handType == HandType.dealer)
      context.read<ShoeBloc>().add(ShoeEvent.targetDealer);
    if (handType == HandType.player)
      context.read<ShoeBloc>().add(ShoeEvent.targetPlayer);
    if (handType == HandType.other)
      context.read<ShoeBloc>().add(ShoeEvent.targetOther);
  }

  static void updateHandIndex(int handIndex, BuildContext context) {
    context.read<ShoeBloc>().state.handIndex = handIndex;
    context.read<ShoeBloc>().add(ShoeEvent.updateHandIndex);
  }

  static void updateCardIndex(int cardIndex, BuildContext context) {
    context.read<ShoeBloc>().state.cardIndex = cardIndex;
    context.read<ShoeBloc>().add(ShoeEvent.updateCardIndex);
  }

  static void splitHand(BuildContext context) {
    context.read<ShoeBloc>().add(ShoeEvent.split);
  }

  static ShoeState getShoeState(BuildContext context) {
    return context.read<ShoeBloc>().state;
  }
}

class ShoeState {
  final HandType handType;
  final int cardsRemaining;
  final double rawCount;
  final List<int> dealerHand;
  final List<List<int>> playerHands;
  final List<int> otherCards;
  final int minBet;
  final int baseBet;
  int handIndex;
  int cardIndex;

  ShoeState(
    this.handType,
    this.cardsRemaining,
    this.rawCount,
    this.dealerHand,
    this.playerHands,
    this.otherCards,
    this.minBet,
    this.baseBet,
    this.handIndex,
    this.cardIndex,
  );

  ShoeState copyWith({
    HandType? handType,
    int? cardsRemaining,
    double? rawCount,
    List<int>? dealerHand,
    List<List<int>>? playerHands,
    List<int>? otherCards,
    int? minBet,
    int? baseBet,
    int? handIndex,
    int? cardIndex,
  }) {
    return ShoeState(
      handType ?? this.handType,
      cardsRemaining ?? this.cardsRemaining,
      rawCount ?? this.rawCount,
      dealerHand ?? this.dealerHand,
      playerHands ?? this.playerHands,
      otherCards ?? this.otherCards,
      minBet ?? this.minBet,
      baseBet ?? this.baseBet,
      handIndex ?? this.handIndex,
      cardIndex ?? this.cardIndex,
    );
  }
}
