import 'package:dating_app/models/models.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser(String userId);
  Future<void> createUser(User user);
  Future<void> UpdateUser(User user);

  Future<void> updateUserImages(User user, String imageName);
}
