import 'package:get/get.dart';
import 'package:giphyapp/app/modules/home/bindings/home_binding.dart';
import 'package:giphyapp/app/modules/login/repository/login_repository.dart';
import 'package:giphyapp/app/modules/signup/models/signup_models.dart';
import 'package:flutter/material.dart';
import 'package:giphyapp/app/services/app_type_def.dart';
import 'package:giphyapp/app/services/language_service.dart';
import 'package:giphyapp/app/uiUtils/components/custom_snackbar.dart';

import '../../../uiUtils/components/TabBarNavigation/tab_navigation.dart';

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
          CustomSnackBar.showSnackbar(
            title: 'Success',
            message: 'Login successful',
            isError: false,
          );
          Get.offAll(
                () => const TabBarNavigation(),
            binding: HomeBinding(),
          );
        } else {
          CustomSnackBar.showSnackbar(
            title: 'Error',
            message: 'Login failed, invalid credentials',
            isError: true,
          );
        }
      } catch (e) {
        CustomSnackBar.showSnackbar(
          title: 'Error',
          message: 'An error occurred while logging in',
          isError: true,
        );

        debugPrint("Login Error: $e");
      } finally {
        isLoading.value = false;
      }
    } else {
      isLoading.value = false;
    }
  }

  bool validateForm() {
    if (!GetUtils.isEmail(emailController.text.trim())) {
      CustomSnackBar.showSnackbar(
        title: 'Invalid Email',
        message: 'Please enter a valid email',
        isError: true,
      );
      return false;
    } else if (passwordController.text.trim().isEmpty) {
      CustomSnackBar.showSnackbar(
        title: 'Invalid Password',
        message: 'Please enter your password',
        isError: true,
      );
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
