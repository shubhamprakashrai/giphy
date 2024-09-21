import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/services/firbaseService/google_login.dart';
import 'package:giphyapp/app/uiUtils/components/loging_with_goole_btn.dart';
import 'package:giphyapp/app/utils/app_constant/app_extension.dart';
import 'package:giphyapp/app/utils/app_constant/app_colors.dart';
import 'package:giphyapp/app/uiUtils/components/customTextField.dart';
import 'package:giphyapp/app/uiUtils/components/custon_btn.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Title and subtitle
              Column(
                children: <Widget>[
                  const SizedBox(height: 60.0),
                  Text(
                    context.L.signUp,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    context.L.createAccount,
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),

              // Form fields with validation
              Column(
                children: [
                  const SizedBox(height: 20),
                  Obx(() => CustomTextField(
                    controller: controller.emailController,
                    hintText: context.L.emailHint,
                    errorText: controller.emailError.value.isNotEmpty ? controller.emailError.value : null,
                    prefixIcon: const Icon(Icons.email),
                  )),
                  const SizedBox(height: 20),
                  Obx(() => CustomTextField(
                    controller: controller.passwordController,
                    hintText: context.L.passwordHint,
                    errorText: controller.passwordError.value.isNotEmpty ? controller.passwordError.value : null,
                    prefixIcon: const Icon(Icons.lock_outline),
                    obscureText: true,
                  )),
                  const SizedBox(height: 20),
                  Obx(() => CustomTextField(
                    controller: controller.confirmPasswordController,
                    hintText: context.L.confirmPasswordHint,
                    errorText: controller.confirmPasswordError.value?.isNotEmpty ?? true? controller.confirmPasswordError.value : null,
                    prefixIcon: const Icon(Icons.lock_outline),
                    obscureText: true,
                    // onTap: (){
                    //   controller.confirmPasswordError.value = null;
                    // },
                    // validator: (_){
                    //   return controller.confirmPasswordError.value?.isNotEmpty ?? true? controller.confirmPasswordError.value : null;
                    // },
                  )),
                ],
              ),


              // Signup Button
              Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child:Obx(() => CustomLoadingButton(
                    text: context.L.signUp,
                    isLoading: controller.isLoading.value,
                    onPressed: (){
                      controller.onSignup();
                    },
                  ))
              
              ),

              Center(child: Text( context.L.or)),

              // Sign In with Google Button
              SignInButtonGoogle(
                label: context.L.signInWithGoogle,
                onPressed: () async {
                  await GoogleAuthService.signInWithGoogle();
                },
              ),

              // Already have an account? Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text( context.L.alreadyHaveAccount,),
                  TextButton(
                      onPressed: () {
                        Get.toNamed("/login");
                      },
                      child: Text(
                        context.L.login,
                        style: const TextStyle(color: AppColors.purpleColors),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
