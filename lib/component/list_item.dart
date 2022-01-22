import 'package:flutter/material.dart';
import 'package:qr_code_programing_app/gen/assets.gen.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.onTap,
    required this.languageName,
    required this.image,
  }) : super(key: key);

  final Function() onTap;
  final String languageName;
  final String image;

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
              Text(
                languageName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  'assets/$image.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
