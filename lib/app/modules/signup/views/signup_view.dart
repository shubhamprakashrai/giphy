import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/app_constants.dart';
import 'package:giphyapp/app/app_extension.dart';
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

                  // Email Field with validation
                  Obx(() => TextField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          hintText:  context.L.emailHint,
                          errorText: controller.emailError.value.isNotEmpty
                              ? controller.emailError.value
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.purple.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.email),
                        ),
                      )),
                  const SizedBox(height: 20),

                  // Password Field with validation
                  Obx(() => TextField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          hintText:  context.L.passwordHint,
                          errorText: controller.passwordError.value.isNotEmpty
                              ? controller.passwordError.value
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.purple.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                      )),
                  const SizedBox(height: 20),

                  // Confirm Password Field with validation
                  Obx(() => TextField(
                        controller: controller.confirmPasswordController,
                        decoration: InputDecoration(
                          hintText:  context.L.confirmPasswordHint,
                          errorText:
                              controller.confirmPasswordError.value.isNotEmpty
                                  ? controller.confirmPasswordError.value
                                  : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.purple.withOpacity(0.1),
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                      )),
                ],
              ),

              // Signup Button
              Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ElevatedButton(
                    onPressed: controller.onSignup,
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.purple,
                    ),
                    child: Text(
                      context.L.signUp,
                      style: const TextStyle(fontSize: 20),
                    ),
                  )),

              Center(child: Text( context.L.or)),

              // Sign In with Google Button
              Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.purple,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  AppImages.googleLogo),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Text(
                        context.L.signInWithGoogle,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        style: const TextStyle(color: Colors.purple),
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
