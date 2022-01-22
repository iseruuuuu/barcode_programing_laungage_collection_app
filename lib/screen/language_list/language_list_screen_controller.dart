import 'dart:convert';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/model/language_list.dart';
import 'package:qr_code_programing_app/screen/card/card_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageListScreenController extends GetxController {
  final selectedIndex = 0.obs;
  final code = ''.obs;
  final codeList = [].obs;
  final languageList = <LanguageList>[].obs;

  @override
  void onInit() {
    super.onInit();
    getListString();
  }

  void getListString() async {
    var preference = await SharedPreferences.getInstance();
    var getStringList = preference.getStringList('list') ?? [];
    var languageListItem = getStringList
        .map((e) => LanguageList.fromJson(json.decode(e)))
        .toList();
    languageList.value = languageListItem;
  }

  void onTap({required int index}) {
    Get.to(
      () => CardScreen(
        languageList: languageList[index],
        index: index,
      ),
    );
  }

  void onTapBack() {
    Get.back();
  }
}
