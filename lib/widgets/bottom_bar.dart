import 'package:flutter/material.dart';
import 'package:hack_jack/my_colors.dart';
import 'package:hack_jack/shoe_bloc.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: myPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: myPrimaryColor,
                onPrimary: Colors.white,
                side: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              onPressed: () {
                ShoeBloc.newShoe(context);
              },
              child: Text("New Shoe"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: myPrimaryColor,
                onPrimary: Colors.white,
                side: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              onPressed: () {
                ShoeBloc.clearHands(context);
              },
              child: Text("New Hand"),
            ),
          ],
        ),
      ),
    );
  }
}
