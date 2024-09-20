import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/app_extension.dart';
import 'package:giphyapp/app/modules/signup/bindings/signup_binding.dart';
import 'package:giphyapp/app/modules/signup/views/signup_view.dart';
import 'package:giphyapp/app/services/language_service.dart';
import 'package:giphyapp/app/uiUtils/components/change_language.dart';
import 'package:giphyapp/app/uiUtils/components/customTextField.dart';
import 'package:giphyapp/app/uiUtils/components/custon_btn.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppLanguageService.services.languageChange,
        builder: (context, value, child) {
          return Directionality(
            textDirection: AppLanguageService.lang.direction,
            child: Scaffold(
              body: SafeArea(
                child: Container(
                  margin: const EdgeInsets.all(24),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const ChangeLanguage(),
                        const SizedBox(height: 30,),
                        _header(context),
                        const SizedBox(height: 10,),
                        _inputField(context),
                        const SizedBox(height: 20,),
                        _forgotPassword(context),
                        _signup(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.L.welcomeBack,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text(context.L.enterYourCred),
      ],
    );
  }

  Widget _inputField(BuildContext context) {
    final ctr = Get.find<LoginController>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          controller: ctr.emailController,
          hintText: context.L.email,
          prefixIcon: const Icon(Icons.person),
        ),
        // TextFormField(
        //   controller: ctr.emailController,
        //   decoration: InputDecoration(
        //     hintText: context.L.email,
        //     border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(18),
        //         borderSide: BorderSide.none),
        //     fillColor: Colors.purple.withOpacity(0.1),
        //     filled: true,
        //     prefixIcon: const Icon(Icons.person),
        //   ),
        // ),

        const SizedBox(height: 10),
        ValueListenableBuilder(
            valueListenable: ctr.passwordNotifier,
            builder: (context, val, ch) {
              return
              //   CustomTextField(
              //   controller: ctr.passwordController,
              //   hintText: context.L.password,
              //   prefixIcon: GestureDetector(
              //     onTap: () => ctr.passwordNotifier.value = !ctr.passwordNotifier.value,
              //     child: Icon(ctr.passwordNotifier.value, ? Icons.lock_open : Icons.lock_outline),
              //   ),
              //   obscureText: ctr.passwordNotifier.value,
              //   onFieldSubmitted: (_) => ctr.login(),
              // );
                CustomTextField(
                  controller: ctr.passwordController,
                  hintText: context.L.password,
                  prefixIcon: GestureDetector(
                    onTap: () => ctr.passwordNotifier.value = !ctr.passwordNotifier.value,
                    child: Icon(val ? Icons.lock_open : Icons.lock_outline),
                  ),
                  obscureText: ctr.passwordNotifier.value,
                  onFieldSubmitted: (_) => ctr.login(),
                );

              //   TextFormField(
              //   controller: ctr.passwordController,
              //   keyboardType: TextInputType.visiblePassword,
              //   decoration: InputDecoration(
              //     hintText: context.L.password,
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(18),
              //         borderSide: BorderSide.none
              //     ),
              //     fillColor: Colors.purple.withOpacity(0.1),
              //     filled: true,
              //     prefixIcon: GestureDetector(
              //         onTap: () => ctr.passwordNotifier.value = !ctr.passwordNotifier.value,
              //         child: Icon(val? Icons.lock_open: Icons.lock_outline)
              //     ),
              //   ),
              //   obscureText: ctr.passwordNotifier.value,
              //   onFieldSubmitted: (_) => ctr.login(),
              // );

            }
        ),
        const SizedBox(height: 10),
        Obx(() => CustomLoadingButton(
          text: context.L.login,
          isLoading: ctr.isLoading.value, // Boolean value to manage loading state
          onPressed: ctr.login,
        ))

      ],
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Forgot password logic here
      },
      child: Text(
        context.L.forgetPassword,
        style: const TextStyle(color: Colors.purple),
      ),
    );
  }

  Widget _signup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(context.L.dontHaveAccount),
        TextButton(
            onPressed: () {
              // Navigate to sign up page
              Get.off(const SignupView(),binding: SignupBinding());
            },
            child: Text(
              context.L.signUp,
              style: const TextStyle(color: Colors.purple),
            ))
      ],
    );
  }
}
