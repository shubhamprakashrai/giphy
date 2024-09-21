import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/utils/app_constant/app_constants.dart';
import 'package:giphyapp/app/utils/app_constant/app_extension.dart';
import 'package:giphyapp/app/modules/home/bindings/home_binding.dart';
import 'package:giphyapp/app/modules/login/bindings/login_binding.dart';
import 'package:giphyapp/app/modules/login/views/login_view.dart';


import 'package:lottie/lottie.dart';

import 'app/services/firbaseService/firebaseService.dart';
import 'app/uiUtils/components/TabBarNavigation/tab_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize fade animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);
    _fadeController.forward();
    Timer(const Duration(milliseconds: 1100), () {
      _checkAuthenticationStatus();
    });
  }

  void _checkAuthenticationStatus() {
    User? user = FirebaseService().getCurrentUser();
    if (user != null) {
      Get.offAll(() => const TabBarNavigation(),binding: HomeBinding(),);
    } else {
      Get.offAll(() => const LoginView(), binding: LoginBinding());
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                AppImages.splashLottie,
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                context.L.loading,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
