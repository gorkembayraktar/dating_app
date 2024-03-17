import 'package:dating_app/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class BaseStorageRepository {
  Future<void> uploadImage(User user, XFile image);
  Future<String> downloadURL(User user, String imageName);
}
