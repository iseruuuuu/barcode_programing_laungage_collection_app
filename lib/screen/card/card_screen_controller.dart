import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CardScreenController extends GetxController {
  final selectedIndex = 0.obs;
  final code = ''.obs;
  final codeList = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onTapBack() {
    Get.back();
  }

  void onTapOpenUrl({required String url}) async {
    //if (!await launch('https://www.google.com/search?q=$url')) throw 'Could not launch $url';

    if (!await launch('https://www.google.com/search?q=flutter')) throw 'Could not launch $url';
    print(url);

  }
}

//https://www.google.com/search?q=flutter&hl=ja&sxsrf=AOaemvLZKjYBYdWWVKXe4QEzQJQ4NKKgLA%3A1642936703663&source=hp&ei=fzntYanPJYaKhwPjk5CYCg&iflsig=ALs-wAMAAAAAYe1Hj9Bnv0Pe044jTG8H9YRpXcned8aL&ved=0ahUKEwjpiu6U4Mf1AhUGxWEKHeMJBKMQ4dUDCAk&uact=5&oq=flutter&gs_lcp=Cgdnd3Mtd2l6EAMyBAgjECcyBAgjECcyBAgjECcyBAgAEEMyBAgAEEMyBAgAEEMyBAgAEEMyBAgAEEM6BwgjEOoCECc6DQgAEIAEELEDEIMBEAQ6BwgAEIAEEAQ6CggAEIAEELEDEAQ6BQgAEIAEOgcIABCxAxBDUPEHWOIPYOcRaAFwAHgAgAFiiAHzBJIBATeYAQCgAQGwAQo&sclient=gws-wiz