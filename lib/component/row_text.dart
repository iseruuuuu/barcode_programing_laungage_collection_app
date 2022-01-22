import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  const RowText({
    Key? key,
    required this.rightWord,
    required this.leftWord,
  }) : super(key: key);

  final String rightWord;
  final String leftWord;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          rightWord,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          leftWord,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
