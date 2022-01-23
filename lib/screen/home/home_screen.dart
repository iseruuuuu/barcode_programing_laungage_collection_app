import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/screen/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), tag: '');
    return Scaffold(
      backgroundColor: const Color(0xFFC4C6A0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC4C6A0),
        elevation: 1,
        leading: IconButton(
          onPressed: controller.onTap,
          icon: const Icon(
            Icons.apps,
            color: Colors.black,
            size: 35,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'プログラミング図鑑',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            ElevatedButton(
              onPressed: controller.onTapCamera,
              child: const Text(
                'コードを読み込む',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
