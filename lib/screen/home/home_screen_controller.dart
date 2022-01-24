import 'dart:convert';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final explain = ''.obs;

  final images = [
    "assets/c.png",
    "assets/c2.png",
    "assets/c3.png",
    "assets/dart.png",
    "assets/flutter.png",
    "assets/java.png",
    "assets/kotlin.png",
    "assets/python.png",
    "assets/swift.png",
  ].obs;
  final activeIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getListString();
    getInt();
  }

  void onPageChanged({required int index}) {
    activeIndex.value = index;
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
      dialogs(isSuccess: true);
    } else {
      dialogs(isSuccess: false);
    }
  }

  void dialogs({required bool isSuccess}) {
    showCupertinoDialog(
      context: Get.context!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            isSuccess ? '登録完了' : '登録失敗',
            style: TextStyle(
              color: isSuccess ? Colors.blue : Colors.red,
            ),
          ),
          content: Text(
            isSuccess ? '図鑑が更新されました!' : '登録に失敗しました。',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
        explain: explain.value,
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
        explain.value =
            'Dart（ダートまたはダーツ。当初はDashと呼ばれていた）は、ウェブアプリやモバイルアプリのクライアント開発向けに設計されたプログラミング言語である。Googleによって開発された言語で、サーバーやデスクトップ向けアプリケーションの開発にも使用できる。';
        break;
      case 2:
        languageName.value = 'Flutter';
        imageName.value = 'flutter';
        explain.value =
            'Flutter（フラッター）は、Googleによって開発されたフリーかつオープンソースのUIのSDKである。単一のコードベースから、Android、iOS、Linux、macOS、Windows、Google Fuchsia向けのクロスプラットフォームアプリケーションを開発するために利用される。';
        break;
      case 3:
        languageName.value = 'C++';
        imageName.value = 'c2';
        explain.value =
            'C++（シープラスプラス）は、汎用プログラミング言語のひとつである。派生元であるC言語の機能や特徴を継承しつつ、表現力と効率性の向上のために、手続き型プログラミング・データ抽象・オブジェクト指向プログラミング・ジェネリックプログラミングといった複数のプログラミングパラダイムが組み合わされている。';
        break;
      case 4:
        languageName.value = 'C#';
        imageName.value = 'c3';
        explain.value =
            'C#（シーシャープ）は、アンダース・ヘルスバーグが設計したプログラミング言語であり、構文はその名前にもある通りC系言語（C言語、C++やJavaなど）の影響があるが、構文以外の言語機能などについてはヘルスバーグが以前の所属であるボーランドで設計したDelphiからの影響がある。';
        break;
      case 5:
        languageName.value = 'Swift';
        imageName.value = 'swift';
        explain.value =
            'Swift（スウィフト）は、AppleのiOSおよびmacOS、Linux、Windowsで利用出来るプログラミング言語である。Worldwide Developers Conference (WWDC) 2014で発表された。Apple製OS上で動作するアプリケーションの開発に従来から用いられていたObjective-CやObjective-C++、C言語と共存できるように、共通のObjective-Cランタイムライブラリが使用されている。';
        break;
      case 6:
        languageName.value = 'kotlin';
        imageName.value = 'kotlin';
        explain.value =
            'Kotlin（コトリン）は、ジェットブレインズのアンドリー・ブレスラフ、ドミトリー・ジェメロフが開発した、静的型付けのオブジェクト指向プログラミング言語である。';
        break;
      case 7:
        languageName.value = 'Java';
        imageName.value = 'java';
        explain.value =
            'Java（ジャバ）は、汎用プログラミング言語とソフトウェアプラットフォームの双方を指している総称ブランドである。オラクルおよびその関連会社の登録商標である。1996年にサン・マイクロシステムズによって市場リリースされ、2010年に同社がオラクルに吸収合併された事によりJavaの版権もそちらに移行した。';
        break;
      case 8:
        languageName.value = 'python';
        imageName.value = 'python';
        explain.value =
            'Python（パイソン）はインタープリタ型の高水準汎用プログラミング言語である。グイド・ヴァン・ロッサムにより創り出され、1991年に最初にリリースされたPythonの設計哲学は、有意なホワイトスペース(オフサイドルール)の顕著な使用によってコードの可読性を重視している。その言語構成とオブジェクト指向のアプローチは、プログラマが小規模なプロジェクトから大規模なプロジェクトまで、明確で論理的なコードを書くのを支援することを目的としている。';
        break;
      case 9:
        languageName.value = 'C';
        imageName.value = 'c';
        explain.value =
            'C言語（シーげんご）は、1972年にAT&Tベル研究所のデニス・リッチーが主体となって開発した汎用プログラミング言語である。英語圏では「C language」または単に「C」と呼ばれることが多い。日本でも文書や文脈によっては同様に「C」と呼ぶことがある。制御構文などに高水準言語の特徴を持ちながら、ハードウェア寄りの記述も可能な低水準言語の特徴も併せ持つ。基幹系システムや、動作環境の資源制約が厳しい、あるいは実行速度性能が要求されるソフトウェアの開発に用いられることが多い。';
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
