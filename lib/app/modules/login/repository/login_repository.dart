import 'package:giphyapp/app/modules/signup/models/signup_models.dart';
import 'package:giphyapp/app/utils/firbaseService/firebaseService.dart';

class LoginRepository {
  final FirebaseService _firebaseService = FirebaseService();

  // Calls the FirebaseService to log in the user
  Future<UserModel?> login(String email, String password) async {
    return await _firebaseService.signIn(email, password);
  }
}
