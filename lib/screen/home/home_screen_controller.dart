import 'dart:convert';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/model/language_list.dart';
import 'package:qr_code_programing_app/screen/language_list/language_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController {
  final selectedIndex = 0.obs;
  final code = ''.obs;
  final codeList = [].obs;
  final languageName = ''.obs;
  final imageName = ''.obs;
  final languageList = <LanguageList>[].obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getListString();
    getInt();
  }

  void onTap() {
    Get.to(() => const LanguageListScreen());
  }

  Future<void> onTapCamera() async {
    final result = await BarcodeScanner.scan();
    code.value = result.format.toString();
    if (code.value != 'unknown') {
      code.value = result.rawContent;
      registerCode();
    } else {
      //TODO 読み込めないダイアログを出現させる。
    }
  }

  void registerCode() {
    if (count.value < 9) {
      count.value++;
      setInt();
      registerLanguage(number: count.value);
      codeList.add(code.value);
      var languageLists = LanguageList(
        code: code.value,
        image: imageName.value,
        languageName: languageName.value,
      );
      languageList.add(languageLists);
      setListString();
    }
  }

  void registerLanguage({required int number}) {
    switch (number) {
      case 1:
        languageName.value = 'Dart';
        imageName.value = 'dart';
        break;
      case 2:
        languageName.value = 'Flutter';
        imageName.value = 'flutter';
        break;
      case 3:
        languageName.value = 'C++';
        imageName.value = 'c2';
        break;
      case 4:
        languageName.value = 'C#';
        imageName.value = 'c3';
        break;
      case 5:
        languageName.value = 'Swift';
        imageName.value = 'swift';
        break;
      case 6:
        languageName.value = 'kotlin';
        imageName.value = 'kotlin';
        break;
      case 7:
        languageName.value = 'Java';
        imageName.value = 'java';
        break;
      case 8:
        languageName.value = 'python';
        imageName.value = 'python';
        break;
      case 9:
        languageName.value = 'C';
        imageName.value = 'c';
        break;
      default:
        break;
    }
  }

  Future<void> setListString() async {
    var prefs = await SharedPreferences.getInstance();
    //TodoList形式 → Map形式 → JSON形式 → StrigList形式
    var list = languageList;
    var listItem = list.map((e) => json.encode(e.toJson())).toList();
    prefs.setStringList('lists', listItem);
  }

  void getListString() async {
    var preference = await SharedPreferences.getInstance();
    var getStringList = preference.getStringList('lists') ?? [];
    var languageListItem = getStringList
        .map((e) => LanguageList.fromJson(json.decode(e)))
        .toList();
    languageList.value = languageListItem;
  }

  Future<void> setInt() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('count', count.value);
  }

  void getInt() async {
    var prefs = await SharedPreferences.getInstance();
    count.value = prefs.getInt('count') ?? 0;
  }
}
