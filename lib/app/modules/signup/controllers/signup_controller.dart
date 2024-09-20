import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/modules/home/bindings/home_binding.dart';
import 'package:giphyapp/app/modules/signup/models/signup_models.dart';
import 'package:giphyapp/app/modules/signup/repository/signup_repository.dart';
import 'package:giphyapp/app/utils/firbaseService/TabBarNavigation/tab_navigation.dart';

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
            Get.snackbar(
              "Error", 
              "User already exists, please log in.",
              snackPosition: SnackPosition.BOTTOM
            );
          } else {
            Get.snackbar(
              "Success", 
              "Signup successful",
              snackPosition: SnackPosition.BOTTOM
            );
            Get.offAll(() => const TabBarNavigation(),binding: HomeBinding(),);
          }
        } else {
          Get.snackbar(
            "Error", 
            "Signup failed",
            snackPosition: SnackPosition.BOTTOM
          );
        }

      } catch (e) {
        if (e.toString() == 'Exception: email-already-in-use') {
          Get.snackbar(
            "Email already in use",
            "The email is already registered. Please log in instead.",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            "Error", 
            "An unexpected error occurred. Please try again.",
            snackPosition: SnackPosition.BOTTOM
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
