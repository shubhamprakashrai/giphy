import 'package:giphyapp/app/modules/signup/models/signup_models.dart';
import '../../../services/firbaseService/firebase_service.dart';

class SignupRepository {
  
 SignupRepository._privateConstructor();
  static final SignupRepository _instance = SignupRepository._privateConstructor();
  factory SignupRepository() => _instance;


  final FirebaseService _firebaseService = FirebaseService();
  Future<UserModel?> signUp(String email, String password) {
    return _firebaseService.signUp(email, password);
  }
}