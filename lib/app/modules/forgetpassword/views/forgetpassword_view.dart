import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/uiUtils/components/customTextField.dart';
import 'package:giphyapp/app/uiUtils/components/custon_btn.dart';
import 'package:giphyapp/app/utils/app_constant/app_colors.dart';
import '../controllers/forgetpassword_controller.dart';


class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
        leading: BackButton(
          color: AppColors.purpleColors,
          onPressed: () {
           Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => CustomTextField(
              controller: controller.emailController,
              hintText: 'Enter your email',
              errorText: controller.emailError.value.isNotEmpty
                  ? controller.emailError.value
                  : null,
              prefixIcon: const Icon(Icons.email),
            )),
            const SizedBox(height: 20),
            Obx(() => SizedBox(
              width: 250,
              child: CustomLoadingButton(
                text: 'Reset Password',
                isLoading: controller.isLoading.value,
                onPressed: controller.resetPassword,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
