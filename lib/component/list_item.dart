import 'package:flutter/material.dart';
import 'package:qr_code_programing_app/gen/assets.gen.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black, //色
              width: 5, //太さ
            ),
          ),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Dart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const Text(
                '🌟9',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Assets.dart.image(
                width: 50,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
