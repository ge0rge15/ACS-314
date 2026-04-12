import 'package:get/get.dart';

class Logincontroller extends GetxController {
  var isPasswordvisible = true.obs;

  void togglePasswordy() {
    isPasswordvisible.value = !isPasswordvisible.value;
  }
}
