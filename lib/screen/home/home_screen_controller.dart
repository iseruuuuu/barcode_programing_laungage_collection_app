import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/screen/card/card_screen.dart';
import 'package:qr_code_programing_app/screen/language_list/language_list_screen.dart';

class HomeScreenController extends GetxController {
  final selectedIndex = 0.obs;
  final code = ''.obs;
  final codeList = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onTap() {
    Get.to(() => const LanguageListScreen());
  }

  Future<void> onTapCamera() async {
    var result = await BarcodeScanner.scan();
    print(result.type); //barcode
    print(result.rawContent); //1929979004002
    print(result.format); //ean13

    code.value = result.rawContent;

    //リストを追加する。
    codeList.add(code.value);
  }

  void checkNumber() {
    //TODO 番号が重複していないかを確認する
  }

  void registerCode() {
    //TODO コードをリストに登録させる。

    //TODO ランダムで獲得するものを決める。

    //TODO ここで、獲得したものを登録するかどうかの確認
  }
}
