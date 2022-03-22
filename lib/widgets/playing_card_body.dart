import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_jack/my_colors.dart';

class PlayingCardBody extends StatelessWidget {
  const PlayingCardBody({
    Key? key,
    required this.size,
    required this.valueString,
  }) : super(key: key);

  final double size;
  final String valueString;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 3.5,
      width: size * 2.5,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  valueString,
                  style: GoogleFonts.alfaSlabOne(
                    textStyle: TextStyle(
                      color: myAccentColor,
                      fontSize: size * .5,
                    ),
                  ),
                ),
                Text(
                  valueString,
                  style: GoogleFonts.alfaSlabOne(
                    textStyle: TextStyle(
                      color: myAccentColor,
                      fontSize: size * .5,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueString,
                  style: GoogleFonts.alfaSlabOne(
                    textStyle: TextStyle(
                      color: myAccentColor,
                      fontSize: size * 1,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  valueString,
                  style: GoogleFonts.alfaSlabOne(
                    textStyle: TextStyle(
                      color: myAccentColor,
                      fontSize: size * .5,
                    ),
                  ),
                ),
                Text(
                  valueString,
                  style: GoogleFonts.alfaSlabOne(
                    textStyle: TextStyle(
                      color: myAccentColor,
                      fontSize: size * .5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
