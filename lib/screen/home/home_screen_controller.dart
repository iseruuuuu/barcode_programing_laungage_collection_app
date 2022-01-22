import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final selectedIndex = 0.obs;
  final code = ''.obs;

  final codeList = [].obs;


  @override
  void onInit() {
    super.onInit();

    print(codeList.length);
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



}