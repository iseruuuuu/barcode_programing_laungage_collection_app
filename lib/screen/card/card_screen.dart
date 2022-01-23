import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/model/language_list.dart';

import 'card_screen_controller.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({
    Key? key,
    required this.languageList,
    required this.index,
  }) : super(key: key);

  final LanguageList languageList;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CardScreenController(), tag: '');
    return Scaffold(
      backgroundColor: const Color(0xFFC4C6A0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFC4C6A0),
        title: Text(
          '図鑑No.$index ${languageList.languageName}',
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(
            Icons.close,
            size: 40,
          ),
          onPressed: controller.onTapBack,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        'assets/${languageList.image}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          'No.$index',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          languageList.languageName,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    languageList.explain,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     elevation: 0,
                //     primary: Colors.black,
                //   ),
                //   onPressed: () => controller.onTapOpenUrl(
                //     url: languageList.languageName,
                //   ),
                //   child: const Text(
                //     '詳しくみてみる!',
                //   ),
                // ),
                const Spacer(),
                const Text('引用元：Wikipedia'),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
