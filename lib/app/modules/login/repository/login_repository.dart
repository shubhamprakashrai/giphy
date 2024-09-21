import 'package:giphyapp/app/modules/signup/models/signup_models.dart';

import '../../../services/firbaseService/firebaseService.dart';


class LoginRepository {
  LoginRepository._privateConstructor();
  static final LoginRepository _instance = LoginRepository._privateConstructor();
  factory LoginRepository() => _instance;
  
  final FirebaseService _firebaseService = FirebaseService();

  // Calls the FirebaseService to log in the user
  Future<UserModel?> login(String email, String password) async {
    return await _firebaseService.signIn(email, password);
  }
}
