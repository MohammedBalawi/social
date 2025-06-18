import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 54,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF8C30F5), // Purple color
            Color(0xFFF50057), // Pink color
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadiusDirectional.only(
          topStart:
              Radius.circular(100), // Creates the rounded corner on top-left
          bottomStart:
              Radius.circular(100), // Creates the rounded corner on bottom-left
        ),
      ),
    );
  }
}
