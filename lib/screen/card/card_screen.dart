import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/component/row_text.dart';
import 'package:qr_code_programing_app/gen/assets.gen.dart';
import 'package:qr_code_programing_app/screen/home/home_screen_controller.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), tag: '');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: Assets.dart.image(),
            ),
            const RowText(
              rightWord: '言語名',
              leftWord: 'Dart',
            ),
            const RowText(
              rightWord: 'レア度',
              leftWord: '10',
            ),
            const Text(
              '1929979004002',
              style: TextStyle(
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
