import 'package:dating_app/models/models.dart';

abstract class BaseDatabaseRepository{
  Stream<User> getUser();
  Future<void> updateUserImages(String imageName);
}