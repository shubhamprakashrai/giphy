import 'package:giphyapp/app/modules/signup/models/signup_models.dart';
import 'package:giphyapp/app/utils/firbaseService/firebaseService.dart';

class SignupRepository {
  final FirebaseService _firebaseService = FirebaseService();
  Future<UserModel?> signUp(String email, String password) {
    return _firebaseService.signUp(email, password);
  }
  
}