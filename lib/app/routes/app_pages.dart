import 'package:get/get.dart';

import '../../splash_screen.dart';
import '../modules/favoritepage/bindings/favoritepage_binding.dart';
import '../modules/favoritepage/views/favoritepage_view.dart';
import '../modules/forgetpassword/bindings/forgetpassword_binding.dart';
import '../modules/forgetpassword/views/forgetpassword_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITEPAGE,
      page: () => const FavouritePageView(),
      binding: FavoritepageBinding(),
    ),
    GetPage(
      name: _Paths.FORGETPASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetpasswordBinding(),
    ),
  ];
}
