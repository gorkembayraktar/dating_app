import 'package:dating_app/models/models.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser(String userId);
  Future<String> createUser(User user);
  Future<void> UpdateUser(User user);

  Future<void> updateUserImages(User user, String imageName);
}
