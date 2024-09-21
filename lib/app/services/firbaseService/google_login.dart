import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphyapp/app/modules/home/bindings/home_binding.dart';
import 'package:giphyapp/app/uiUtils/components/TabBarNavigation/tab_navigation.dart';
import 'package:giphyapp/app/uiUtils/components/custom_snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  // Google SignIn
  static Future signInWithGoogle() async {
   try{

     await FirebaseAuth.instance.signOut();
     await GoogleSignIn().signOut();
     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

     // Get Authentication details
     final GoogleSignInAuthentication? gAuth = await googleUser?.authentication;

     final cred = GoogleAuthProvider.credential(accessToken: gAuth?.accessToken, idToken: gAuth?.idToken);

     // Now let's sign in
     await FirebaseAuth.instance.signInWithCredential(cred);

     CustomSnackBar.showSnackbar(
       title: 'Success',
       message: 'Login successful',
       isError: false,
     );
     Get.offAll(
           () => const TabBarNavigation(),
       binding: HomeBinding(),
     );
   }
   catch(e){
     debugPrint("error in signIn $e");
     CustomSnackBar.showSnackbar(
       title: 'Error',
       message: 'Login failed',
       isError: true,
     );
   }
  }
}
