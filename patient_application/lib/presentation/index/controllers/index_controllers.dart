// main_app_controller.dart
import 'package:get/get.dart';

class IndexControllers extends GetxController {
  // Observable to keep track of the selected page
  var selectedPage = 'Home'.obs;

  // Function to change the page
  void changePage(String page) {
    selectedPage.value = page;
  }
}
