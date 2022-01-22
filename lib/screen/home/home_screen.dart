import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/component/list_item.dart';
import 'package:qr_code_programing_app/screen/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), tag: '');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: controller.onTap,
          icon: const Icon(Icons.apps),
        ),
      ),
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
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: controller.languageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListItem(
                      onTap: () {},
                      languageName: controller.languageList[index].languageName,
                      image: controller.languageList[index].image,
                    );
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
