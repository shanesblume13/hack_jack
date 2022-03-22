import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_jack/hand_type.dart';
import 'package:hack_jack/shoe_bloc.dart';
import 'package:hack_jack/widgets/bottom_bar.dart';
import 'package:hack_jack/widgets/hand_area.dart';
import 'my_colors.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShoeBloc>(
      create: (_) => ShoeBloc(),
      child: MaterialApp(
        title: 'Hack Jack',
        theme: ThemeData(
          primarySwatch: myPrimaryColor,
          accentColor: myAccentColor,
        ),
        home: BlocBuilder<ShoeBloc, ShoeState>(builder: (
          _,
          shoeState,
        ) {
          return MyHomePage(
            shoeState: shoeState,
          );
        }),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key? key,
    required this.shoeState,
  }) : super(key: key);

  final ShoeState shoeState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hack Jack"),
      ),
      body: MyHomePageBody(
        shoeState: shoeState,
      ),
      bottomNavigationBar:
          BottomBar(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyHomePageBody extends StatelessWidget {
  MyHomePageBody({
    Key? key,
    required this.shoeState,
  }) : super(key: key);

  final ShoeState shoeState;

  @override
  Widget build(BuildContext context) {
    Widget statsArea = getStatsArea(context);
    List<Widget> handAreas = getHandAreas(context);
    List<Widget> bodyWidgetList = List.empty(growable: true);

    bodyWidgetList..add(statsArea);
    for (Widget area in handAreas) {
      bodyWidgetList.add(area);
    }

    return Container(
      color: myAccentColor.shade300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bodyWidgetList,
        ),
      ),
    );
  }

  Widget getStatsArea(BuildContext context) {
    int cardsRemaining = shoeState.cardsRemaining;
    double decksRemaining = cardsRemaining / 52;

    double rawCount = shoeState.rawCount;
    double trueCount = rawCount / decksRemaining;

    double baseBet = shoeState.baseBet.toDouble();
    double suggestedBet = max(baseBet, (baseBet * trueCount).roundToDouble());

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cards Remaining: ${cardsRemaining.toStringAsFixed(0)}"),
          Text("Decks Remaining: ${decksRemaining.toStringAsFixed(2)}"),
          Text("Raw Count: ${rawCount.toStringAsFixed(0)}"),
          Text("True Count: ${trueCount.toStringAsFixed(2)}"),
          Text("Base Bet: \$${baseBet.toStringAsFixed(2)}"),
          Text("Suggested Bet: \$${suggestedBet.toStringAsFixed(2)}"),
        ],
      ),
    );
  }

  List<Widget> getHandAreas(BuildContext context) {
    List<Widget> handAreas = List.empty(growable: true);

    if (shoeState.playerHands.length == 0) {
      shoeState.playerHands..add(List.empty(growable: true));
    }

    for (int i = 0; i < shoeState.playerHands.length; i++) {
      handAreas
        ..add(
          HandArea(
            areaName: "Player ${i + 1}",
            flex: 2,
            handType: HandType.player,
            shoeState: shoeState,
            handIndex: i,
          ),
        );

      if (shoeState.playerHands[i].length == 2 &&
          shoeState.playerHands[i][0] == shoeState.playerHands[i][1]) {
        handAreas.add(
          ElevatedButton(
            onPressed: () {
              ShoeBloc.updateHandIndex(i, context);
              ShoeBloc.splitHand(context);
            },
            child: Text("Split"),
          ),
        );
      }
    }

    handAreas
      ..add(
        HandArea(
          areaName: "Dealer",
          flex: 2,
          handType: HandType.dealer,
          shoeState: shoeState,
          handIndex: 0,
        ),
      );
    handAreas
      ..add(
        Container(
          child: HandArea(
            areaName: "Other",
            flex: 2,
            handType: HandType.other,
            shoeState: shoeState,
            handIndex: 0,
          ),
        ),
      );
    return handAreas;
  }
}
