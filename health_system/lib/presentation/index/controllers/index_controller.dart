import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class IndexController extends GetxController {
  var pageController = PageController().obs;
  var sideMenuController = SideMenuController().obs;

  @override
  void onInit() {
    sideMenuController.value.addListener((index) {
      pageController.value.jumpToPage(index);
    });
    super.onInit();
  }

  void changePage(int index) {
    sideMenuController.value.changePage(index);
  }
  
}
