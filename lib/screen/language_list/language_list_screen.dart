import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/component/list_item.dart';
import 'package:qr_code_programing_app/screen/language_list/language_list_screen_controller.dart';

class LanguageListScreen extends StatelessWidget {
  const LanguageListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageListScreenController(), tag: '');
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: controller.languageList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItem(
            onTap: controller.onTap,
            languageName: controller.languageList[index].languageName,
            image: controller.languageList[index].image,
          );
        },
      ),
    );
  }
}
