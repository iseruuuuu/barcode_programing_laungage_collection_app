import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      //画像間の隙間
      margin: const EdgeInsets.symmetric(horizontal: 13),
      color: Colors.grey,
      child: Image.asset(
        path,
        fit: BoxFit.cover,
      ),
    );
  }
}
