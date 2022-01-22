import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/screen/card/card_screen.dart';

class LanguageListScreenController extends GetxController {
  final selectedIndex = 0.obs;
  final code = ''.obs;
  final codeList = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onTap() {
    Get.to(() => const CardScreen());
  }
}
