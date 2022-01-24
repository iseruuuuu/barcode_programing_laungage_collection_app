import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/component/list_item.dart';
import 'package:qr_code_programing_app/screen/language_list/language_list_screen_controller.dart';

class LanguageListScreen extends StatelessWidget {
  const LanguageListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageListScreenController(), tag: '');
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        middle: const Text(
          'コレクション',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        leading: GestureDetector(
          onTap: controller.onTapBack,
          child: const Icon(
            Icons.apps,
          ),
        ),
        trailing: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${controller.languageList.length}/9',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      child: Obx(
        () => ListView.builder(
          itemCount: controller.languageList.length,
          itemBuilder: (BuildContext context, int index) {
            return Material(
              child: ListItem(
                onTap: () => controller.onTap(index: index),
                languageName: controller.languageList[index].languageName,
                image: controller.languageList[index].image,
              ),
            );
          },
        ),
      ),
    );
  }
}
