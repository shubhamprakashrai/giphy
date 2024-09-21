import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/modules/forgetpassword/repository/forget_repository.dart';
import 'package:giphyapp/app/modules/login/bindings/login_binding.dart';
import 'package:giphyapp/app/modules/login/views/login_view.dart';
import 'package:giphyapp/app/uiUtils/components/custom_snackbar.dart';

class ForgetPasswordController extends GetxController {
  final ForgetRepository _forgetRepository = ForgetRepository();

  var emailController = TextEditingController();
  var emailError = ''.obs;
  var isLoading = false.obs;

  void resetPassword() async {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      emailError.value = 'Email cannot be empty';
      return;
    }

    isLoading.value = true;
    try {
      await _forgetRepository.resetPassword(email);
      CustomSnackBar.showSnackbar(
        title: 'Success',
        message: 'Password reset email sent successfully.',
        isError: false,
      );
      Get.to(() => const LoginView(), binding: LoginBinding(),);
    } catch (e) {
      CustomSnackBar.showSnackbar(
        title: 'Error',
        message: 'Failed to send password reset email.',
        isError: true,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
