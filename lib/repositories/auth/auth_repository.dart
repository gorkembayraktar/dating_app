import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:dating_app/repositories/auth/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository{
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> signUp({required String email, required String password}) async {
    try {
      final credintial = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      final user = credintial.user;

      return user;
    } on auth.FirebaseAuthException catch(e){
      print(e);
    }catch (e) {
      // Catch any other unexpected exceptions
      print(e); // Log the error for debugging
    }
  }

  @override
  // TODO: implement user
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

}