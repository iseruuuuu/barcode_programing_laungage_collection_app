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
    setListString();
  }

  Future<void> setListString() async {
    var prefs = await SharedPreferences.getInstance();
    //TodoList形式 → Map形式 → JSON形式 → StrigList形式
    var list = languageList;
    var listItem = list.map((e) => json.encode(e.toJson())).toList();
    prefs.setStringList('list', listItem);
  }

  void onTap() {
    Get.to(() => const CardScreen());
  }
}
