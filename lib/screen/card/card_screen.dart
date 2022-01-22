import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/component/row_text.dart';
import 'package:qr_code_programing_app/model/language_list.dart';
import 'package:qr_code_programing_app/screen/home/home_screen_controller.dart';

import 'card_screen_controller.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({
    Key? key,
    required this.languageList,
    required this.index,
  }) : super(key: key);

  final LanguageList languageList;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CardScreenController(), tag: '');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          '図鑑No.$index',
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(
            Icons.close,
            size: 40,
          ),
          onPressed: controller.onTapBack,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/${languageList.image}.png',
                fit: BoxFit.cover,
              ),
            ),
            RowText(
              rightWord: '言語名',
              leftWord: languageList.languageName,
            ),
            Text(
              '図鑑No.$index',
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              languageList.code,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
