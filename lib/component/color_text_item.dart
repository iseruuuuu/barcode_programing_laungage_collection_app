import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorTextItem extends StatelessWidget {
  const ColorTextItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.extraLightBackgroundGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'プ',
            style: TextStyle(
              color: Colors.red,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'ロ',
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'グ',
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'ラ',
            style: TextStyle(
              color: Colors.amberAccent,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'ミ',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'ン',
            style: TextStyle(
              color: Colors.indigoAccent,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'グ',
            style: TextStyle(
              color: Colors.lightGreenAccent,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '図',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '鑑',
            style: TextStyle(
              color: Colors.purpleAccent,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
