import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/screen/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), tag: '');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: controller.onTapCamera,
              child: const Text(
                'コードを読み込む',
              ),
            ),
            Obx(
              () => Text(
                '読み込んだ内容' + controller.code.value,
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: controller.codeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(controller.codeList[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
