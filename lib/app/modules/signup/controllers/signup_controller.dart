import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/modules/home/bindings/home_binding.dart';
import 'package:giphyapp/app/modules/signup/models/signup_models.dart';
import 'package:giphyapp/app/modules/signup/repository/signup_repository.dart';
import 'package:giphyapp/app/uiUtils/components/custom_snackbar.dart';

import '../../../uiUtils/components/TabBarNavigation/tab_navigation.dart';

class SignupController extends GetxController {
  final SignupRepository _signupRepository = SignupRepository();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var emailError = ''.obs;
  var passwordError = ''.obs;
  // var confirmPasswordError = ''.obs;
  var confirmPasswordError = Rx<String?>(null);


  bool validateForm() {
    bool isValid = true;
    if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = "Enter a valid email address";
      isValid = false;
    } else {
      emailError.value = '';
    }
    if (passwordController.text.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
      isValid = false;
    } else {
      passwordError.value = '';
    }
    if (passwordController.text != confirmPasswordController.text) {
      confirmPasswordError.value = "Passwords do not match";
      isValid = false;
    } else {
      confirmPasswordError.value = '';
    }

    return isValid;
  }
  var isLoading = false.obs;
 void onSignup() async {
   isLoading.value = true;
    if (validateForm()) {
      try {
        UserModel? user = await _signupRepository.signUp(
          emailController.text,
          passwordController.text,
        );

        if (user != null) {
          if (user.userAlreadyExists) {
            CustomSnackBar.showSnackbar(
              title: 'Error',
              message: 'User already exists, please log in.',
              isError: true,
            );
          } else {
            CustomSnackBar.showSnackbar(
              title: 'Success',
              message: 'Signup successful',
              isError: false,
            );
            Get.offAll(() => const TabBarNavigation(),binding: HomeBinding(),);
          }
        } else {
          CustomSnackBar.showSnackbar(
            title: 'Error',
            message: 'Signup failed',
            isError: true,
          );
        }

      } catch (e) {
        if (e.toString() == 'Exception: email-already-in-use') {
          CustomSnackBar.showSnackbar(
            title: 'Email already in use',
            message: 'The email is already registered. Please log in instead.',
            isError: true,
          );
        } else {
          CustomSnackBar.showSnackbar(
            title: 'Error',
            message: 'An unexpected error occurred. Please try again.',
            isError: true,
          );
        }
        debugPrint("Error in signup controller: $e");
      }
      finally {
        isLoading.value = false;
      }
    }
    else {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
