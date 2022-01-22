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
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 2,
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(
                  'assets/$image.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
