import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/model/language_list.dart';
import 'package:qr_code_programing_app/screen/language_list/language_list_screen.dart';
import 'dart:math';

class HomeScreenController extends GetxController {
  final selectedIndex = 0.obs;
  final code = ''.obs;
  final codeList = [].obs;
  final languageName = ''.obs;
  final imageName = ''.obs;
  final languageList = <LanguageList>[].obs;

  @override
  void onInit() {
    super.onInit();

  }

  void onTap() {
    Get.to(() => const LanguageListScreen());
  }

  Future<void> onTapCamera() async {
    var result = await BarcodeScanner.scan();
    // print(result.type); //barcode
    // print(result.rawContent); //1929979004002
    // print(result.format); //ean13

    //if (result.format == 'unknown') {
      checkNumber(code: result.rawContent);
      //コードの値
      code.value = result.rawContent;
      registerCode();
    //}
  }

  void checkNumber({required String code}) {
    //TODO 番号が重複していないかを確認する。
  }

  void registerCode() {
    //TODO コードをリストに登録させる。

    //ランダムで獲得するものを決める。
    int num = Random().nextInt(10);
    registerLanguage(number: num);

    //TODO ここで、獲得したものを登録するかどうかの確認

    //TODO リストを追加する。
    codeList.add(code.value);
    //リストの要素
    var languageLists = LanguageList(
      code: code.value,
      image: imageName.value,
      languageName: languageName.value,
    );
    languageList.add(languageLists);

    //TODO 保存する
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
    }
  }
}
