import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_programing_app/component/color_text_item.dart';
import 'package:qr_code_programing_app/component/image_item.dart';
import 'package:qr_code_programing_app/screen/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), tag: '');
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground,
        leading: GestureDetector(
          onTap: controller.onTap,
          child: const Icon(
            Icons.apps,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Material(
              child: ColorTextItem(),
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 200,
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 1),
                viewportFraction: 1,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) =>
                    controller.onPageChanged(index: index),
              ),
              itemCount: controller.images.length,
              itemBuilder: (context, index, realIndex) {
                final path = controller.images[index];
                return ImageItem(path: path);
              },
            ),
            TextButton(
              onPressed: controller.onTapCamera,
              child: const Text(
                'コードを読み込む',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
