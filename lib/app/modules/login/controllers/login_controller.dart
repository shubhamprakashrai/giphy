import 'package:get/get.dart';
import 'package:giphyapp/app/modules/home/bindings/home_binding.dart';
import 'package:giphyapp/app/modules/login/repository/login_repository.dart';
import 'package:giphyapp/app/modules/signup/models/signup_models.dart';
import 'package:flutter/material.dart';
import 'package:giphyapp/app/services/app_type_def.dart';
import 'package:giphyapp/app/services/language_service.dart';
import 'package:giphyapp/app/utils/firbaseService/TabBarNavigation/tab_navigation.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepository = LoginRepository();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<bool> passwordNotifier = ValueNotifier(false);
  var isLoading = false.obs;
  FRVoid login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    isLoading.value = true;
    log.d("Email $email Password $password");

    if (validateForm()) {
      try {
        UserModel? userModel = await _loginRepository.login(email, password);
        if (userModel != null) {
          Get.snackbar("Success", "Login successful",snackPosition: SnackPosition.BOTTOM);
          Get.offAll(() => const TabBarNavigation(),binding: HomeBinding(),);
        } else {
          Get.snackbar("Error", "Login failed, invalid credentials",snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        Get.snackbar("Error", "An error occurred while logging in",snackPosition: SnackPosition.BOTTOM);
        debugPrint("Login Error: $e");
      }
      finally {
        isLoading.value = false;
      }
    }else {
      isLoading.value = false;
    }
  }

  bool validateForm() {
    if (!GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar("Invalid Email", "Please enter a valid email",
          snackPosition: SnackPosition.BOTTOM);
      return false;
    } else if (passwordController.text.trim().isEmpty) {
      Get.snackbar("Invalid Password", "Please enter your password",
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
